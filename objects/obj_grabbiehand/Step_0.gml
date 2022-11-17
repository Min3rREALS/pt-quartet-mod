switch state
{
	case states.normal:
		break
	case states.transitioncutscene:
		if (floor(image_index) == (image_number - 1))
		{
			state = states.fall
			sprite_index = spr_grabbiehand_fall
		}
		break
	case states.fall:
		var spd = 12
		shootdir = angle_rotate(shootdir, point_direction(x, y, targetplayer.x, targetplayer.y), turnspeed)
		hsp = lengthdir_x(spd, shootdir)
		vsp = lengthdir_y(spd, shootdir)
		if (hsp != 0)
			image_xscale = sign(hsp)
		if grounded
		{
			state = states.stun
			stunned = 50
			hsp = 0
			vsp = 0
			sprite_index = spr_grabbiehand_catch
		}
		scr_collide()
		break
	case states.stun:
		if (stunned > 0)
			stunned--
		else if grounded
		{
			state = states.ejected
			sprite_index = spr_grabbiehand_idle
			grounded = false
		}
		if grounded
			hsp = 0
		scr_collide()
		break
	case states.ejected:
		var _dir = point_direction(x, y, xstart, ystart)
		x = Approach(x, xstart, abs(lengthdir_x(8, _dir)))
		y = Approach(y, ystart, abs(lengthdir_y(8, _dir)))
		if (x > (xstart - 8) && x < (xstart + 8) && y > (ystart - 8) && y < (ystart + 8))
		{
			state = states.normal
			x = xstart
			y = ystart
		}
		break
	case states.grabbing:
		sprite_index = spr_grabbiehand_catch
		if (!reverse)
			vsp = -14
		else
			vsp = 14
		hsp = 0
		with (playerid)
		{
			hsp = 0
			vsp = 0
			x = other.x
			y = other.y
			xscale = other.image_xscale
			if (object_index != obj_pizzagoblinbomb)
			{
				state = states.bump
				if (boxxed == 0)
					sprite_index = spr_player_catched
				else
					sprite_index = spr_boxxedpep_air
			}
		}
		if (scr_solid(x, (y - 1)) or (reverse && scr_solid(x, (y + 1))) or place_meeting(x, y, obj_verticalhallway) or place_meeting(x, y, obj_hallway))
		{
			if (playerid == obj_player1.id)
			{
				with (playerid)
				{
					movespeed = tauntstoredmovespeed
					vsp = 0
					sprite_index = tauntstoredsprite
					state = tauntstoredstate
				}
			}
			sprite_index = spr_grabbiehand_idle
			state = states.ejected
			if fake
				instance_destroy()
		}
		scr_collide()
		break
	default:

}

