extends Node3D
var play_in = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_g"):
		if play_in == true:
			Global.player_weapon = "sword"
			$".".queue_free()


func _on_collliswordujw_body_entered(body: Node3D) -> void:
	play_in = true


func _on_collliswordujw_body_exited(body: Node3D) -> void:
	play_in = false
