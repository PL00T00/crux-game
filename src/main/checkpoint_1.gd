extends Area3D

@onready var spawn_point: Marker3D = $SpawnPoint

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		body.current_spawn_position = spawn_point.global_position
	
