class_name SpaceObject
extends Node3D

func _ready() -> void:
	$Body.rotate_x(PI)

@export_custom(PROPERTY_HINT_NONE, "suffix:m") var height : float : # m
	get:
		return $Body.position.y if visible else 0.0
	set(value):
		$Body.position.y = value if visible else 0.0

@export var spherical : Vector3 : # (m, rad, rad)
	get:
		if !visible:
			return Vector3.ZERO
		var x : float = $Body.position.x
		var y : float = $Body.position.y
		var z : float = $Body.position.z
		var radius : float = height
		var zenith : float = atan2(sqrt(x**2 + y**2), z)
		var azimuth : float = atan2(y, x)
		return Vector3(radius, zenith, azimuth)
