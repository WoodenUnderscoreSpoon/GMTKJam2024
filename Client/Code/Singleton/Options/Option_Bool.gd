extends Resource
class_name CE_Bool

var _Value : bool = false
#var _Default : bool = false
var _Function : Callable

func Get() -> bool: return _Value

func Set(_value : bool) -> void:
	_Value = _value
	_Function.call(_Value)

static func Create(_default : bool, _function : Callable) -> Resource:
	var _Return = CE_Bool.new()
	_Return._Value = _default
	#_Return._Default = _default
	_Return._Function = _function
	_Return._Function.call(_Return._Value)
	return _Return
