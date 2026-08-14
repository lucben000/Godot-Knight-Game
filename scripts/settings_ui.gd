extends Control

@export var settings_ui: Control
@export var masterslider: HSlider
@export var bg_mslider: HSlider
@export var sf_xslider: HSlider
@onready var sfx: AudioStreamPlayer = $SFX

static var masterVolume: int
var masterVolumeIndex: int
static var bgmVolume: int
var bgmVolumeIndex: int
static var sfxVolume: int
var sfxVolumeIndex: int

func _ready() -> void:
	masterVolumeIndex = AudioServer.get_bus_index("Master")
	bgmVolumeIndex = AudioServer.get_bus_index("Music")
	sfxVolumeIndex = AudioServer.get_bus_index("SFX")
	
	masterVolume = AudioServer.get_bus_volume_db(masterVolumeIndex)
	bgmVolume = AudioServer.get_bus_volume_db(bgmVolumeIndex)
	sfxVolume = AudioServer.get_bus_volume_db(sfxVolumeIndex)
	
	#db to linear = db value to linear value
	masterslider.value = db_to_linear(masterVolume)
	bg_mslider.value = db_to_linear(bgmVolume)
	sf_xslider.value = db_to_linear(sfxVolume)
	

func _on_close_button_pressed() -> void:
	sfx.play()
	await get_tree().create_timer(0.1).timeout
	get_parent().remove_child(settings_ui)
	print("close settings")

#Set Volume
#linear to db = linear value to db value
func _on_masterslider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(masterVolumeIndex, linear_to_db(value))

func _on_bg_mslider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(bgmVolumeIndex, linear_to_db(value))

func _on_sf_xslider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(sfxVolumeIndex, linear_to_db(value))
