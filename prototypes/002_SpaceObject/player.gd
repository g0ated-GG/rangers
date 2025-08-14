class_name Player
extends SpaceObject

@export_custom(PROPERTY_HINT_NONE, "suffix:rad") var speed : float = PI/3 # rad

func _physics_process(delta: float) -> void:
	var input_direction : Vector2 = Input.get_vector(
		"right",
		"left",
		"back",
		"forward"
	)
	if not input_direction:
		return
	var input_rotation : Vector2 = input_direction.orthogonal()
	var input_rotation_3 = Vector3(-input_rotation.x, 0.0, input_rotation.y)
	var rotation_axis : Vector3 = transform.basis * input_rotation_3
	rotate(rotation_axis, speed * delta)
