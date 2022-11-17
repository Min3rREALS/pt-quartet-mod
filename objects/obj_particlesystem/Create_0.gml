enum particle
{
	enum_start, // don't use this
	
	cloudeffect,
	crazyrunothereffect,
	highjumpcloud1,
	highjumpcloud2,
	jumpdust,
	balloonpop,
	shotgunimpact,
	impact,
	genericpoofeffect,
	keyparticles,
	teleporteffect,
	landcloud,
	ratmountballooncloud,
	groundpoundeffect,
	antigrav_bubblepop,
	
	enum_length // don't use this
}
enum debris
{
	normal,
	fade
}

if (instance_number(obj_particlesystem) > 1)
{
	instance_destroy()
	exit;
}
depth = -99
global.particle_system = part_system_create()
global.part_map = ds_map_create()
global.part_depth = ds_map_create()
global.part_emitter = part_emitter_create(global.particle_system)
global.debris_list = ds_list_create()
global.collect_list = ds_list_create()

var p = declare_particle(particle.cloudeffect, spr_cloudeffect, 0.5, 99)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle(particle.crazyrunothereffect, spr_crazyrunothereffect, 0.5, -99)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle(particle.highjumpcloud1, spr_highjumpcloud1, 0.5, 0)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle(particle.highjumpcloud2, spr_highjumpcloud2, 0.5, 0)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle(particle.jumpdust, spr_jumpdust, 0.35, 0)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle(particle.balloonpop, spr_balloonpop, 0.5, 0)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle(particle.shotgunimpact, spr_shotgunimpact, 0.5, 0)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle(particle.impact, spr_impact, 0.5, 0)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle(particle.genericpoofeffect, spr_genericpoofeffect, 1, 0)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle(particle.antigrav_bubblepop, spr_antigrav_bubblepop, 0.35, 0)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle(particle.keyparticles, spr_keyparticles, 0.35, 0)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle(particle.teleporteffect, spr_teleporteffect, 0.5, 0)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle(particle.landcloud, spr_landcloud, 0.5, 0)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle(particle.ratmountballooncloud, spr_ratmountballooncloud, 0.7, 0)
part_type_speed(p, 0, 0, 0, 0)
p = declare_particle(particle.groundpoundeffect, spr_groundpoundeffect, 0.35, 0)
part_type_speed(p, 0, 0, 0, 0)
