extends Area3D

@export var boss_zone: Area3D


var touched_already : bool = false

func _on_body_entered(body: Node3D) -> void:
	# bottom zone
	if body.is_in_group(&"player_body") and boss_zone.can_sacrifice:
		print("SENSED")
		sacrifice()

func sacrifice():
	print("game_won")
	$WinLose.game_won()
