extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


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
