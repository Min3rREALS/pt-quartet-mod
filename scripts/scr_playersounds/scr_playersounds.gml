function scr_playersounds()
{
	with (obj_player)
	{
		if (state == states.mach1 && (!audio_is_playing(sfx_mach1)) && grounded)
		{
			mach1snd = audio_play_sound(sfx_mach1, 1, false)
			sfx_gain(mach1snd)
		}
		else if (state != states.mach1 or (!grounded) or move == (-xscale))
			audio_stop_sound(mach1snd)
		if ((sprite_index == spr_mach or state == states.climbwall) && (!audio_is_playing(sfx_mach2)))
		{
			mach2snd = audio_play_sound(sfx_mach2, 1, false)
			sfx_gain(mach2snd)
		}
		else if (sprite_index != spr_mach && state != states.climbwall)
			audio_stop_sound(mach2snd)
		if (state == states.rocket && (!audio_is_playing(sfx_mach4)))
		{
			rocketsnd = audio_play_sound(sfx_mach4, 1, false)
			sfx_gain(rocketsnd)
		}
		else if (state != states.rocket)
			audio_stop_sound(rocketsnd)
		if ((state == states.mach3 or sprite_index == spr_mach3boost) && (ratmount_movespeed >= 12) && sprite_index != spr_crazyrun && (!audio_is_playing(sfx_mach3)))
		{
			mach3snd = audio_play_sound(sfx_mach3, 1, false)
			sfx_gain(mach3snd)
		}
		else if ((state != states.mach3 && sprite_index != spr_mach3boost) or sprite_index == spr_crazyrun)
			audio_stop_sound(mach3snd)
		if (state == states.knightpepslopes && grounded && (!audio_is_playing(sfx_knightslide)))
		{
			knightslide = audio_play_sound(sfx_knightslide, 1, false)
			sfx_gain(knightslide)
		}
		else if ((state != states.knightpepslopes or (!grounded)) && audio_is_playing(sfx_knightslide))
			audio_stop_sound(knightslide)
		if ((sprite_index == spr_bombpeprun or sprite_index == spr_bombpeprunabouttoexplode) && (!audio_is_playing(sfx_bombpep1)))
		{
			bombpep1snd = audio_play_sound(sfx_bombpep1, 1, false)
			sfx_gain(bombpep1snd)
		}
		else if (sprite_index != spr_bombpeprun && sprite_index != spr_bombpeprunabouttoexplode && audio_is_playing(sfx_bombpep1))
			audio_stop_sound(bombpep1snd)
		if (sprite_index == spr_crazyrun && (!audio_is_playing(sfx_mach4)))
		{
			mach4snd = audio_play_sound(sfx_mach4, 1, false)
			sfx_gain(mach4snd)
		}
		else if (sprite_index != spr_crazyrun)
			audio_stop_sound(mach4snd)
		if (state != states.Sjumpprep && audio_is_playing(superjumpprepsnd))
			audio_stop_sound(superjumpprepsnd)
		if (state != states.Sjumpprep && audio_is_playing(superjumpholdsnd))
			audio_stop_sound(superjumpholdsnd)
		if (sprite_index == spr_tumblestart && (!audio_is_playing(sfx_tumble1)) && floor(image_index) < 11)
			tumble1snd = audio_play_sound(sfx_tumble1, 1, false)
		sfx_gain(tumble1snd)
		if (sprite_index == spr_tumblestart && floor(image_index) == 11 && (!audio_is_playing(sfx_tumble2)))
		{
			tumble2snd = audio_play_sound(sfx_tumble2, 1, false)
			sfx_gain(tumble2snd)
			audio_stop_sound(tumble1snd)
		}
		if ((sprite_index == spr_tumble or sprite_index == spr_machroll) && (!audio_is_playing(sfx_tumble3)))
		{
			tumble3snd = audio_play_sound(sfx_tumble3, 1, false)
			sfx_gain(tumble3snd)
		}
		if (state != states.tumble && sprite_index != spr_machroll)
		{
			audio_stop_sound(tumble1snd)
			audio_stop_sound(tumble2snd)
			audio_stop_sound(tumble3snd)
		}
		if (audio_is_playing(suplexdashsnd) && state != states.handstandjump)
			audio_stop_sound(suplexdashsnd)
	}
	exit;
}

