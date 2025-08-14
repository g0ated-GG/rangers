extends StaticBody3D

const SPEED : float = PI/3

@onready var rot_pivot: Node3D = get_parent_node_3d()
@onready var pivot: Node3D = get_parent_node_3d().get_parent_node_3d()

func _physics_process(delta: float) -> void:
	var input_dir := Input.get_vector("right", "left", "back", "forward")
	if not input_dir:
		return
	var pivot_basis := pivot.transform.basis
	var input_rot := input_dir.orthogonal()
	var input_rot_3 := Vector3(input_rot.x, 0.0, input_rot.y)
	var rot := pivot_basis * input_rot_3
	pivot.rotate(rot, SPEED * delta)
	#if input_dir:
		#pivot.rotate_x(input_dir.y * delta * SPEED)
		#pivot.rotate_z(-input_dir.x * delta * SPEED)
