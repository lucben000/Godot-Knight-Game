extends TileMapLayer

var source_id: int
var atlas_coords: Vector2i
var blockCoords: Vector2i

var questionBlockId: int
var questionBlockCoords: Vector2i

func _ready() -> void:
	questionBlockId = get_cell_source_id(Vector2i(0, 1))
	questionBlockCoords = get_cell_atlas_coords(Vector2i(0, 1))

func changeTile(collisionPoint: Vector2i):
	var rng: int = blockRandomizer()
	
	##Convert the block position of collision to the tilemap position
	#blockCoords = local_to_map(collisionPoint)
	##Offset
	#blockCoords += Vector2i(0, -1)
	
	#if (get_cell_source_id(blockCoords) == questionBlockId 
	#&& get_cell_atlas_coords(blockCoords) == questionBlockCoords):
	source_id = get_cell_source_id(Vector2i(rng, 0))
	atlas_coords = get_cell_atlas_coords(Vector2i(rng, 0))
	set_cell(collisionPoint, source_id, atlas_coords)
	

#Randomizes which block to use
func blockRandomizer():
	return randi_range(0, 1)
