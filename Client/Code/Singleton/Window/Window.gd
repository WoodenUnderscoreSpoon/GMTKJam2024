extends Node
#class_name s_Window

@onready var _File_Window : s_Config_File = s_Filesystem.Get_Config_File("Profile/Window.txt")
var _Maximized : bool = false
var _Fullscreen : bool = false
var _Timer : Timer = Timer.new()

func _ready() -> void:
	#WINDOW
	DisplayServer.set_icon(preload("res://Resource/Texture/Game/Icon_Image.png"))
	var _window = Get()
	_window.title = s_Game.Get_Name()
	_window.min_size = Vector2i(640, 480)
	var _position_x = _File_Window.Get("WINDOW", "POSITION_X", null)
	var _position_y = _File_Window.Get("WINDOW", "POSITION_Y", null)
	var _size_x = _File_Window.Get("WINDOW", "SIZE_X", _window.get_size_with_decorations().x)
	var _size_y = _File_Window.Get("WINDOW", "SIZE_Y", _window.get_size_with_decorations().y)
	if (_position_x == null): _position_x = _window.get_position_with_decorations().x - _size_x / 2
	if (_position_y == null): _position_y = _window.get_position_with_decorations().y - _size_y / 2
	_window.position.x = _position_x
	_window.position.y = _position_y
	_window.size.x = _size_x
	_window.size.y = _size_y
	_window.borderless = false
	_Maximized = _File_Window.Get("WINDOW", "MAXIMIZED", false)
	_Fullscreen = _File_Window.Get("WINDOW", "FULLSCREEN", false)
	if (_Maximized): _window.mode = Window.MODE_MAXIMIZED
	if (_Fullscreen): _window.mode = Window.MODE_FULLSCREEN
	_window.move_to_foreground()
	#TIMER
	_Timer.name = "Autosave"
	_Timer.autostart = true
	_Timer.one_shot = false
	_Timer.wait_time = 0.5
	_Timer.timeout.connect(Save)
	add_child(_Timer)

func _notification(_what : int) -> void: if (_what == NOTIFICATION_WM_CLOSE_REQUEST): s_Game.Quit()
func Get() -> Window: return $"/root"
func Get_Size() -> Vector2i: return Get().size
func Is_Maximized() -> bool: return _Maximized
func Is_Fullscreen() -> bool: return _Fullscreen

func Set_Fullscreen(_fullscreen : bool) -> void:
	_Fullscreen = _fullscreen
	if (_fullscreen):
		_Maximized = (Get().mode == Window.MODE_MAXIMIZED)
		Get().mode = Window.MODE_FULLSCREEN
	else: Get().mode = [Window.MODE_WINDOWED, Window.MODE_MAXIMIZED][int(_Maximized)]

func Save() -> void:
	var _window = Get()
	var _fullscreen = (_window.mode == Window.MODE_FULLSCREEN)
	_File_Window.Set("WINDOW", "FULLSCREEN", _fullscreen)
	if (!_fullscreen):
		var _maximized = (_window.mode == Window.MODE_MAXIMIZED)
		_File_Window.Set("WINDOW", "MAXIMIZED", _maximized)
		if (!_maximized):
			_File_Window.Set("WINDOW", "POSITION_X", _window.get_position_with_decorations().x)
			_File_Window.Set("WINDOW", "POSITION_Y", _window.get_position_with_decorations().y)
			_File_Window.Set("WINDOW", "SIZE_X", _window.get_size_with_decorations().x)
			_File_Window.Set("WINDOW", "SIZE_Y", _window.get_size_with_decorations().y)
	_File_Window.Save()
