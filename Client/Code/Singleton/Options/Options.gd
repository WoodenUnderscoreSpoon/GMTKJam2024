extends Node
#class_name s_Option

@warning_ignore("unused_signal") signal CONTROLLER_CHANGED
@warning_ignore("unused_signal") signal LANGUAGE_CHANGED
@onready var _File_Options := s_Filesystem.Get_Config_File("Profile/Options.txt")
#@onready var _File_Keybinds := s_Filesystem.Get_Config_File("Profile/Keybinds.txt")
@onready var _File_Keybinds := s_Filesystem.Get_Config_File("Profile/Keybinds.txt", "HAMEL1994")
@onready var _Options : Dictionary = {
	#VIDEO
	"FULLSCREEN" : s_Bool.Create(false, Change_Fullscreen),
	"VSYNC" : s_Bool.Create(true, Change_VSync),
	"FRAMERATE" : s_Int.Create(2, 0, 4, Change_Framerate, Display_Framerate),
	#"ANTIALIASING" : s_Int.Create(0, 0, 3),
	#"SHADOW_QUALITY" : s_Int.Create(6, 0, 6),
	#AUDIO
	"MASTER_VOLUME" : s_Int.Create(50, 0, 100, Change_Master_Volume, Display_Volume),
	"MUSIC_VOLUME" : s_Int.Create(50, 0, 100, Change_Music_Volume, Display_Volume),
	"AMBIENT_VOLUME" : s_Int.Create(50, 0, 100, Change_Ambient_Volume, Display_Volume),
	"SOUND_VOLUME" : s_Int.Create(50, 0, 100, Change_Sound_Volume, Display_Volume),
	#"FOOTSTEP_VOLUME" : s_Int.Create(50, 0, 100, Change_Footstep_Volume, Display_Volume),
	#"TAUNT_VOLUME" : s_Int.Create(50, 0, 100, Change_Taunt_Volume, Display_Volume),
	#GENERAL
	"UI_SCALE" : s_Int.Create(50, 25, 75, Change_UI_Scale, Display_UI_Scale, true),
	#"CAMERA_SENSITIVITY" : s_Int.Create(100, 1, 200, Change_Camera_Sensitivity, Display_Camera_Sensitivity),
	#"LANGUAGE" : s_Enum.Create("English", ["English"], Change_Language), #s_Language.v_Languages.keys(),
	"CONTROLLER" : s_Enum.Create("XBox", ["XBox", "Playstation", "Nintendo"], Change_Controller),
}
@onready var _Keybinds : Dictionary = {
	"MOVE_LEFT" : [[0, 65], [0, 4194319], [2, 13]],
	"MOVE_RIGHT" : [[0, 68], [0, 4194321], [2, 14]],
	"JUMP" : [[0, 87], [0, 32], [2, 0]],
	"SQUEAK" : [[0, 83], [0, 4194322], [2, 3]],
	"INTERACT" : [[0, 69], null, [2, 1]],
	"OPEN_JOURNAL" : [[0, 74], null, [2, 2]],
}

func _ready() -> void:
	#OPTIONS
	for _name in _Options.keys(): _Options[_name].Set(_File_Options.Get("OPTIONS", _name, _Options[_name].Get()))
	#KEYBINDS
	#var _version = _File_Keybinds.Get("KEYBINDS", "VERSION", "1.0.0.0")
	#if (s_Version_Control.Is_Greater_Or_Equal(_version, "1.5.0.0")): pass
	for _name in _Keybinds.keys():
		_Keybinds[_name] = _File_Keybinds.Get("KEYBINDS", _name, _Keybinds[_name])
		InputMap.action_erase_events(_name)
		for _i in _Keybinds[_name].size(): if (_Keybinds[_name][_i] != null): InputMap.action_add_event(_name, s_Control.Array_To_Event(_Keybinds[_name][_i]))
	#_File_Keybinds.Set("KEYBINDS", "VERSION", s_Game.Get_Version())
	#_File_Keybinds.Save()

func Save() -> void:
	for _name in _Options.keys(): _File_Options.Set("OPTIONS", _name, _Options[_name].Get())
	_File_Options.Save()
	for _name in _Keybinds.keys(): _File_Keybinds.Set("KEYBINDS", _name, _Keybinds[_name])
	_File_Keybinds.Save()

static func Change_Fullscreen(_value : bool) -> void: s_Window.Set_Fullscreen(_value)
static func Change_VSync(_value : bool) -> void: DisplayServer.window_set_vsync_mode([DisplayServer.VSYNC_DISABLED, DisplayServer.VSYNC_ENABLED][int(_value)])
static func Change_Framerate(_value : int) -> void: Engine.max_fps = [0, 30, 60, 120, 240][_value]
static func Change_Master_Volume(_value : int) -> void: AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db(float(_value) / 100))
static func Change_Music_Volume(_value : int) -> void: AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), linear_to_db(float(_value) / 100))
static func Change_Ambient_Volume(_value : int) -> void: AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Ambient"), linear_to_db(float(_value) / 100))
static func Change_Sound_Volume(_value : int) -> void: AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Sound"), linear_to_db(float(_value) / 100))
#static func Change_Footstep_Volume(_value : int) -> void: AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Footstep"), linear_to_db(float(_value) / 100))
#static func Change_Taunt_Volume(_value : int) -> void: AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Taunt"), linear_to_db(float(_value) / 100))
static func Change_UI_Scale(_value : int) -> void: s_Interface._Scale_Option = remap(float(_value), 0, 150, 0.5, 2.0)
static func Change_Camera_Sensitivity(_value : int) -> void: pass
static func Change_Language(_value : String) -> void: s_Options.LANGUAGE_CHANGED.emit()
static func Change_Controller(_value : String) -> void: s_Options.CONTROLLER_CHANGED.emit()

static func Display_Framerate(_value : int) -> String: return ["Unlimited", str(30.0 * pow(2.0, _value - 1)) + " FPS"][int(_value > 0)]
static func Display_Volume(_value : int) -> String: return str(_value) + "%"
static func Display_UI_Scale(_value : int) -> String: return str(remap(float(_value), 0, 150, 0.5, 2.0)) + "x"
static func Display_Camera_Sensitivity(_value : int) -> String: return str(float(_value) / 100) + "x"
