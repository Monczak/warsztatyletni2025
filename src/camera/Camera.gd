extends Camera2D

@export var acceleration := 100
@export var target: Node2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    if target != null: 
        position = lerp(position, target.position, acceleration * delta)
