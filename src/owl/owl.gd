extends Node3D

var interacting : bool = false
var player_area_box_active : bool = false
var mimic_raycast_box_active : bool = false

@export var Contents_Node : Node3D
@export var UI_Sprite_Node : Sprite3D
#@export var SubViewport_Node : SubViewport

#@export var ActionToPress : InputEventAction

func _ready() -> void:
	toggle_interacting(false)

signal action_triggered

func toggle_interacting(interacting_val : bool):
	Contents_Node.visible = interacting_val
	interacting = interacting_val

func _unhandled_input(_event: InputEvent) -> void:
	if interacting:
		if Input.is_action_just_pressed('Interact'):
			action_triggered.emit()
			Global.char_move = false
