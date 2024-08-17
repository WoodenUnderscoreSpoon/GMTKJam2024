extends Resource
class_name Species

const _Dictionary := {
	"Test1" : {
		"SPEED" : 1.0, #should never be more than like 3
		"POWER" : 1.0, #should never be more tahn like 1.5
		"DEFENSE" : 1.0, #should never be more than like 2
		"AI" : [-1.0, -1.0, 2.5],
		"TEXTURE" : "res://Resource/Texture/Fish/Test1.png",
		"SIZE" : 1.0,
		"PRICE" : 1.0,
	},
	"Test2" : {
		"SPEED" : 2.0,
		"POWER" : 1.5,
		"DEFENSE" : 1.5,
		"AI" : [1.0, -1.0, 1.5, -1.5],
		"TEXTURE" : "res://Resource/Texture/Fish/Test2.png",
		"SIZE" : 10.0,
		"PRICE" : 10.0,
	},
	"Test3" : {
		"SPEED" : 3.0,
		"POWER" : 1.5,
		"DEFENSE" : 2.0,
		"AI" : [1.0, -1.0, -1.0, 1.0],
		"TEXTURE" : "res://Resource/Texture/Fish/Test3.png",
		"SIZE" : 50.0,
		"PRICE" : 50.0,
	},
}

static func Get_Speed(_name : String) -> float: return _Dictionary[_name]["SPEED"]
static func Get_Power(_name : String) -> float: return _Dictionary[_name]["POWER"]
static func Get_Defense(_name : String) -> float: return _Dictionary[_name]["DEFENSE"]
static func Get_AI(_name : String) -> Array: return _Dictionary[_name]["AI"]
static func Get_Texture(_name : String) -> String: return _Dictionary[_name]["TEXTURE"]
static func Get_Size(_name : String) -> float: return _Dictionary[_name]["SIZE"]
static func Get_Price(_name : String) -> float: return _Dictionary[_name]["PRICE"]
