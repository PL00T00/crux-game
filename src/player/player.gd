extends CharacterBody3D

@export var SPEED = 5.0
@export var JUMP_VELOCITY = 5.0
@export var GRAVITY = 10.0

func _process(delta: float) -> void:
	if not is_on_floor():
		velocity.y -= GRAVITY * delta
	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		
