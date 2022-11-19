combo = 0
comboscore = 0
combominus = 0
timer_max = 1
timer = 0
title_index = 0
scr_soundeffect(sfx_comboend)
depth = (obj_particlesystem.depth - 1)
alarm[0] = 1
with (obj_player)
{
	if (!(place_meeting(x, y, obj_exitgate)))
		global.combodropped = 1
}
