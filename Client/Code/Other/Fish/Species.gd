extends Resource
class_name Species

const _Dictionary := {
	#region Trash
	"Penny" : {
		"SPEED" : 0.0,
		"POWER" : 0.0,
		"DEFENSE" : 0.5,
		"AI" : [0.0],
		"TEXTURE" : "res://Resource/Texture/Fish/Trash/Penny.png",
		"SIZE" : 0.05,
		"PRICE" : 0.05,
	},
	"Dollar" : {
		"SPEED" : 0.5,
		"POWER" : 0.5,
		"DEFENSE" : 0.5,
		"AI" : [1.0, 0.0, -1.0, 0.0],
		"TEXTURE" : "res://Resource/Texture/Fish/Trash/Dollar.png",
		"SIZE" : 1.00,
		"PRICE" : 1.00,
	},
	#endregion
	#region Small
	"Ancheddar" : {
		"SPEED" : 0.8, #should never be more than like 3
		"POWER" : 0.9, #should never be more tahn like 1.5
		"DEFENSE" : 0.9, #should never be more than like 2
		"AI" : [-1.0, 0.0, 1.0],
		"TEXTURE" : "res://Resource/Texture/Fish/Small/Ancheddar.png",
		"SIZE" : 1.0,
		"PRICE" : 2.0,
	},
	"Briem" : {
		"SPEED" : 1.0, #should never be more than like 3
		"POWER" : 1.0, #should never be more tahn like 1.5
		"DEFENSE" : 0.9, #should never be more than like 2
		"AI" : [-1.0, 1.0, 2.5, -1.0],
		"TEXTURE" : "res://Resource/Texture/Fish/Small/Briem.png",
		"SIZE" : 1.0,
		"PRICE" : 1.0,
	},
	"Cheese Fish" : {
		"SPEED" : 1.0, #should never be more than like 3
		"POWER" : 1.0, #should never be more tahn like 1.5
		"DEFENSE" : 0.9, #should never be more than like 2
		"AI" : [-1.0, -1.0, 0.0, 2.5],
		"TEXTURE" : "res://Resource/Texture/Fish/Small/Cheese Fish.png",
		"SIZE" : 1.0,
		"PRICE" : 1.0,
	},
	#endregion
	##region Medium
	#"Test1" : {
		#"SPEED" : 1.0, #should never be more than like 3
		#"POWER" : 1.0, #should never be more tahn like 1.5
		#"DEFENSE" : 1.0, #should never be more than like 2
		#"AI" : [-1.0, -1.0, 2.5],
		#"TEXTURE" : "res://Resource/Texture/Fish/Test1.png",
		#"SIZE" : 1.0,
		#"PRICE" : 1.0,
	#},
	##endregion
	##region Large
	#"Test2" : {
		#"SPEED" : 2.0,
		#"POWER" : 1.5,
		#"DEFENSE" : 1.5,
		#"AI" : [1.0, -1.0, 1.5, -1.5],
		#"TEXTURE" : "res://Resource/Texture/Fish/Test2.png",
		#"SIZE" : 51.0,
		#"PRICE" : 10.0,
	#},
	##endregion
	##region Huge
	#"Test3" : {
		#"SPEED" : 3.0,
		#"POWER" : 1.5,
		#"DEFENSE" : 2.0,
		#"AI" : [1.0, -1.0, -1.0, 1.0],
		#"TEXTURE" : "res://Resource/Texture/Fish/Test3.png",
		#"SIZE" : 101.0,
		#"PRICE" : 50.0,
	#},
	##endregion
}

static func Get_Speed(_name : String) -> float: return _Dictionary[_name]["SPEED"]
static func Get_Power(_name : String) -> float: return _Dictionary[_name]["POWER"]
static func Get_Defense(_name : String) -> float: return _Dictionary[_name]["DEFENSE"]
static func Get_AI(_name : String) -> Array: return _Dictionary[_name]["AI"]
static func Get_Texture(_name : String) -> String: return _Dictionary[_name]["TEXTURE"]
static func Get_Size(_name : String) -> float: return _Dictionary[_name]["SIZE"]
static func Get_Price(_name : String) -> float: return _Dictionary[_name]["PRICE"]
