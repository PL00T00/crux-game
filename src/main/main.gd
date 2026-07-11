extends Node3D

@export var fade: AnimationPlayer

@export var cutscene_1: Control
@export var cutscene_2: Control
@export var cutscene_3: Control

func _ready() -> void:
	Global.world = $"."
