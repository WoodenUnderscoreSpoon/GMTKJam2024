extends Resource
class_name s_UUID

static func Get_Random_Int() -> int:
	#Randomize every time to minimize the risk of collisions
	randomize()
	return randi() % 256

static func Get_Bin() -> Array:
	#16 random bytes with the bytes on index 6 and 8 modified
	return [
	Get_Random_Int(), Get_Random_Int(), Get_Random_Int(), Get_Random_Int(),
	Get_Random_Int(), Get_Random_Int(), ((Get_Random_Int()) & 0x0f) | 0x40, Get_Random_Int(),
	((Get_Random_Int()) & 0x3f) | 0x80, Get_Random_Int(), Get_Random_Int(), Get_Random_Int(),
	Get_Random_Int(), Get_Random_Int(), Get_Random_Int(), Get_Random_Int(),
	]

static func Generate() -> String:
	var _Bin = Get_Bin()
	return '%02x%02x%02x%02x-%02x%02x-%02x%02x-%02x%02x-%02x%02x%02x%02x%02x%02x' % [
	_Bin[0], _Bin[1], _Bin[2], _Bin[3], #low
	_Bin[4], _Bin[5], #mid
	_Bin[6], _Bin[7], #hi
	_Bin[8], _Bin[9], #clock
	_Bin[10], _Bin[11], _Bin[12], _Bin[13], _Bin[14], _Bin[15] #clock
	]
