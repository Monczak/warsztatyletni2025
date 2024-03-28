extends RigidBody2D
class_name Grabbable

var _reset_state := false
var _new_position: Vector2


func fix_position(new_pos: Vector2) -> void:
    _reset_state = true
    _new_position = new_pos


func unfix_position() -> void:
    _reset_state = false


func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
    if _reset_state:
        state.transform.origin = _new_position