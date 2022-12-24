prevpillar_on_camera = pillar_on_camera
if instance_exists(obj_hungrypillar)
{
	var p = 0
	with (obj_hungrypillar)
	{
		if bbox_in_camera(view_camera[0], 0)
			p = 1
	}
	if (p != pillar_on_camera)
		pillar_on_camera = p
}
else
	pillar_on_camera = 0
if (prevpillar_on_camera != pillar_on_camera)
{
	if pillar_on_camera
	{
		audio_sound_gain(pillarmusicID, (0.6 * global.option_music_volume), 2000)
		audio_sound_gain(musicID, 0, 2000)
	}
	else
	{
		audio_sound_gain(pillarmusicID, 0, 2000)
		audio_sound_gain(musicID, (0.6 * global.option_music_volume), 2000)
	}
}
if (!obj_player.ispeppino && music != mu_entrance)
{
        music = mu_noiseentrance
	audio_stop_sound(musicID)
    musicID = scr_music(music)
}
if global.panic
{
    if (music != mu_pizzatime && music != mu_chase && music != mu_industrialescape && music != mu_freefallingescape && music != mu_sewerescape && music != mu_freezerescape && music != mu_medievalescape && music != mu_snickchallengeend && music != mu_dragonlair && music != mu_finalescape)
    {
        music = mu_pizzatime
        audio_stop_sound(musicID)
        musicID = scr_music(music)
        if (pillarmusicID != -4)
            audio_stop_sound(pillarmusicID)
        pillarmusicID = -4
        if (!obj_player.ispeppino)
            music = mu_noiseescape
        audio_stop_sound(musicID)
        musicID = scr_music(music)
        if (pillarmusicID != -4)
            audio_stop_sound(pillarmusicID)
        pillarmusicID = -4
        if (string_letters(room_get_name(room)) == "space")
            music = mu_snickchallengeend
        audio_stop_sound(musicID)
        musicID = scr_music(music)
        if (pillarmusicID != -4)
            audio_stop_sound(pillarmusicID)
        pillarmusicID = -4
        if (string_letters(room_get_name(room)) == "sewer")
            music = mu_sewerescape
        audio_stop_sound(musicID)
        musicID = scr_music(music)
        if (pillarmusicID != -4)
            audio_stop_sound(pillarmusicID)
        pillarmusicID = -4
	    if (string_letters(room_get_name(room)) == "bathroom")
            music = mu_sewerescape
        audio_stop_sound(musicID)
        musicID = scr_music(music)
        if (pillarmusicID != -4)
            audio_stop_sound(pillarmusicID)
        pillarmusicID = -4
        if (string_letters(room_get_name(room)) == "industrial")
            music = mu_industrialescape
        audio_stop_sound(musicID)
        musicID = scr_music(music)
        if (pillarmusicID != -4)
            audio_stop_sound(pillarmusicID)
        pillarmusicID = -4
        if (string_letters(room_get_name(room)) == "medieval")
            music = mu_medievalescape
        audio_stop_sound(musicID)
        musicID = scr_music(music)
        if (pillarmusicID != -4)
            audio_stop_sound(pillarmusicID)
        pillarmusicID = -4
        if (string_letters(room_get_name(room)) == "kitchen")
            music = mu_freefallingescape
        audio_stop_sound(musicID)
        musicID = scr_music(music)
        if (pillarmusicID != -4)
            audio_stop_sound(pillarmusicID)
        pillarmusicID = -4
        if (string_letters(room_get_name(room)) == "freezer")
            music = mu_freezerescape
        audio_stop_sound(musicID)
        musicID = scr_music(music)
        if (pillarmusicID != -4)
            audio_stop_sound(pillarmusicID)
        pillarmusicID = -4
    }
    else if global.lap and (music != mu_chase)
    {
        music = mu_chase
        audio_stop_sound(musicID)
        musicID = scr_music(music)
        if (pillarmusicID != -4)
            audio_stop_sound(pillarmusicID)
        pillarmusicID = -4
    }
}