extends Resource
class_name s_Array

static func Create_1D(_X : int, _Value = null) -> Array:
	var _Return = []
	_Return.resize(_X)
	for _Index in _Return.size(): _Return[_Index] = _Value
	return _Return

static func Create_2D(_X : int, _Y : int, _Value = null) -> Array:
	var _Return = []
	_Return.resize(_X)
	for _Index in _Return.size(): _Return[_Index] = Create_1D(_Y, _Value)
	return _Return

static func Create_3D(_X : int, _Y : int, _Z : int, _Value = null) -> Array:
	var _Return = []
	_Return.resize(_X)
	for _Index in _Return.size(): _Return[_Index] = Create_2D(_Y, _Z, _Value)
	return _Return

static func Remove_All(_array : Array, _remove : Variant) -> Array:
	var _new_array = _array
	var _delete_array = []
	for _i in _new_array.size(): if (_new_array[_i] == _remove): _delete_array.append(_i)
	_delete_array.reverse()
	for _i in _delete_array: _new_array.remove_at(_i)
	return _new_array
