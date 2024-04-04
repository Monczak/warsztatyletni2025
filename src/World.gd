extends Node2D
class_name World

@export var player_tscn: PackedScene

@onready var _level: Level = $Level
@onready var _camera: Camera = $Camera2D
@onready var _particles: Particles = $Particles


func get_level() -> Level:
	return _level


func get_camera() -> Camera:
	return _camera
	

func get_particles() -> Particles:
	return _particles

	
func spawn_player() -> Player:
	var player := player_tscn.instantiate() as Player
	player.global_position = get_level().get_player_respawn_point().global_position
	_level.add_child(player)    
	return player
