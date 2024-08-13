extends Node
class_name CE_Config_File

var _Path : String = ""
var _Password : String = ""
var _Config_File : ConfigFile = ConfigFile.new()
var _Modified : bool = false

func Load(_path : String, _password : String = "") -> CE_Config_File:
	_Path = _path
	_Password = _password
	var _error = ERR_UNAVAILABLE
	if (_Password == ""): _error = _Config_File.load(s_Game.Get_Path() + _Path)
	else: _error = _Config_File.load_encrypted_pass(s_Game.Get_Path() + _Path, _Password)
	if (_error == ERR_FILE_CORRUPT): GD3_To_GD4()
	#_Config_File.save(CE_Game.Get_Path() + "test.txt") #decrypt
	return self

func Get(_section : String, _key : String, _default = null) -> Variant:
	if (_Config_File.has_section_key(_section, _key)): return _Config_File.get_value(_section, _key, _default)
	else: return _default

func Set(_section : String, _key : String, _value = null) -> void:
	if (Get(_section, _key, null) != _value):
		_Modified = true
		_Config_File.set_value(_section, _key, _value)

func Save() -> void:
	if (_Modified):
		_Modified = false
		DirAccess.make_dir_recursive_absolute((s_Game.Get_Path() + _Path).get_base_dir())
		var _error = ERR_UNAVAILABLE
		if (_Password == ""): _error = _Config_File.save(s_Game.Get_Path() + _Path)
		else: _error = _Config_File.save_encrypted_pass(s_Game.Get_Path() + _Path, _Password)

func GD3_To_GD4() -> void:
	# read file
	var f = FileAccess.open(_Path, FileAccess.READ)
	f.get_32() # magic, should be 0x43454447
	f.get_32() # mode, ignore
	f.get_buffer(16) # md5, you can check if decrypted data md5 hash match to verify it's ok
	var length = f.get_64() # decrypted data length
	var ds = length # encrypted data length, adjusted to block size
	if (ds % 16): ds += 16 - (ds % 16)
	var data = f.get_buffer(ds)
	var aes = AESContext.new()
	aes.start(AESContext.MODE_ECB_DECRYPT, _Password.md5_text().to_ascii_buffer())
	var decrypted = aes.update(data)
	aes.finish()
	decrypted.resize(length)
	f.close()
	# parse config
	var cf = ConfigFile.new()
	cf.parse(decrypted.get_string_from_utf8())
	_Config_File = cf
