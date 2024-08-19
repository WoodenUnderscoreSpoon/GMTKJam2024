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
		"SIZE" : 19.05,
		"PRICE" : 0.01,
		"PERMIT" : 0,
		"DESCRIPTION" : "",
	},
	"Sand Dollar" : {
		"SPEED" : 0.5,
		"POWER" : 0.5,
		"DEFENSE" : 0.5,
		"AI" : [1.0, 0.0, -1.0, 0.0],
		"TEXTURE" : "res://Resource/Texture/Fish/Trash/Dollar.png",
		"SIZE" : 156.0,
		"PRICE" : 1.00,
		"PERMIT" : 0,
		"DESCRIPTION" : "",
	},
	#endregion
	#region Small
	"Ancheddar" : {
		"SPEED" : 0.8, #should never be more than like 3
		"POWER" : 0.9, #should never be more tahn like 1.5
		"DEFENSE" : 0.9, #should never be more than like 2
		"AI" : [-1.0, 0.0, 1.0],
		"TEXTURE" : "res://Resource/Texture/Fish/Small/Ancheddar.png",
		"SIZE" : 200.0,
		"PRICE" : 4.25,
		"PERMIT" : 1,
		"DESCRIPTION" : "",
	},
	"Briem" : {
		"SPEED" : 1.0, #should never be more than like 3
		"POWER" : 1.0, #should never be more tahn like 1.5
		"DEFENSE" : 0.9, #should never be more than like 2
		"AI" : [-1.0, 1.0, 2.5, -1.0],
		"TEXTURE" : "res://Resource/Texture/Fish/Small/Briem.png",
		"SIZE" : 425.0,
		"PRICE" : 5.00,
		"PERMIT" : 1,
		"DESCRIPTION" : "",
	},
	"Curdchin" : {
		"SPEED" : 0.8, #should never be more than like 3
		"POWER" : 1.1, #should never be more tahn like 1.5
		"DEFENSE" : 0.9, #should never be more than like 2
		"AI" : [-1.0, 1.0],
		"TEXTURE" : "res://Resource/Texture/Fish/Small/Curdchin.png",
		"SIZE" : 180.0,
		"PRICE" : 4.00,
		"PERMIT" : 1,
		"DESCRIPTION" : "",
	},
	"Fetta Fish" : {
		"SPEED" : 1.0, #should never be more than like 3
		"POWER" : 1.0, #should never be more tahn like 1.5
		"DEFENSE" : 0.9, #should never be more than like 2
		"AI" : [-1.0, -1.0, -1.0, 2.5],
		"TEXTURE" : "res://Resource/Texture/Fish/Small/FettaFish.png",
		"SIZE" : 76.2,
		"PRICE" : 4.50,
		"PERMIT" : 1,
		"DESCRIPTION" : "",
	},
	"Sardanish" : {
		"SPEED" : 1.0, #should never be more than like 3
		"POWER" : 1.0, #should never be more tahn like 1.5
		"DEFENSE" : 0.9, #should never be more than like 2
		"AI" : [-1.5, 1.0],
		"TEXTURE" : "res://Resource/Texture/Fish/Small/Sardanish.png",
		"SIZE" : 220.0,
		"PRICE" : 4.75,
		"PERMIT" : 1,
		"DESCRIPTION" : "",
	},
	"Cheese Fish" : {
		"SPEED" : 1.0, #should never be more than like 3
		"POWER" : 1.0, #should never be more tahn like 1.5
		"DEFENSE" : 1.0, #should never be more than like 2
		"AI" : [-1.0, -1.0, 0.0, 2.5],
		"TEXTURE" : "res://Resource/Texture/Fish/Medium/Cheese Fish.png",
		"SIZE" : 100.0,
		"PRICE" : 5.00,
		"PERMIT" : 1,
		"DESCRIPTION" : "",
	},
	#endregion
	#region Medium
	"Codage Cheese" : {
		"SPEED" : 1.0, #should never be more than like 3
		"POWER" : 1.0, #should never be more tahn like 1.5
		"DEFENSE" : 1.1, #should never be more than like 2
		"AI" : [-1.0, -1.0, 2.5],
		"TEXTURE" : "res://Resource/Texture/Fish/Medium/CoddageCheese.png",
		"SIZE" : 863.6,
		"PRICE" : 10.00,
		"PERMIT" : 2,
		"DESCRIPTION" : "",
	},
	"Colby Jackfish" : {
		"SPEED" : 0.9, #should never be more than like 3
		"POWER" : 1.2, #should never be more tahn like 1.5
		"DEFENSE" : 1.1, #should never be more than like 2
		"AI" : [-1.0, 0.5, 2.5],
		"TEXTURE" : "res://Resource/Texture/Fish/Medium/ColbyJackfish.png",
		"SIZE" : 1010.0,
		"PRICE" : 12.00,
		"PERMIT" : 2,
		"DESCRIPTION" : "",
	},
	"Emmentalapia" : {
		"SPEED" : 1.2, #should never be more than like 3
		"POWER" : 1.0, #should never be more tahn like 1.5
		"DEFENSE" : 1.0, #should never be more than like 2
		"AI" : [-1.0, -1.0, -1.5, 2.0],
		"TEXTURE" : "res://Resource/Texture/Fish/Medium/Emmentalapia.png",
		"SIZE" : 533.4,
		"PRICE" : 8.00,
		"PERMIT" : 2,
		"DESCRIPTION" : "",
	},
	"Raycotta" : {
		"SPEED" : 1.2, #should never be more than like 3
		"POWER" : 1.3, #should never be more tahn like 1.5
		"DEFENSE" : 1.3, #should never be more than like 2
		"AI" : [-1.0, -1.0, 2.5],
		"TEXTURE" : "res://Resource/Texture/Fish/Medium/Raycotta.png",
		"SIZE" : 3096.0,
		"PRICE" : 11.00,
		"PERMIT" : 2,
		"DESCRIPTION" : "",
	},
	"Salmontforte" : {
		"SPEED" : 1.0, #should never be more than like 3
		"POWER" : 1.3, #should never be more tahn like 1.5
		"DEFENSE" : 1.2, #should never be more than like 2
		"AI" : [-1.0, -1.0, 3.0, -1.0],
		"TEXTURE" : "res://Resource/Texture/Fish/Medium/Salmontforte.png",
		"SIZE" : 1473.2,
		"PRICE" : 15.00,
		"PERMIT" : 2,
		"DESCRIPTION" : "",
	},
	#endregion
	##region Large
	#"Test2" : {
		#"SPEED" : 2.0,
		#"POWER" : 1.5,
		#"DEFENSE" : 1.5,
		#"AI" : [1.0, -1.0, 1.5, -1.5],
		#"TEXTURE" : "res://Resource/Texture/Fish/Test2.png",
		#"SIZE" : 120.0,
		#"PRICE" : 10.00,
		#"PERMIT" : 3,
		#"DESCRIPTION" : "",
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
		#"PRICE" : 50.00,
		#"PERMIT" : 4,
		#"DESCRIPTION" : "",
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
static func Get_Permit(_name : String) -> int: return _Dictionary[_name]["PERMIT"]
static func Get_Description(_name : String) -> String: return _Dictionary[_name]["DESCRIPTION"]
