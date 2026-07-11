extends CharacterBody3D

@export var SPEED = 1.0
@export var JUMP_VELOCITY = 3.0
@export var GRAVITY = 9.76
var min_pitch: float = deg_to_rad(-80)
var max_pitch: float = deg_to_rad(80)
var mouse_sensitivity = 0.002
var speed_timser = 1

@export var health: int = 100
@export var attack: int = 10

# Don't change
var yaw: float = 0.0
var pitch: float = 0.0

# Raycasting stuff
@onready var interaction_ray: RayCast3D = $raycast

#mouse capture
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

#Movement
func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y -= 10 * delta
		
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var input_dir := Input.get_vector("Left", "Right", "Forward", "Back")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if Input.is_action_pressed('ui_shift'):
		speed_timser = 2
	else:
		speed_timser = 1
		
	if direction != Vector3.ZERO:
		velocity.x = direction.x * SPEED * speed_timser
		velocity.z = direction.z * SPEED * speed_timser
	else:
		velocity.x = move_toward(velocity.x, 0.0, SPEED)
		velocity.z = move_toward(velocity.z, 0.0, SPEED)
		
	move_and_slide()
	
	check_note_interaction()
	
# checks for notes

func check_note_interaction() -> void:
	if interaction_ray.is_colliding():
		var target = interaction_ray.get_collider()
		if target and target.has_method("Interact"):
			if Input.is_action_just_pressed("Interact"):
				target.interact()

#See if mouse move and change where look
func _unhandled_input(event):
	if get_tree().paused:
		return
		
	if event is InputEventMouseMotion:
		yaw -= event.relative.x * mouse_sensitivity
		pitch -= event.relative.y * mouse_sensitivity
		pitch = clamp(pitch, min_pitch, max_pitch)
		rotation = Vector3(0, yaw, 0)
		$Camera3D.rotation = Vector3(pitch, 0, 0)

#STop mouse capture
func _input(event):
	if event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

signal player_died
# Die. What more is there to say
func die():
	queue_free()
	player_died.emit()
	await get_tree().create_timer(2.0).timeout
	get_tree().reload_current_scene() # Restart the level
