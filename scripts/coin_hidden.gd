extends Node2D

@onready var ray_cast_2d: RayCast2D = $RayCast2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
var level: Node
var map: TileMapLayer
var player: Node2D

var questionBlockId: int
var questionBlockCoords: Vector2i
var blockCoords: Vector2i

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	level = get_parent().get_parent()
	map = level.get_child(0).find_child("Map")
	player = level.find_child("Player")
	
	questionBlockId = map.get_cell_source_id(Vector2i(0, 1))
	questionBlockCoords = map.get_cell_atlas_coords(Vector2i(0, 1))

func _on_area_2d_body_entered(body: Node2D) -> void:
	animation_player.play("pickup")
	player.hud.add_score()
	
	#Convert the block position of collision to the tilemap position
	blockCoords = map.local_to_map(body.position)
	#Offset
	blockCoords += Vector2i(0, -1)
	if (map.get_cell_source_id(blockCoords) == questionBlockId 
	&& map.get_cell_atlas_coords(blockCoords) == questionBlockCoords):
		map.changeTile(blockCoords)
	
