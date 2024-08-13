extends Node
#class_name CE_Interface

const _Interfaces := {
	#BASIC
	"Popup" : "res://Code/Interface/Basic/001_Popup.tscn",
	"Consent" : "res://Code/Interface/Basic/002_Consent.tscn",
	"Text Input" : "res://Code/Interface/Basic/003_Text_Input.tscn",
	"Color Input" : "res://Code/Interface/Basic/004_Color_Input.tscn",
	#MENU
	"Menu" : "res://Code/Interface/Menu/001_Menu.tscn",
	"Options" : "res://Code/Interface/Menu/002_Options.tscn",
	"Options Dropdown" : "res://Code/Interface/Menu/003_Options_Dropdown.tscn",
	"Options Keybind" : "res://Code/Interface/Menu/004_Options_Keybind.tscn",
	"Credits" : "res://Code/Interface/Menu/005_Credits.tscn",
	#GAME
	"Nothing" : "res://Code/Interface/Game/001_Nothing.tscn",
	"Pause" : "res://Code/Interface/Game/002_Pause.tscn",
}
var _Scale : float = 1.0
var _Scale_Option : float = 1.0
var _Focused_Widgets : Array[Node] = []
var _Focused_Interfaces : Array[Node] = []

func Switch(_interface : String) -> void:
	var _interface_node = load(_Interfaces[_interface]).instantiate()
	Clear()
	_Focused_Interfaces.append(_interface_node)
	add_child(_interface_node)
	if (_interface_node.has_method("_process")): _interface_node._process(0.0) #prevents a bug where the UI rescales after 1 frame

func Add(_interface : String, _popup : bool = true) -> void:
	var _interface_node = load(_Interfaces[_interface]).instantiate()
	_Focused_Widgets.append(Get_Focused_Widget())
	if (_popup): _Focused_Interfaces.back().visible = false
	_Focused_Interfaces.back().set_process_input(false)
	_Focused_Interfaces.append(_interface_node)
	add_child(_interface_node)
	_interface_node._process(0.0) #prevents a bug where the UI rescales after 1 frame

func Return(_fallback_focus : Node = null) -> void:
	var _widget = _Focused_Widgets.back()
	var _interface = _Focused_Interfaces.back()
	_Focused_Widgets.pop_back()
	_Focused_Interfaces.pop_back()
	if (is_instance_valid(_widget) and _widget.is_inside_tree()): _widget.grab_focus()
	elif (is_instance_valid(_fallback_focus) and _fallback_focus.is_inside_tree()): _fallback_focus.grab_focus()
	remove_child(_interface)
	s_Delete.Add(_interface)
	_Focused_Interfaces.back().visible = true
	_Focused_Interfaces.back().set_process_input(true)

func Clear() -> void:
	for _old_interface in _Focused_Interfaces:
		remove_child(_old_interface)
		s_Delete.Add(_old_interface)
	_Focused_Widgets.clear()
	_Focused_Interfaces.clear()

func _process(_delta : float) -> void: _Scale = float(min(s_Window.Get().get_size().x+1, s_Window.Get().get_size().y+1)) / 1024
func Get_Scale() -> float: return _Scale * _Scale_Option
func Get_Anchor() -> float: return 1.0 / Get_Scale()
func Get_Focused_Widget() -> Node: return get_viewport().gui_get_focus_owner()
func Get_Current() -> Node: return _Focused_Interfaces.back()
