extends Resource
class_name s_Enum

var _Value : String = ""
#var _Default : String = ""
var _Possibilities : Array[String] = []
var _Function : Callable

func Get_Position() -> int: return _Possibilities.find(_Value)
func Get() -> String: return _Value

func Set(_value : String) -> void:
	if (_Possibilities.has(_value)):
		_Value = _value
		_Function.call(_Value)

static func Create(_default : String, _possibilities : Array[String], _function : Callable) -> Resource:
	var _Return = s_Enum.new()
	_Return._Possibilities = _possibilities
	_Return._Value = [_default, _possibilities[0]][int(_possibilities.has(_default))]
	#_Return._Default = _default
	_Return._Function = _function
	_Return._Function.call(_Return._Value)
	return _Return
