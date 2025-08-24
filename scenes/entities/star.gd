@icon("res://assets/scene_icons/star.tres")
class_name Star
extends AstronomicalObject

@export var sector : Sector
@export var type : Type = Type.STANDARD

enum Type { STANDARD, DOUBLE, GIANT, DWARF, NEUTRON, PULSAR, BLACK_HOLE }
