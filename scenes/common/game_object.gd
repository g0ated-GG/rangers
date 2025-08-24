@icon("res://assets/scene_icons/game_object.tres")
class_name GameObject
extends Control

@export var objectName : String
@export var description : String
@export var tags : Array[Tag]
@export var spaceObject : SpaceObject
@export var destroyable : bool = true
@export var durability_points : Vector2i = Vector2i.ONE :
	set(value):
		var old_value : Vector2i = durability_points
		durability_points = Vector2i(clampi(value.x, 0, value.y), value.y)
		if durability_points != old_value:
			dp_changed.emit()
		if durability_points.x == 0 and destroyable:
			death.emit()
@export var speed : Vector2i = Vector2i.ZERO :
	set(value):
		speed = Vector2i(clampi(value.x, 0, value.y), value.y)

signal dp_changed
signal death
