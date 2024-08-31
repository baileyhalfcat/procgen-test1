extends Node3D
@export var rooms_array : Array = []
@export var max_rooms_pre_randit : int
@export var rooms_min_random : float
@export var rooms_max_random : float

func _ready() -> void:
	if !global.max_rooms_decided:
		global.max_rooms = int(max_rooms_pre_randit * randf_range(rooms_min_random, rooms_max_random))
		global.max_rooms_decided = true
	print(global.max_rooms, global.rooms_spawned)
	if global.rooms_spawned < global.max_rooms:
		print(global.max_rooms, global.rooms_spawned)
		try_to_spawn_room()
		global.rooms_spawned += 1
func try_to_spawn_room():
	var instance = rooms_array.pick_random().instantiate()
	add_child(instance)
	print("hello world i spawned a thing")
