extends Node

#Config file
var config = ConfigFile.new()
var filePath = "user://settings.cfg"

func _ready() -> void:
	if FileAccess.file_exists(filePath):
		#Load settings
		var err = config.load(filePath)
		
		#Error checking
		if err != OK:
			return
	else:
		#Create new settings and save it
		config.set_value("Volume", "Master_Volume", 1.0)
		config.set_value("Volume", "Music_Volume", 1.0)
		config.set_value("Volume", "Sound_Effects_Volume", 1.0)
		config.save(filePath)

#Load settings configuration whenever the user open the settings
func loadSettings():
	var settings = {}
	for key in config.get_section_keys("Volume"):
		#print(key)
		settings[key] = config.get_value("Volume", key)
		#print(settings[key])
	return settings

#Save settings configuration whenever the user close the settings
func saveSettings(dictionary: Dictionary):
	for key in dictionary:
		config.set_value("Volume", key, dictionary[key])
	config.save(filePath)
