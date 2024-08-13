extends Node
#class_name CE_Debug

enum {STATIC = 0, METHOD, VARIABLE}
var _Values := {}
var _Timer := Timer.new()

func _ready() -> void:
	#OVERLAY
	var _Overlay = preload("res://003_Code/001_Singleton/005_Debug/Overlay.tscn").instantiate()
	add_child(_Overlay)
	#TIMER
	_Timer.name = "Update"
	_Timer.autostart = true
	_Timer.wait_time = 0.25
	add_child(_Timer)
	#if (CE_Game.Is_Debug()): Set_Visible(true)

func Set_Visible(_visible : bool) -> void:
	if (_visible):
		Update()
		_Timer.timeout.connect(Update)
	else: _Timer.timeout.disconnect(Update)
	$"Overlay".visible = _visible

func Update() -> void:
	var _text = ""
	for _name in _Values.keys():
		var _value = _Values[_name]
		var _string = ""
		if (_value[0] == STATIC): _string = str(_value[1])
		elif (_value[0] == METHOD):
			if (_value[1].is_valid()): _string = str(_value[1].call())
			if (_value[2] != null): _string = _value[2].call(_string)
		elif (_value[0] == VARIABLE):
			if (is_instance_valid(_value[1])): _string = str(_value[1].get(_value[2]))
			if (_value[3] != null): _string = _value[3].call(_string)
		_text += _name + " = " + _string + "\n"
	$"Overlay/Text".text = _text

func _input(_event : InputEvent) -> void: if (_event.is_action_pressed("F1")): Set_Visible(!Is_Visible())
func Add_Static(_name : String, _value : Variant, _function : Variant = null) -> void: _Values[_name] = [STATIC, _value]
func Add_Method(_name : String, _callable : Callable, _function : Variant = null) -> void: _Values[_name] = [METHOD, _callable, _function]
func Add_Variable(_name : String, _parent : Object, _method : String, _function : Variant = null) -> void: _Values[_name] = [VARIABLE, _parent, _method, _function]
func Remove(_name : String) -> void: _Values.erase(_name)
func Is_Visible() -> bool: return $"Overlay".visible
static func Framerate_To_String(_data : String) -> String: return _data + " FPS"
static func Memory_To_String(_data : String) -> String: return String.humanize_size(int(_data))
static func Power_To_String(_data : String) -> String: return ["Infinite", _data + "%"][int(_data != "-1")]
