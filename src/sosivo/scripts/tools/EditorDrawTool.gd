@tool
extends EditorPlugin

func edit(object :Object) ->void:
	pass
func _handles(object: Object) -> bool:
	return true

func forward_canvas_draw_over_viewport(overlay):
	overlay.draw_rect(Rect2(50, 50, 100, 50), Color(1, 0, 0, 0.5))
