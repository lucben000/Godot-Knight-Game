extends Control

@export var settings_ui: Control
var masterVolume: int
var bgmVolume: int
var sfxVolume: int

func _ready() -> void:
	masterVolume = AudioServer.get_bus_index("Master")
	bgmVolume = AudioServer.get_bus_index("Music")
	sfxVolume = AudioServer.get_bus_index("SFX")


func _on_close_button_pressed() -> void:
	print("close settings")
	get_parent().remove_child(settings_ui)

func _on_masterslider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(masterVolume, linear_to_db(value))

func _on_bg_mslider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(bgmVolume, linear_to_db(value))

func _on_sf_xslider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(sfxVolume, linear_to_db(value))
