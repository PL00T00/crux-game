extends Area3D

@export var boss_sacrifice_zone: Area3D

var touched_already : bool = false

var can_sacrifice : bool = false

func _on_body_entered(body: Node3D) -> void:
	# top zone
	if body.is_in_group(&"player_body"):
		$"can sacrifice timer".start()
		can_sacrifice = true
		print("can sacrifice")

func _on_timer_timeout() -> void:
	can_sacrifice = false
	print("cannot sacrifice")
