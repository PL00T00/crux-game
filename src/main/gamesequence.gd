extends Node3D

const ISLAND_1_SNOW = preload("uid://drrl2x7wvpuw0")
const ISLAND_2_SNOW = preload("uid://c251pyi2aijbk")

func _ready() -> void:
	toggle_snow_islands()
	

func toggle_snow_islands() -> void:
	$"../island1/grass".visible = false
	$"../island1/PineTree1".visible = false
	$"../island1/PineTree2".visible = false
	$"../island1/island1/Icosphere".mesh.surface_get_material(0).albedo_texture = ISLAND_1_SNOW
	
	$"../island2/grass".visible = false
	$"../island2/note".visible = false
	$"../island2".cacti.process_mode = ProcessMode.PROCESS_MODE_DISABLED
	$"../island2".cacti.visible = false
	$"../island2/Icosphere".material_override.albedo_texture = ISLAND_2_SNOW
