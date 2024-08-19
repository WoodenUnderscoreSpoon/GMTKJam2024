extends Node
#class_name s_Sound

var c_Dictionary_Music := { #Layer, Volume, Audio
	"Menu" : [0, 0.7, "Music/Peritune-Snowy Village.ogg"],
	"Game" : [1, 1.0, "Music/Peritune-Rain Drop.ogg"],
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
	"Line Break" : ["Sound/Line Break.ogg"],
	"Ding" : ["Sound/Ding.ogg"],
	"Squeak" : ["Sound/Squeak 1.ogg", "Sound/Squeak 2.ogg"],
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
