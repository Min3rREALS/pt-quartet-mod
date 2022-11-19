image_speed = 0.35
if (trashbuffer > 0)
	trashbuffer--
switch state
{
	case states.normal:
		with (obj_player)
		{
			if (other.state == states.normal && state != states.trashjumpprep && other.trashbuffer <= 0 && place_meeting(x, y, other))
			{
				state = states.trashjumpprep
				sprite_index = spr_player_trashstart
				scr_soundeffect(sfx_trash)
				image_index = 0
				xscale = other.image_xscale
				other.shot = 0
				other.playerid = id
				other.state = states.trashjumpprep
				other.sprite_index = spr_trash_flingstart
				other.image_index = 0
			}
		}
		break
	case states.trashjumpprep:
		with (playerid)
		{
			if (floor(image_index) == (image_number - 1))
				image_index = (image_number - 3)
		}
		if (!shot)
		{
			playerid.x = x
			playerid.hsp = 0
			playerid.vsp = 0
			switch image_index
			{
				case 0:
					playerid.y = (y - 56)
					break
				case 1:
					playerid.y = (y - 53)
					break
				case 2:
					playerid.y = (y - 48)
					break
				case 3:
					playerid.y = (y - 44)
					break
				case 4:
					playerid.y = (y - 44)
					break
				case 5:
					playerid.y = (y - 40)
					break
				default:
					playerid.y = (y - 40)
					break
			}

			if (floor(image_index) == 10)
			{
				shot = 1
				with (playerid)
				{
					x = other.x
					y = other.y
					sprite_index = spr_player_trashjump
					image_index = 0
					movespeed = 0
					state = states.trashjump
					vsp = -25
				}
			}
		}
		if (floor(image_index) == (image_number - 1))
		{
			sprite_index = spr_trash
			state = states.normal
			trashbuffer = 30
		}
		break
}

scr_collide()
