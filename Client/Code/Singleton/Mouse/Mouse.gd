extends Node
#class_name s_Mouse

var _Mode := Input.MOUSE_MODE_VISIBLE #Mode before a capture
var _Position : Vector2i = Vector2i.ZERO #Position before a capture

func Set_Position(_position : Vector2i) -> void: Input.warp_mouse(_position)
func Get_Position() -> Vector2: return get_viewport().get_mouse_position()

func Set_Visible(_bool : bool) -> void:
	var _mode = [Input.mouse_mode, _Mode][int(Input.mouse_mode == Input.MOUSE_MODE_CAPTURED)]
	var _confined = (_mode == Input.MOUSE_MODE_CONFINED or _mode == Input.MOUSE_MODE_CONFINED_HIDDEN)
	var _visible = _bool
	if (_confined): _mode = [Input.MOUSE_MODE_CONFINED_HIDDEN, Input.MOUSE_MODE_CONFINED][int(_visible)]
	else: _mode = [Input.MOUSE_MODE_HIDDEN, Input.MOUSE_MODE_VISIBLE][int(_visible)]
	if (Input.mouse_mode != Input.MOUSE_MODE_CAPTURED): Input.mouse_mode = _mode
	else: _Mode = _mode

func Set_Confined(_bool : bool) -> void:
	var _mode = [Input.mouse_mode, _Mode][int(Input.mouse_mode == Input.MOUSE_MODE_CAPTURED)]
	var _confined = _bool
	var _visible = (_mode == Input.MOUSE_MODE_VISIBLE or _mode == Input.MOUSE_MODE_CONFINED)
	if (_confined): _mode = [Input.MOUSE_MODE_CONFINED_HIDDEN, Input.MOUSE_MODE_CONFINED][int(_visible)]
	else: _mode = [Input.MOUSE_MODE_HIDDEN, Input.MOUSE_MODE_VISIBLE][int(_visible)]
	if (Input.mouse_mode != Input.MOUSE_MODE_CAPTURED): Input.mouse_mode = _mode
	else: _Mode = _mode

func Set_Captured(_bool : bool) -> void:
	var _captured = Input.mouse_mode == Input.MOUSE_MODE_CAPTURED
	if (_bool and !_captured):
		_Mode = Input.mouse_mode
		_Position = Get_Position()
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	elif (_captured):
		Input.mouse_mode = _Mode
		Set_Position(_Position)
