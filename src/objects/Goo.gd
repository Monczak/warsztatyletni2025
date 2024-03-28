extends Node2D
class_name Goo

@onready var area: Area2D = $Area2D


func _ready() -> void:
    area.body_entered.connect(_on_body_entered)


func _on_body_entered(body: Node2D):
    body.call("_on_death")
    body.queue_free()
