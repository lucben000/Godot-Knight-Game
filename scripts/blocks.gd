extends TileMapLayer

var tile
var source_id: int
var atlas_coords: Vector2i

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#tile = get_used_cells()
	#print(tile)
	#source_id = get_cell_source_id(Vector2i(7, -26))
	#atlas_coords = get_cell_atlas_coords(Vector2i(7, -26))
	#print(source_id)
	#print(atlas_coords)
	#print(randi_range(0, 1))
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func changeTile():
	var rng: int = blockRandomizer()
	#source_id = get_cell_source_id(Vector2i(rng, 0))
	#atlas_coords = get_cell_atlas_coords(Vector2i(rng, 0))
	set_cell(Vector2i(29, -32), source_id, atlas_coords)

func blockRandomizer():
	var rng: int = randi_range(0, 1)
	source_id = get_cell_source_id(Vector2i(rng, 0))
	atlas_coords = get_cell_atlas_coords(Vector2i(rng, 0))
	return rng
