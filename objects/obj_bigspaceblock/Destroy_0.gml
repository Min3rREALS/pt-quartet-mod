with (instance_create((x + 32), (y + 32), obj_sausageman_dead))
	sprite_index = spr_bigdoughblockdead
scr_sleep(5)
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
with (instance_create(x, y, obj_destroyable_respawner))
{
	image_xscale = other.image_xscale
	image_yscale = other.image_yscale
	sprite_index = other.sprite_index
	content = other.object_index
	spawn_buffer = 70
}
