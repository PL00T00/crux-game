extends Control

@export var animation_player: AnimationPlayer

func _physics_process(delta: float) -> void:
	await $AnimationPlayer.animation_finished
	Global.char_move = true
