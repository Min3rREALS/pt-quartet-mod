function scr_soundeffect()
{
	var snd = argument[irandom((argument_count - 1))]
	var snd_id = audio_play_sound(snd, 1, false)
	audio_sound_gain(snd_id, (audio_sound_get_gain(snd_id) * global.option_sfx_volume), 0)
	exit;
}

function sfx_gain(argument0)
{
	audio_sound_gain(argument0, (audio_sound_get_gain(argument0) * global.option_sfx_volume), 0)
	exit;
}

