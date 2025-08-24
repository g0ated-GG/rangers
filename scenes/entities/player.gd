@icon("res://assets/scene_icons/player.tres")
class_name Player
extends SpaceObject

@export var playerControlType : PlayerControlType = PlayerControlType.STAR_SYSTEM

enum PlayerControlType { SURFACE, PLANET, STAR_SYSTEM, GALAXY }

func _ready() -> void:
	gameObject = GameContainer.new()
	gameObject.speed = Vector2i(15, 15)

func _physics_process(_delta: float) -> void:
	_rotate()
	_move(Input.get_vector("move_right", "move_left", "move_backward", "move_forward"))

func _rotate() -> void:
	match playerControlType:
		PlayerControlType.STAR_SYSTEM:
			var screen_center : Vector2 = get_viewport().get_visible_rect().size / 2
			var mouse_position : Vector2 = get_viewport().get_mouse_position()
			var input_dir : Vector2 = (mouse_position - screen_center).normalized()
			var direction : Vector3 = Vector3(input_dir.x, 0, input_dir.y).normalized()
			look_at(position + direction)

func _move(input_dir: Vector2) -> void:
	match playerControlType:
		PlayerControlType.STAR_SYSTEM:
			var direction : Vector3 = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
			if direction:
				velocity.x = direction.x * gameObject.speed.y
				velocity.z = direction.z * gameObject.speed.y
			else:
				velocity.x = move_toward(velocity.x, 0, gameObject.speed.y)
				velocity.z = move_toward(velocity.z, 0, gameObject.speed.y)
			move_and_slide()

# TODO flying around planets
#func _rotate() -> void:
	#var center : Vector2 = get_viewport().get_visible_rect().get_center()
	#var mouse_position : Vector2 = get_viewport().get_mouse_position()
	#var direction : Vector2 = (mouse_position - center).normalized()
	#var angle : float = Vector2.DOWN.angle_to(direction)
	#var angle_diff : float = $Body.rotation.y - angle
	#$Body.rotate_y(-angle_diff)
#
#func _move(input_direction : Vector2, delta: float) -> void:
	#if not input_direction:
		#return
	#var input_rotation : Vector2 = input_direction.orthogonal()
	#var input_rotation_3 = Vector3(-input_rotation.x, 0.0, input_rotation.y)
	#var rotation_axis : Vector3 = transform.basis * input_rotation_3
	#rotate(rotation_axis, speed * delta)
