extends PlayerInteractable


@export var interactions: Array[KeyInteraction]


func _ready() -> void:
    body_entered.connect(_on_body_entered)
    
    
func _on_body_entered(body: Node2D) -> void:
    if body is not ObjectInteractable:
        return
        
    for interaction in interactions:
        var interactable_obj: ObjectInteractable = get_node(interaction.interactable)
        if body == interactable_obj:
            match interaction.mode:
                KeyInteraction.InteractionMode.SetOn:
                    interactable_obj.OnInteraction()
                KeyInteraction.InteractionMode.SetOff:
                    interactable_obj.OffInteraction()
            return
    
