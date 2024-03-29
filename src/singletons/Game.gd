extends Node


signal victory
signal reset
signal start


@onready var _root: Root = get_tree().root.get_node("Root")
@onready var _world: World = _root.get_node("World")


func get_world() -> World:
    return _world


func get_camera() -> Camera:
    return get_world().get_camera()


func get_level() -> Level:
    return get_world().get_level()


func get_player_respawn_point() -> Node2D:
    return get_level().get_player_respawn_point()


func handle_player_death() -> void:
    get_camera().target = null

    await get_tree().create_timer(0.6).timeout
    var player = get_world().spawn_player()
    get_camera().target = player


func handle_victory() -> void:
    victory.emit()
    print("Level complete!")


func reset_game() -> void:
    reset.emit()
    _root.load_world()
    start.emit()
    
    
func _ready() -> void:
    reset_game()

