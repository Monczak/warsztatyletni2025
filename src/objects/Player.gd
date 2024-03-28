extends CharacterBody2D

@export var max_speed := 600.0
@export var jump_velocity := -600.0
@export var acceleration := 3000.0

@export var jump_gravity_multiplier := 0.6
@export var fall_gravity_multiplier := 2.2


func _calculate_gravity() -> Vector2:
    var gravity := get_gravity()
    var is_jumping = Input.is_action_pressed("Jump")

    if is_jumping and velocity.y < -0.01:
        gravity *= jump_gravity_multiplier
    elif velocity.y < -0.01:
        gravity *= fall_gravity_multiplier
    
    return gravity


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
