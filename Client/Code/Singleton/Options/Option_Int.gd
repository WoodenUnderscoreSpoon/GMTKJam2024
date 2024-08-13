extends Resource
class_name s_Int

var _Value : int = 0
#var _Default : int = 0
var _Min : int = -9223372036854775808
var _Max : int = 9223372036854775807
var _Function : Callable
var _Function_Display : Callable
@warning_ignore("unused_private_class_variable")
var _Update_On_Release : bool = false

func Get_String() -> String: return _Function_Display.call(_Value)
func Get() -> int: return _Value

func Set(_value : int) -> void:
	_Value = clampi(_value, _Min, _Max)
	_Function.call(_Value)

static func Create(_default : int, _min : int, _max : int, _function : Callable, _function_display : Callable, _update_on_release : bool = false) -> Resource:
	var _Return = s_Int.new()
	_Return._Min = _min
	_Return._Max = _max
	_Return._Value = clampi(_default, _min, _max)
	#_Return._Default = _default
	_Return._Function = _function
	_Return._Function_Display = _function_display
	_Return._Function.call(_Return._Value)
	_Return._Update_On_Release = _update_on_release
	return _Return
