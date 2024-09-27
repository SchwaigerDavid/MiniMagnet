extends RigidBody3D

@export var targetMagnets: Array[Node3D] = []
@export var strength: float = 30

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	for magnet in targetMagnets:
		var whereto = position.direction_to(magnet.position)*delta*strength
		if magnet.get_meta("polarity"):
			apply_impulse(whereto,Vector3(0,0,0))
		else:
			apply_impulse(whereto*-1,Vector3(0,0,0))
		
		
