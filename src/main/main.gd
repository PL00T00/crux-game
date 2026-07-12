extends Node3D

@export var fade: AnimationPlayer

@export var cutscene_1: Control
@export var cutscene_2: Control
@export var cutscene_3: Control

func _ready() -> void:
	Global.world = $"."


func _on_bossenablearea_body_entered(body: Node3D) -> void:
	if body.is_in_group(&"player_body"):
		$boss.process_mode = Node.PROCESS_MODE_INHERIT


func _on_enemyboss_died() -> void:
	print("boss die")
	await get_tree().create_timer(1.5).timeout
	
	$WinLose.game_won()
