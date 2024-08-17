extends Resource
class_name Species

const _Dictionary := {
	"Test" : {
		"SPEED" : 0.0,
		"POWER" : 0.0,
		"DEFENSE" : 0.0,
		"AI" : [-1.0, -1.0, 2.0],
		"TEXTURE" : "res://Resource/Texture/Game/Icon_Image.png",
		"SIZE" : 1.0,
		"PRICE" : 1.0,
	},
}

static func Get_Speed(_name : String) -> float: return _Dictionary[_name]["SPEED"]
static func Get_Power(_name : String) -> float: return _Dictionary[_name]["POWER"]
static func Get_Defense(_name : String) -> float: return _Dictionary[_name]["DEFENSE"]
static func Get_AI(_name : String) -> float: return _Dictionary[_name]["AI"]
static func Get_Texture(_name : String) -> String: return _Dictionary[_name]["TEXTURE"]
static func Get_Size(_name : String) -> float: return _Dictionary[_name]["SIZE"]
static func Get_Price(_name : String) -> float: return _Dictionary[_name]["PRICE"]
