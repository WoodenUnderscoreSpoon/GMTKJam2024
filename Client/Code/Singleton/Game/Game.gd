extends Node
#class_name CE_Game

@onready var _Name : String = ProjectSettings.get_setting("application/config/name")
@onready var _Path : String = [OS.get_executable_path().get_base_dir() + "/", ProjectSettings.globalize_path("res://Build/")][int(Is_Editor())]
@onready var _Mode : String = "Editor" if (Is_Editor()) else ["Release", "Debug"][int(Is_Debug())]
@onready var _Version : String = ProjectSettings.get_setting("application/config/version")

func Get_Name() -> String: return _Name
func Get_Version() -> String: return _Version
func Get_Full_Name() -> String: return Get_Name() + " " + Get_Version()
func Get_Path() -> String: return _Path
func Get_Mode() -> String: return _Mode
func Is_Standalone() -> bool: return OS.has_feature("standalone")
func Is_Editor() -> bool: return OS.has_feature("editor")
func Is_Release() -> bool: return OS.has_feature("release")
func Is_Debug() -> bool: return OS.has_feature("debug")
func Is_Demo() -> bool: return OS.has_feature("demo")

func Quit() -> void:
	s_Window._Timer.stop()
	s_Window.Save()
	s_Options.Save()
	get_tree().quit()
