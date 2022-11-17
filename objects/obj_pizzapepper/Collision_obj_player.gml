if (visible == true)
{
	if audio_is_playing(sfx_bombpep2)
		audio_stop_sound(sfx_bombpep2)
	scr_soundeffect(sfx_bombpep2)
	visible = false
	with (other)
	{
		vsp = -14
		state = states.jetpackjump
		sprite_index = spr_player_jetpackstart
		doublejump = 0
		with (instance_create(x, y, obj_highjumpcloud2))
			sprite_index = spr_player_firemouthjumpdust
	}
	timetovisible = 100
}
