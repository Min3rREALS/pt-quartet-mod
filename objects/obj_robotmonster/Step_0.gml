targetplayer = instance_nearest(x, y, obj_player)
switch state
{
	case states.robotidle:
		sprite_index = spr_introidle
		image_speed = 0.35
		break
	case states.robotintro:
		image_speed = 0.35
		if (sprite_index != spr_intro)
		{
			sprite_index = spr_intro
			image_index = 0
		}
		if (floor(image_index) == (image_number - 1))
		{
			state = states.robotchase
			sprite_index = chasespr
		}
		break
	case states.robotroaming:
		targetplayer = instance_nearest(x, y, obj_player)
		image_speed = 0.35
		sprite_index = walkspr
		hsp = (image_xscale * 4)
		if (place_meeting((x + sign(hsp)), y, obj_monstersolid) && ((!(place_meeting((x + sign(hsp)), y, obj_monsterslope))) or place_meeting((x + sign(hsp)), (y - 4), obj_solid)))
			image_xscale *= -1
		scr_monster_detect_audio()
		if scr_monster_detect(300, room_height, targetplayer)
			state = states.robotchase
		break
	case states.robotchase:
		if (sprite_index != spr_monstercheese_jump)
			sprite_index = chasespr
		var t = grounded
		if (object_index == obj_blobmonster)
			t = scr_monster_solid(x, (y + (grav * 2)))
		if (object_index != obj_hillbillymonster)
		{
			if (x != targetplayer.x && t)
			{
				image_xscale = sign((targetplayer.x - x))
				if (abs((x - targetplayer.x)) > 50)
					hsp = (image_xscale * 8)
				else
					hsp = Approach(hsp, 0, 0.5)
			}
			if (hsp == 0)
				sprite_index = idlespr
			if (object_index != obj_blobmonster && place_meeting((x + hsp), y, obj_monstersolid) && (!(place_meeting((x + hsp), y, obj_monsterslope))))
			{
				hsp = 0
				sprite_index = idlespr
			}
		}
		else
		{
			move = sign((targetplayer.x - x))
			if (move != 0)
			{
				if (move != image_xscale)
				{
					image_xscale = move
					movespeed = -4
				}
			}
			movespeed = Approach(movespeed, 8, 0.1)
			hsp = (image_xscale * movespeed)
			if (place_meeting((x + image_xscale), y, obj_monstersolid) && (!(place_meeting((x + image_xscale), y, obj_monsterslope))))
			{
				movespeed = 0
				sprite_index = idlespr
			}
			if (abs(movespeed) == 0)
				sprite_index = idlespr
		}
		if (object_index == obj_blobmonster)
		{
			if (t && sprite_index == spr_monstercheese_jump)
				sprite_index = chasespr
			if (t && place_meeting((x + hsp), y, obj_monstersolid) && (!(place_meeting((x + hsp), y, obj_monsterslope))))
			{
				grav *= -1
				state = states.fall
				hsp = 0
				sprite_index = spr_monstercheese_jump
				image_index = 0
			}
			else if (t && ys < 0 && point_in_camera(x, y, view_camera[0]) && targetplayer.x > (x - 200) && targetplayer.x < (x + 200))
			{
				grav *= -1
				state = states.fall
				sprite_index = spr_monstercheese_jump
				image_index = 0
			}
		}
		break
	case states.fall:
		image_speed = 0.5
		if (floor(image_index) == (image_number - 1))
			image_index = (image_number - 1)
		if scr_monster_solid(x, (y + (grav * 2)))
		{
			ys *= -1
			state = states.robotchase
		}
		break
	case states.robotseeking:
		targetplayer = instance_nearest(x, y, obj_player)
		hsp = (image_xscale * 6)
		if (place_meeting((x + sign(hsp)), y, obj_monstersolid) && ((!(place_meeting((x + sign(hsp)), y, obj_monsterslope))) or place_meeting((x + sign(hsp)), (y - 4), obj_solid)))
			state = states.robotroaming
		if scr_monster_detect(300, room_height, targetplayer)
			state = states.robotchase
		break
	case states.robotinvestigate:
		scr_monsterinvestigate(10, spr_monstershroom_chase, spr_monstershroom_idle)
		break
}

if (object_index == obj_robotmonster or object_index == obj_hillbillymonster)
{
	if (state == states.robotchase or state == states.robotseeking or state == states.robotinvestigate)
	{
		instance_destroy(instance_place((x + hsp), y, obj_wirewall))
		instance_destroy(instance_place((x + hsp), y, obj_destructibles))
		instance_destroy(instance_place((x + hsp), y, obj_spike))
	}
}
scr_monster_collide()
