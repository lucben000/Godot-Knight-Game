extends Node

const filePath = "user://savefile.json"

var profile: Dictionary = {
	"level_1": false,
	"level_2": false,
	"level_3": false,
	"level_4": false,
	"level_5": false,
	
	#Version Control
	"new_data_to_save": false
}

func saveGame():
	var file = FileAccess.open(filePath, FileAccess.WRITE)
	#file.store_var(profile.duplicate())
	var jsonString = JSON.stringify(profile.duplicate(), "\t")
	file.store_string(jsonString)
	file.close()
	

func loadGame():
	if FileAccess.file_exists(filePath):
		var file = FileAccess.open(filePath, FileAccess.READ)
		
		var stringData = file.get_file_as_string(filePath)
		file.close()
		
		#Parse the string into a JSON
		var json = JSON.new()
		json.parse(stringData)
		
		#Convert the JSON data into a dictionary
		var data = Dictionary(json.data)
		#var saveData = data.duplicate()
		for keys in profile:
			profile[keys] = data[keys]
