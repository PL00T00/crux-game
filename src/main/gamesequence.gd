extends Node3D

const ISLAND_1_SNOW = preload("uid://drrl2x7wvpuw0")
const ISLAND_2_SNOW = preload("uid://c251pyi2aijbk")
const ISLAND_3_SNOW = preload("uid://dr21pg47mryy6")

func _ready() -> void:
	toggle_snow_islands()
	

func toggle_snow_islands() -> void:
	$"../island1/grass".queue_free()
	$"../island1/PineTree1".queue_free()
	$"../island1/PineTree2".queue_free()
	$"../island1/island1/Icosphere".mesh.surface_get_material(0).albedo_texture = ISLAND_1_SNOW
	
	$"../island2/grass".queue_free()
	$"../island2/note".queue_free()
	$"../island2".cacti.process_mode = ProcessMode.PROCESS_MODE_DISABLED
	$"../island2".cacti.queue_free()
	$"../island2/Icosphere".material_override.albedo_texture = ISLAND_2_SNOW
	$"../island2/Icosphere".material_override.albedo_color = Color(1, 1, 1, 1)
	
	$"../island3/PineTree".queue_free()
	$"../island3".trees.queue_free()
	$"../island3".shrubs.queue_free()
	$"../island3/grass".queue_free()
	$"../island3/PineTree2".queue_free()
	$"../island3/PineTree3".queue_free()
	$"../island3/note".queue_free()
	$"../island3/Icosphere".material_override.albedo_texture = ISLAND_3_SNOW
