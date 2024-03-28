extends CharacterBody2D
class_name Player

@export var max_speed := 600.0
@export var jump_velocity := -600.0
@export var acceleration := 3000.0

@export var jump_gravity_multiplier := 0.6
@export var fall_gravity_multiplier := 2.2

@onready var grab_point: Node2D = $GrabPoint
@onready var interaction_area: Area2D = $InteractionArea

var _player_interactables := []
var _grabbed_interactable = null


func _calculate_gravity() -> Vector2:
    var gravity := get_gravity()
    var is_jumping = Input.is_action_pressed("Jump")

    if is_jumping and velocity.y < -0.01:
        gravity *= jump_gravity_multiplier
    elif velocity.y < -0.01:
        gravity *= fall_gravity_multiplier
    
    return gravity


func _on_body_entered_interaction_area(body: Node2D) -> void:
    if body is PlayerInteractable:
        _player_interactables.append(body)


func _on_body_exited_interaction_area(body: Node2D) -> void:
    if body is PlayerInteractable:
        _player_interactables.erase(body)


func _interact() -> void:
    if _grabbed_interactable != null:
        _grabbed_interactable.unfix_position()
        _grabbed_interactable.off_interaction()
        _grabbed_interactable = null
    else:
        if len(_player_interactables) == 0:
            return

        var nearest_interactable = _player_interactables[0]
        for interactable in _player_interactables:
            var distance: float = (interactable.position - position).length()
            if distance < (nearest_interactable.position - position).length():
                nearest_interactable = interactable
        
        _grabbed_interactable = nearest_interactable
        _grabbed_interactable.on_interaction()
    

func _ready() -> void:
    interaction_area.body_entered.connect(_on_body_entered_interaction_area)
    interaction_area.body_exited.connect(_on_body_exited_interaction_area)


func _process(delta: float) -> void:
    if Input.is_action_just_pressed("Interact"):
        _interact()

    if _grabbed_interactable != null:
        _grabbed_interactable.fix_position(grab_point.global_position, velocity)


func _physics_process(delta: float) -> void:
    if not is_on_floor():
        velocity += _calculate_gravity() * delta

    if Input.is_action_just_pressed("Jump") and is_on_floor():
        velocity.y = jump_velocity

    var direction := Input.get_axis("MoveLeft", "MoveRight")
    if direction:
        velocity.x = move_toward(velocity.x, direction * max_speed, acceleration * delta)
    else:
        velocity.x = move_toward(velocity.x, 0, acceleration * delta)

    move_and_slide()


func _on_death() -> void:
    print("I am dead")
    Game.handle_player_death()
