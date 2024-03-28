extends Node2D
class_name Level

@onready var _player_respawn_point: PlayerRespawnPoint = $PlayerRespawnPoint


func get_player_respawn_point() -> PlayerRespawnPoint:
    return _player_respawn_point
