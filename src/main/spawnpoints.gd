extends Node3D

func _on_firstbridge_body_entered(body: Node3D) -> void:
	if body.is_in_group(&"player_body"):
		Global.checkpoint = $firstbridge.global_position


func _on_secondbridge_body_entered(body: Node3D) -> void:
	if body.is_in_group(&"player_body"):
		Global.checkpoint = $secondbridge.global_position

func _on_thirdbridge_body_entered(body: Node3D) -> void:
	if body.is_in_group(&"player_body"):
		Global.checkpoint = $thirdbridge.global_position
