extends Node
#class_name CE_Control

const _Texture_Mouse := preload("res://Resource/Texture/Interface/Controls/Mouse.png")
const _Texture_Keyboard := preload("res://Resource/Texture/Interface/Controls/Keyboard.png")
const _Texture_Controller := preload("res://Resource/Texture/Interface/Controls/Controller.png")

func Get_Keyboard_Layout_Name() -> String: return DisplayServer.keyboard_get_layout_name(DisplayServer.keyboard_get_current_layout())

func Event_To_Array(_event : InputEvent) -> Variant:
	if   (_event is InputEventKey): return [0, _event.physical_keycode]
	elif (_event is InputEventMouseButton): return [1, _event.button_index]
	elif (_event is InputEventJoypadButton): return [2, _event.button_index]
	else: return null

func Array_To_Event(_key : Variant) -> Variant:
	var _event = null
	if (_key is Array):
		if (_key[0] == 0):
			_event = InputEventKey.new()
			_event.physical_keycode = _key[1]
		elif (_key[0] == 1):
			_event = InputEventMouseButton.new()
			_event.button_index = _key[1]
		elif (_key[0] == 2):
			_event = InputEventJoypadButton.new()
			_event.button_index = _key[1]
	return _event

func Get_Text_From_Controller(_index : int) -> String:
	var _controller = s_Options._Options["CONTROLLER"].Get_Position()
	var _option = s_Options._Options["CONTROLLER"].Get()
	match _index:
		0 : return ["A", "Cross", "B"][_controller]
		1 : return ["B", "Circle", "A"][_controller]
		2 : return ["X", "Square", "Y"][_controller]
		3 : return ["Y", "Triangle", "X"][_controller]
		4 : return ["Back", "Select", "-"][_controller]
		5 : return ["Home", "PS", "Unknown"][_controller]
		6 : return ["Start", "Start", "+"][_controller]
		7 : return "L3"
		8 : return "R3"
		9 : return "L1"
		10 : return "R1"
		11 : return "DPad Up"
		12 : return "DPad Down"
		13 : return "DPad Left"
		14 : return "DPad Right"
		15 : return ["Microphone", "Share", "Capture"][_controller]
		16 : return "Paddle1"
		17 : return "Paddle2"
		18 : return "Paddle3"
		19 : return "Paddle4"
		20 : return "Touchpad"
		_ : return "Unknown"

func Get_Text_And_Icon(_event : InputEvent) -> Array:
	#KEYBOARD
	if (_event is InputEventKey): return [_event.as_text().trim_suffix(" (Physical)"), _Texture_Keyboard]
	#MOUSE
	elif (_event is InputEventMouseButton):
		match _event.get_button_index():
			MOUSE_BUTTON_LEFT : return ["Left Click", _Texture_Mouse]
			MOUSE_BUTTON_RIGHT : return ["Right Click", _Texture_Mouse]
			MOUSE_BUTTON_MIDDLE : return ["Middle Click", _Texture_Mouse]
			MOUSE_BUTTON_XBUTTON1 : return ["Extra Button 1", _Texture_Mouse]
			MOUSE_BUTTON_XBUTTON2 : return ["Extra Button 2", _Texture_Mouse]
			MOUSE_BUTTON_WHEEL_UP : return ["Wheel Up", _Texture_Mouse]
			MOUSE_BUTTON_WHEEL_DOWN : return ["Wheel Down", _Texture_Mouse]
			MOUSE_BUTTON_WHEEL_LEFT : return ["Wheel Left", _Texture_Mouse]
			MOUSE_BUTTON_WHEEL_RIGHT : return ["Wheel Right", _Texture_Mouse]
			_ : return ["Unknown", null]
	#JOYPAD
	elif (_event is InputEventJoypadButton): return [Get_Text_From_Controller(_event.get_button_index()), _Texture_Controller]
	else: return ["Unknown", null]
