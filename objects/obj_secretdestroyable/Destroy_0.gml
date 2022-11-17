if (ds_list_find_index(global.saveroom, id) == -1)
{
	with (instance_create((x + 32), (y + 32), obj_debris))
		sprite_index = spr_secretdebris
	with (instance_create((x + 32), (y + 32), obj_debris))
		sprite_index = spr_secretdebris
	with (instance_create((x + 32), (y + 32), obj_debris))
		sprite_index = spr_secretdebris
	with (instance_create((x + 32), (y + 32), obj_debris))
		sprite_index = spr_secretdebris
	with (instance_create((x + 32), (y + 32), obj_debris))
		sprite_index = spr_secretdebris
	with (instance_create((x + 32), (y + 32), obj_debris))
		sprite_index = spr_secretdebris
	with (instance_create((x + 32), (y + 32), obj_debris))
		sprite_index = spr_secretdebris
	tile_layer_delete_at(1, x, y)
	tile_layer_delete_at(1, (x + 32), y)
	tile_layer_delete_at(1, (x + 32), (y + 32))
	tile_layer_delete_at(1, x, (y + 32))
	if (audio_is_playing(sfx_breakblock1) or audio_is_playing(sfx_breakblock2))
	{
		audio_stop_sound(sfx_breakblock1)
		audio_stop_sound(sfx_breakblock2)
	}
	scr_soundeffect(sfx_breakblock1, sfx_breakblock2)
}
