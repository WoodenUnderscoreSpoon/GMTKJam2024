extends Resource
class_name Fish

var _Species := ""
var _Size_Modifier := 1.0

static func Create(_species : String) -> Fish:
	var _return = Fish.new()
	_return._Species = _species
	_return._Size_Modifier = randf_range(0.6, 1.8)
	if (_species == "Penny" or _species == "Sand Dollar"): _return._Size_Modifier = 1.0
	return _return

func Get_Size() -> float: return Species.Get_Size(_Species) * _Size_Modifier
func Get_Price() -> float: return Species.Get_Price(_Species) * _Size_Modifier
