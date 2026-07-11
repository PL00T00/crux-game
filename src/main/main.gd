extends Node3D

@export var fade: AnimationPlayer
@export var cutscene_1: Control

func _on_signal_player_died():
	print("Player has died!")

func _ready() -> void:
	Global.world = $"."
