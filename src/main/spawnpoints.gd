extends Node3D



func _on_firstbridge_body_entered(body: Node3D) -> void:
	print(body.name)
	if body.name == "Player":
		Global.checkpoint = $firstbridge.global_position


func _on_secondbridge_body_entered(body: Node3D) -> void:
	print(body.name)
	if body.name == "Player":
		Global.checkpoint = $secondbridge.global_position

func _on_thirdbridge_body_entered(body: Node3D) -> void:
	print(body.name)
	if body.name == "Player":
		Global.checkpoint = $thirdbridge.global_position
