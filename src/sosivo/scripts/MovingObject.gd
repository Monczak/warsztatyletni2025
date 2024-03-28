extends ObjectInteractable


#@export var rb : RigidBody2D
@export var _moveSpeed : float = 1
@export var _acceleration : float = 10
@export var _rb : AnimatableBody2D
var _origin : Vector2
var _destination : Vector2
@export var DestinationDelta : Vector2
@export var _originFlag : bool = true

func OnInteraction() -> void:
    _originFlag = false
    
func OffInteraction() -> void:
    _originFlag = true
    

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    _origin = position
    _destination = position + DestinationDelta

var velocity : Vector2 = Vector2.ZERO

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta : float) -> void:
    #const closeToZero : float = 1
    #var desiredRelocation : Vector2 = Vector2.ZERO
#
    #if _originFlag:
        #desiredRelocation = _origin - position
    #else:
        #desiredRelocation = _destination - position

    #if desiredRelocation.length() > closeToZero:
        #position = lerp(position, position + desiredRelocation.normalized(), _acceleration * delta)
    #else:
        #position = lerp(position, desiredRelocation, _acceleration * delta)
        #transform.position = (Vector2)transform.position + desiredRelocation;
        
    var target := _origin if _originFlag else _destination
    position = lerp(position, target, _acceleration * delta)
        
    
    
#func _integrate_forces(_state: PhysicsDirectBodyState2D) -> void:
    #_rb.linear_velocity = velocity
    #transform.position = (Vector2)transform.position + desiredRelocation;
