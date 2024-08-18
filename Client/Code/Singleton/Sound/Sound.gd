extends Node
#class_name s_Sound

var c_Dictionary_Music := { #Layer, Volume, Audio
	#"Menu" : [0, 0.6, "001_Music/Legacy/Kevin MacLeod - Erik Satie - Gymnopedie No 1.ogg"],
	#"Apartment" : [1, 0.4, "001_Music/Legacy/LeafManWithAFryinPan - Home, At The Moment.ogg"],
	#"PC" : [1, 0.4, "001_Music/Legacy/LeafManWithAFryinPan - Home, At The Moment (PC).ogg"],
	#"W1" : [2, 0.6, "001_Music/Legacy/PeriTune - Material_Toys_Factory_loop.ogg"],
	#"W1_Battle" : [3, 0.6, "001_Music/Legacy/PeriTune - Material_Battle_Fun_loop.ogg"],
	#"W1_Park" : [34, 0.5, "001_Music/Legacy/Peritune - Wonder.ogg"],
	#"W1_Boss" : [4, 0.6, "001_Music/Legacy/PeriTune - Material_Broken_loop.ogg"],
	#"W2" : [5, 0.6, "001_Music/Legacy/PeriTune - Material_Deep_Woods4_loop.ogg"],
	#"W2_Battle" : [6, 0.6, "001_Music/Legacy/PeriTune - Material_BattleField_loop.ogg"],
	#"W2_2" : [7, 0.6, "001_Music/Legacy/PeriTune - Material_Entangle_loop.ogg"],
	#"W2_Boss" : [8, 0.6, "001_Music/Legacy/PeriTune - Material_Puppeteer_loop.ogg"],
	#"W2_Moon_Room" : [33, 0.5, "001_Music/Legacy/Peritune - Wonder4_loop.ogg"],
	#"W3_Piano" : [9, 0.6, "001_Music/Legacy/PeriTune - Material_Hanagoyomi2_Piano.ogg"],
	#"W3" : [9, 0.6, "001_Music/Legacy/PeriTune - Material_Hanagoyomi2.ogg"],
	#"W3_Battle" : [10, 0.6, "001_Music/Legacy/PeriTune - Material_Kengeki.ogg"],
	#"W3_Boss" : [11, 0.6, "001_Music/Legacy/PeriTune - Material_EpicBattle_J_loop.ogg"],
	#"W4" : [12, 0.6, "001_Music/Legacy/PeriTune - Material_Snowy_Day2_loop.ogg"],
	#"W4_Battle" : [13, 0.6, "001_Music/Legacy/PeriTune - Material_EpicBattle_Deity_loop.ogg"],
	#"W4_2" : [14, 0.6, "001_Music/Legacy/PeriTune - Material_Scene_Tragic_Celesta_loop.ogg"],
	#"W4_Boss" : [14, 0.6, "001_Music/Legacy/PeriTune - Material_Scene_Tragic_loop.ogg"],
	#"W5" : [22, 0.6, "001_Music/Legacy/PeriTune - Material_Investigation.ogg"],
	#"W5_Battle" : [23, 0.6, "001_Music/Legacy/PeriTune - Material_BattleField5_loop.ogg"],
	#"W6" : [26, 0.6, "001_Music/Legacy/PeriTune - Material_Suspense8_loop.ogg"],
	#"W6_2" : [28, 0.6, "001_Music/Legacy/PeriTune - Material_Elysium.ogg"],
	#"W6_Battle" : [24, 0.6, "001_Music/Legacy/PeriTune - Material_Cyber_Noir_loop.ogg"],
	#"W6_Boss" : [28, 0.6, "001_Music/Legacy/PeriTune - Someone_who_Sought_Divine_inst.ogg"],
	#"W7" : [27, 0.6, "001_Music/Legacy/PeriTune - Material_Creep_loop.ogg"],
	#"W7_Battle" : [25, 0.6, "001_Music/Legacy/PeriTune - Material_RetroRoman_Battle_loop.ogg"],
	#"W7_Boss_1" : [29, 0.6, "001_Music/Legacy/PeriTune - Material_RetroRoman_Battle2_loop.ogg"],
	#"W7_Boss_2" : [29, 0.6, "001_Music/Legacy/PeriTune - Material_BattleField4_loop.ogg"],
	#"WS_1" : [15, 0.6, "001_Music/Legacy/PeriTune - Material_Laid_Back3_loop.ogg"],
	#"WS_2" : [16, 0.6, "001_Music/Legacy/PeriTune - Material_OverWorld_Folk_loop.ogg"],
	#"WS_3" : [17, 0.6, "001_Music/Legacy/PeriTune - Material_Deep_Sea_loop.ogg"],
	#"WS_4" : [18, 0.6, "001_Music/Legacy/PeriTune - Material_Powder_Snow_loop.ogg"],
	#"WS_5" : [19, 0.6, "001_Music/Legacy/PeriTune - Material_RetroRPG_Field_loop.ogg"],
	#"WS_6" : [20, 0.6, "001_Music/Legacy/PeriTune - Material_Nightmare_loop.ogg"],
	#"WS_5_Battle" : [21, 0.6, "001_Music/Legacy/PeriTune - Material_RetroRPG_Battle_loop.ogg"],
	#"WE" : [30, 0.6, "001_Music/Legacy/PeriTune - Material_Doppel_Celesta_loop.ogg"],
	#"WE_2" : [30, 0.6, "001_Music/Legacy/PeriTune - Material_Doppel_loop.ogg"],
	#"WE_Boss" : [31, 0.6, "001_Music/Legacy/PeriTune - Material_EpicBattle2_loop.ogg"],
}
var c_Dictionary_Ambient := { #Audio
	"Wind" : "Ambient/Wind.ogg",
}
var c_Dictionary_Sound := { #Array of audio
	"Button" : ["Sound/Button.ogg"],
	"Slider" : ["Sound/Slider.ogg"],
	"Plop" : ["Sound/Plop.ogg"],
	"Splash" : ["Sound/Splash.ogg"],
	"Reel" : ["Sound/Reel.ogg"],
	"Tension" : ["Sound/Tension.ogg"],
}
var v_Music := ""
var v_Ambient := ""
var v_Current_Music = null
var v_Current_Ambient = null
var v_Music_Interval := 0.0
var v_Ambient_Interval := 0.0
var v_Music_Volume = 1.0
var _Randomizer_Sound := {}

func _ready() -> void:
	var _Sound = Node3D.new()
	var _Music = Node3D.new()
	var _Ambient = Node3D.new()
	_Sound.name = "Sound"
	_Music.name = "Music"
	_Ambient.name = "Ambient"
	add_child(_Sound)
	add_child(_Music)
	add_child(_Ambient)
	#STREAM
	for _i in c_Dictionary_Sound.keys():
		var _randomizer = AudioStreamRandomizer.new()
		for _u in c_Dictionary_Sound[_i]: _randomizer.add_stream(-1, load("res://Resource/Audio/" + _u))
		_randomizer.playback_mode = AudioStreamRandomizer.PLAYBACK_RANDOM_NO_REPEATS
		_randomizer.random_pitch = 1.1
		_randomizer.random_volume_offset_db = 1.0
		_Randomizer_Sound[_i] = _randomizer

func _process(p_Delta : float) -> void:
	#SOUND
	for _Child in $"Sound".get_children():
		if (_Child.playing == false): 
			$"Sound".remove_child(_Child)
			_Child.queue_free() #prevent memory leak
	#MUSIC
	for _Child in $"Music".get_children():
		if (_Child == v_Current_Music): _Child.volume_db = linear_to_db(clamp(db_to_linear(_Child.volume_db) + p_Delta / v_Music_Interval, 0.0, v_Music_Volume))
		else: _Child.volume_db = linear_to_db(clamp(db_to_linear(_Child.volume_db) - p_Delta / v_Music_Interval, 0.0, v_Music_Volume))
		if (_Child.volume_db < -80): _Child.queue_free() #prevent memory leak
	#AMBIENT
	for _Child in $"Ambient".get_children():
		if (_Child == v_Current_Ambient): _Child.volume_db = linear_to_db(clamp(db_to_linear(_Child.volume_db) + p_Delta / v_Ambient_Interval, 0.0, 1.0))
		else: _Child.volume_db = linear_to_db(clamp(db_to_linear(_Child.volume_db) - p_Delta / v_Ambient_Interval, 0.0, 1.0))
		if (_Child.volume_db < -80): _Child.queue_free() #prevent memory leak

func Play_Music(p_Music : String, p_Interval : float = 0.5) -> void:
	if (v_Music != p_Music):
		var _Timestamp = 0.0
		if (v_Music != "" and p_Music != "" and c_Dictionary_Music[v_Music][0] == c_Dictionary_Music[p_Music][0]): _Timestamp = v_Current_Music.get_playback_position()
		v_Music = p_Music
		v_Music_Interval = p_Interval
		v_Current_Music = null
		if (p_Music != ""):
			v_Music_Volume = c_Dictionary_Music[p_Music][1]
			v_Current_Music = AudioStreamPlayer.new()
			v_Current_Music.name = "Music1"
			v_Current_Music.bus = "Music"
			v_Current_Music.volume_db = -80.0
			v_Current_Music.stream = load("res://Resource/Audio/" + c_Dictionary_Music[p_Music][2])
			$"Music".add_child(v_Current_Music)
			v_Current_Music.play(_Timestamp)

func Play_Ambient(p_Ambient : String, p_Interval : float = 0.5) -> void:
	if (v_Ambient != p_Ambient):
		v_Ambient = p_Ambient
		v_Ambient_Interval = p_Interval
		v_Current_Ambient = null
		if (p_Ambient != ""):
			v_Current_Ambient = AudioStreamPlayer.new()
			v_Current_Ambient.name = "Ambient1"
			v_Current_Ambient.bus = "Ambient"
			v_Current_Ambient.volume_db = -80.0
			v_Current_Ambient.stream = load("res://Resource/Audio/" + c_Dictionary_Ambient[p_Ambient])
			$"Ambient".add_child(v_Current_Ambient)
			v_Current_Ambient.play()

func Play_Sound(p_Sound : String, p_Volume : float = 1.0) -> void:
	var _Stream_Player = AudioStreamPlayer.new()
	_Stream_Player.stream = _Randomizer_Sound[p_Sound] #load("res://Resource/Audio/" + c_Dictionary_Sound[p_Sound][randi() % c_Dictionary_Sound[p_Sound].size()])
	_Stream_Player.name = "Sound1"
	_Stream_Player.bus = "Sound"
	_Stream_Player.volume_db = linear_to_db(p_Volume)
	$"Sound".add_child(_Stream_Player)
	_Stream_Player.play()
	#v_Sounds.append([p_Volume, _Stream_Player])

#func Play_Sound_2D(_Sound_ID : int, _Max_Distance : int, _Position : Vector2) -> void:
#	var _Sound = AudioStreamPlayer2D.new()
#	_Sound.stream = Array_Sound[_Sound_ID - 1]
#	_Sound.name = "Sound1"
#	_Sound.bus = "Sound"
#	_Sound.position = _Position
#	_Sound.max_distance = _Max_Distance
#	_Sound.volume_db = 8
#	$"Sound".add_child(_Sound)
#	_Sound.play()
