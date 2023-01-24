with (obj_player)
{
	if (place_meeting(x, (y + 1), other) && vsp > 0)
		vsp = -14
}
with (obj_player)
{
	if (place_meeting(x, (y + 1), other) && vsp > 0)
		scr_soundeffect(sfx_piano)
}
