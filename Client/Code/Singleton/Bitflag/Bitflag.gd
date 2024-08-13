extends Resource
class_name s_Bitflag

static func Get(_bit : int, _flag : int) -> bool: return _bit & _flag != 0
static func Set(_bit : int, _flag : int) -> int: return _bit | _flag
static func Unset(_bit : int, _flag : int) -> int: return _bit & ~_flag
