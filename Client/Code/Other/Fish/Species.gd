extends Resource
class_name Fish

const _Dictionary := {
	"Test" : {
		"DIFFICULTY" : 0.0,
		"TEXTURE" : "res://Resource/Texture/Game/Icon_Image.png",
		"SIZE" : 1.0,
	},
}

static func Get_Difficulty(_name : String) -> float: return _Dictionary[_name]["DIFFICULTY"]
static func Get_Texture(_name : String) -> String: return _Dictionary[_name]["TEXTURE"]
static func Get_Size(_name : String) -> float: return _Dictionary[_name]["SIZE"]
