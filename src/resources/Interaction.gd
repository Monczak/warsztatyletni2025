extends Resource
class_name Interaction

enum InteractionMode { SetOn, SetOff }

@export var interactable: NodePath
@export var mode: InteractionMode
