if (room == rm_editor)
	exit;
switch state
{
	case states.idle:
		scr_enemy_idle()
		break
	case states.charge:
		scr_enemy_charge()
		break
	case states.turn:
		scr_enemy_turn()
		break
	case states.walk:
		scr_enemy_walk()
		break
	case states.land:
		scr_enemy_land()
		break
	case states.hit:
		scr_enemy_hit()
		break
	case states.stun:
		scr_enemy_stun()
		break
	case states.pizzagoblinthrow:
		scr_pizzagoblin_throw()
		break
	case states.grabbed:
		scr_enemy_grabbed()
		break
}

if (state == states.stun && stunned > 100 && birdcreated == 0)
{
	birdcreated = 1
	with (instance_create(x, y, obj_enemybird))
		ID = other.id
}
if (state != states.stun)
	birdcreated = 0
scr_scareenemy()
if (flash == 1 && alarm[2] <= 0)
	alarm[2] = (0.15 * room_speed)
if (state != states.grabbed)
	depth = 0
if (state != states.stun)
	thrown = false
if (bombreset > 0)
	bombreset--
targetplayer = (global.coop ? instance_nearest(x, y, obj_player) : obj_player1)
if (sprite_index == spr_archergoblin_shoot)
	image_xscale = (-(sign((x - targetplayer.x))))
if (x != targetplayer.x && targetplayer.state != states.bombpep && state != states.pizzagoblinthrow && bombreset == 0 && grounded)
{
	if (targetplayer.x > (x - 200) && targetplayer.x < (x + 200) && y <= (targetplayer.y + 200) && y >= (targetplayer.y - 200))
	{
		if (state == states.walk or state == states.idle)
		{
			sprite_index = spr_archergoblin_shoot
			image_index = 0
			image_xscale = (-(sign((x - targetplayer.x))))
			state = states.pizzagoblinthrow
		}
	}
}
if instance_exists(obj_player2)
{
	if (x != obj_player2.x && obj_player2.state != states.bombpep && state != states.pizzagoblinthrow && bombreset == 0 && grounded)
	{
		if (obj_player2.x > (x - 200) && obj_player2.x < (x + 200) && y <= (obj_player2.y + 200) && y >= (obj_player2.y - 200))
		{
			if (state == states.walk or state == states.idle)
			{
				sprite_index = spr_archergoblin_shoot
				image_index = 0
				image_xscale = (-(sign((x - obj_player2.x))))
				state = states.pizzagoblinthrow
			}
		}
	}
}
if (boundbox == 0)
{
	with (instance_create(x, y, obj_baddiecollisionbox))
	{
		sprite_index = other.sprite_index
		mask_index = other.sprite_index
		baddieID = other.id
		other.boundbox = 1
	}
}
