extends Node3D

var interacting : bool = false
var player_area_box_active : bool = false
var mimic_raycast_box_active : bool = false

@export var Contents_Node : Node3D
#@export var UI_Sprite_Node : Sprite3D
@onready var owlcutscene: Control = $owlcutscene

func _ready() -> void:
	toggle_interacting(false)

signal action_triggered

func toggle_interacting(interacting_val : bool):
	Contents_Node.visible = interacting_val
	interacting = interacting_val
	print(interacting_val)

func _unhandled_input(_event: InputEvent) -> void:
	if interacting:
		if Input.is_action_just_pressed('Interact'):
			action_triggered.emit()
			Global.char_move = false
			print('hii you talk to me now')
			owlcutscene.show()
			$owlcutscene/AnimationPlayer.play("main")
			
			await $owlcutscene/AnimationPlayer.animation_finished
			Global.char_move = true

func _on_player_area_box_body_entered(body: Node3D) -> void:
	if body.is_in_group(&"player_body"):
		player_area_box_active = true
		toggle_interacting(player_area_box_active)

func _on_player_area_box_body_exited(body: Node3D) -> void:
	if body.is_in_group(&"player_body"):
		player_area_box_active = false
		toggle_interacting(player_area_box_active)

func _on_mimic_raycast_box_area_entered(area: Area3D) -> void:
	if area.is_in_group(&"player_raycast"):
		mimic_raycast_box_active = true

func _on_mimic_raycast_box_area_exited(area: Area3D) -> void:
	if area.is_in_group(&"player_raycast"):
		mimic_raycast_box_active = false

#func _process(delta: float) -> void:
	#look_at(Global.character_pos)
