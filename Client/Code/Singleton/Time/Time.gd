extends Node
class_name CE_Time

const _Ages : Array = [18, 0, 11, 22, 3, 14, 25, 6, 17, 28, 9, 20, 1, 12, 23, 4, 15, 26, 7]
const _Offsets : Array = [-1, 1, 0, 1, 2, 3, 4, 5, 7, 7, 9, 9]

static func Get_String_Second() -> String: return "%0*d" % [2, Time.get_time_dict_from_system().second]
static func Get_String_Minute() -> String: return "%0*d" % [2, Time.get_time_dict_from_system().minute]
static func Get_String_Hour() -> String: return "%0*d" % [2, Time.get_time_dict_from_system().hour]
static func Get_String_Ordinal() -> String: return Convert_Int_To_Ordinal(Time.get_date_dict_from_system().day)
static func Get_String_Weekday() -> String: return ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"][Time.get_date_dict_from_system().weekday]
static func Get_String_Month() -> String: return ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"][Time.get_date_dict_from_system().month - 1]
static func Get_String_Year() -> String: return str(Time.get_date_dict_from_system().year)
static func Get_String_Date() -> String: return Get_Time("%W, %M %O, %Y")
static func Get_String_Time() -> String: return Get_Time("%h:%m:%s")

static func Convert_Int_To_Ordinal(_number : int) -> String:
	var _day = _number
	var _ordinal = ""
	if (_day < 11 or _day > 13): _ordinal = ["st", "nd", "rd", "th"][min(posmod(_day-1, 10), 3)]
	else: _ordinal = "th"
	return str(_day) + _ordinal

static func Get_Time(_format : String) -> String:
	var _string = _format
	_string = _string.replace("%s", Get_String_Second())
	_string = _string.replace("%m", Get_String_Minute())
	_string = _string.replace("%h", Get_String_Hour())
	_string = _string.replace("%O", Get_String_Ordinal())
	_string = _string.replace("%W", Get_String_Weekday())
	_string = _string.replace("%M", Get_String_Month())
	_string = _string.replace("%Y", Get_String_Year())
	return _string

static func Get_String_Moon() -> String:
	#VARIABLES
	var _dictionary = Time.get_date_dict_from_system()
	var _day = _dictionary.day
	var _month = _dictionary.month
	var _year = _dictionary.year
	#RESULT
	if (_day == 31): _day = 1
	var _days_into_phase = ((_Ages[(_year + 1) % 19] + ((_day + _Offsets[_month - 1]) % 30) + int(_year < 1900)) % 30)
	var _index = int((_days_into_phase + 2) * 16/59.0)
	if (_index > 7): _index = 7
	return ["New", "Waxing Crescent", "First Quarter", "Waxing Gibbous", "Full", "Waning Gibbous", "Last Quarter", "Waning Crescent"][_index]

static func Get_Moonlight() -> int:
	#VARIABLES
	var _dictionary = Time.get_date_dict_from_system()
	var _day = _dictionary.day
	var _month = _dictionary.month
	var _year = _dictionary.year
	#RESULT
	if (_day == 31): _day = 1
	var _days_into_phase = ((_Ages[(_year + 1) % 19] + ((_day + _Offsets[_month - 1]) % 30) + int(_year < 1900)) % 30)
	var _light = int(2 * _days_into_phase * 100 / 29)
	if (_light > 100): _light = abs(_light - 200);
	return _light

static func Get_Easter() -> Array:
	#VARIABLES
	var _year = Time.get_date_dict_from_system().year
	var A = _year % 19;
	var B = _year % 4;
	var C = _year % 7;
	var P = float(floor(_year / 100))
	var Q = float(floor((13 + 8 * P) / 25))
	var M = int(15 - Q + P - P / 4) % 30
	var N = int(4 + P - P / 4) % 7
	var D = int(19 * A + M) % 30
	var E = int(2 * B + 4 * C + 6 * D + N) % 7
	var _days = int(22 + D + E)
	#RESULT
	if (D == 29 and E == 6): return ["April", 19]
	elif (D == 28 and E == 6): return ["April", 18]
	else:
		if (_days > 31): return ["April", _days - 31] #move to April
		else: return ["March", _days] #stay on March
