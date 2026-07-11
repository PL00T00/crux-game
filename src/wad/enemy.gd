extends CharacterBody3D
var target_pos = Vector3(0,1,0)
var plane_normal = Vector3(0,1,0)
const SPEED = 5.0
const JUMP_VELOCITY = 4.5


func _physics_process(delta: float) -> void:
	target_pos = Global.character_pos
	plane_normal = Vector3(0,1,0)
	self.look_at(target_pos, plane_normal)
	self.rotation.x = 0
	self.rotation.z = 0
	
	
	
	
	
	if not is_on_floor():
		velocity += get_gravity() * delta


	# Get the input direction and handle the movement/deceleration.
	var input_dir = Vector3(0, 1, 0)
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	velocity.x = -direction.x * SPEED* 0.1
	velocity.z = -direction.z * SPEED* 0.1

	move_and_slide()


	
#
	#if not is_on_floor():
		#velocity += get_gravity() * delta
#
	#Vector3.UP.rotated(Vector3.UP, self.rotation) 
	#velocity.x = 0.01 * SPEED
#
	#move_and_slide()
