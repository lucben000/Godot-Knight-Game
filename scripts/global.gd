extends Node

#Levels
enum levels { TUTORIAL_LEVEL, LEVEL_1, LEVEL_2, LEVEL_3, LEVEL_4, LEVEL_5}
var level : levels

#Volume
var settingsDictionary: Dictionary
static var masterVolume: int
var masterVolumeIndex: int
static var bgmVolume: int
var bgmVolumeIndex: int
static var sfxVolume: int
var sfxVolumeIndex: int

func _ready() -> void:
	#Load game profile
	SaveSystem.loadGame()
	
	#Load settings configuration
	settingsDictionary = Settings.loadSettings()
	
	masterVolumeIndex = AudioServer.get_bus_index("Master")
	masterVolume = linear_to_db(settingsDictionary["Master_Volume"])
	AudioServer.set_bus_volume_db(masterVolumeIndex, masterVolume)
	
	bgmVolumeIndex = AudioServer.get_bus_index("Music")
	bgmVolume = linear_to_db(settingsDictionary["Music_Volume"])
	AudioServer.set_bus_volume_db(bgmVolumeIndex, bgmVolume)
	
	sfxVolumeIndex = AudioServer.get_bus_index("SFX")
	sfxVolume = linear_to_db(settingsDictionary["Sound_Effects_Volume"])
	AudioServer.set_bus_volume_db(sfxVolumeIndex, sfxVolume)
	
