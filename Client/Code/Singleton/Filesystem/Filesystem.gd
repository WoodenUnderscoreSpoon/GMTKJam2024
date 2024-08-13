extends Node
class_name s_Filesystem

static func Get_Config_File(_path : String, _password : String = "") -> s_Config_File: return s_Config_File.new().Load(_path, _password)
static func Get_Files(_path : String) -> Array: return [] if (!Get_Folder_Exist(_path)) else Array(DirAccess.get_files_at(s_Game.Get_Path() + _path))
static func Get_Folders(_path : String) -> Array: return [] if (!Get_Folder_Exist(_path)) else Array(DirAccess.get_directories_at(s_Game.Get_Path() + _path))
static func Get_Folder_Exist(_path : String) -> bool: return DirAccess.dir_exists_absolute(s_Game.Get_Path() + _path)

static func Delete(_path : String) -> void:
	if (DirAccess.dir_exists_absolute(s_Game.Get_Path() + _path)):
		for _file in Get_Files(_path): DirAccess.remove_absolute(s_Game.Get_Path() + _path + "/" + _file)
		for _folder in Get_Folders(_path): Delete(_path + "/" + _folder)
	DirAccess.remove_absolute(s_Game.Get_Path() + _path)
