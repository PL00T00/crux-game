extends CharacterBody3D
var target_pos = Vector3(0,1,0)
var plane_normal = Vector3(0,1,0)
const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var char_in_area = false
var pushback = false

func _physics_process(delta: float) -> void:
	if not is_on_floor():
			velocity += get_gravity() * delta
	if char_in_area == true:
		target_pos = Global.character_pos
		plane_normal = Vector3(0,1,0)
		self.look_at(target_pos, plane_normal)
		
		
		
		
		
		
		


		# Get the input direction and handle the movement/deceleration.
		var input_dir = Vector3(0, 1, 0)
		var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		if pushback == false:
			velocity.x = -direction.x * SPEED* 0.1
			velocity.z = -direction.z * SPEED* 0.1
		else:
			velocity -= get_gravity() * delta 
			velocity.x = -direction.x * SPEED* 0.2
			velocity.z = -direction.z * SPEED* 0.2
			velocity.y = -direction.y * SPEED* 0.8

	move_and_slide()


	
#
	#if not is_on_floor():
		#velocity += get_gravity() * delta
#
	#Vector3.UP.rotated(Vector3.UP, self.rotation) 
	#velocity.x = 0.01 * SPEED
#
	#move_and_slide()


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		char_in_area = true
		print('enetr')


func _on_area_3d_body_exited(body: Node3D) -> void:
	if body.name == "Player":
		char_in_area = false
		print('exit')


func _on_area_3d_area_entered(area: Area3D) -> void:
	if (area.name == "sword") or (area.name == "fists"):
		pushback = true
		await get_tree().create_timer(1).timeout
		pushback = false
