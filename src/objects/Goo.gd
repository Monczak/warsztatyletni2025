extends Node2D
class_name Goo

@onready var area: Area2D = $Area2D
@onready var sprite: Sprite2D = $Sprite2D

var _frame_count := 9
var _anim_speed := 0.7


func _ready() -> void:
	area.body_entered.connect(_on_body_entered)


func _process(delta: float) -> void:
	var time = Time.get_ticks_msec() / 1000.0
	sprite.frame = int(lerp(0, _frame_count - 1, time * _anim_speed)) % _frame_count
	

func _on_body_entered(body: Node2D):
	if body.has_method("_on_death"):
		body.call("_on_death")
	body.queue_free()
