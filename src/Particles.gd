extends Node2D
class_name Particles

@export var player_death_particles_tscn: PackedScene

@onready var _particles: Dictionary = {
	"player_death": player_death_particles_tscn
}


func emit_particles(particle_type: String, position: Vector2) -> void:
	var tscn = _particles[particle_type]
	var particles_inst = tscn.instantiate() as GPUParticles2D
	particles_inst.global_position = position
	add_child(particles_inst)
