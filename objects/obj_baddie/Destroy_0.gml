if (room == rm_editor)
	exit;
if (ds_list_find_index(global.baddieroom, id) == -1 && ((!elite) or elitehit <= 0))
{
	if (object_index != obj_peppinoclone && object_index != obj_ghoul)
	{
		with (instance_create(x, y, obj_sausageman_dead))
		{
			sprite_index = other.spr_dead
			spr_palette = other.spr_palette
			paletteselect = other.paletteselect
		}
	}
	else if (object_index == obj_peppinoclone)
	{
		with (instance_create(x, y, obj_explosioneffect))
		{
			image_speed = 0.35
			depth = other.depth
			sprite_index = spr_pepclone_death
			image_xscale = other.image_xscale
		}
	}
	else if (object_index == obj_ghoul)
	{
		var i = 0
		repeat sprite_get_number(spr_ghoul_gibs)
		{
			with (create_debris(x, y, spr_ghoul_gibs))
			{
				image_index = i
				vsp = (-(irandom_range(10, 14)))
			}
			i++
		}
	}
	if (object_index == obj_tank)
	{
		repeat (3)
		{
			with (instance_create(x, y, obj_sausageman_dead))
				sprite_index = other.spr_content_dead
		}
	}
}
if (ds_list_find_index(global.baddieroom, id) == -1 && important == 0)
{
	if ((!elite) or elitehit <= 0)
	{
		with (obj_player1)
			supercharge += 1
	}
	if ((!elite) or elitehit <= 0)
		global.combo += 1
	if instance_exists(obj_hardmode)
		global.heatmeter_count++
	if ((!elite) or elitehit <= 0)
	{
		var combototal = (10 + round((10 * (global.combo * 0.5))))
		global.collect += combototal
		global.comboscore += combototal
	}
	scr_soundeffect(sfx_killenemy)
	repeat (3)
	{
		with (create_debris(x, y, spr_slapstar))
		{
			hsp = random_range(-5, 5)
			vsp = random_range(-10, 10)
		}
	}
	instance_create(x, y, obj_bangeffect)
	with (obj_camera)
	{
		shake_mag = 3
		shake_mag_acc = (3 / room_speed)
	}
	ds_list_add(global.baddieroom, id)
	if escape
		ds_list_add(global.escaperoom, id)
}
else if (ds_list_find_index(global.baddieroom, id) == -1 && important == 1)
{
	trace("destroy unimportant")
	instance_create(x, y, obj_slapstar)
	instance_create(x, y, obj_slapstar)
	instance_create(x, y, obj_slapstar)
	instance_create(x, y, obj_baddiegibs)
	instance_create(x, y, obj_baddiegibs)
	instance_create(x, y, obj_baddiegibs)
	scr_soundeffect(sfx_killenemy)
	with (obj_camera)
	{
		shake_mag = 3
		shake_mag_acc = (3 / room_speed)
	}
	ds_list_add(global.baddieroom, id)
}
