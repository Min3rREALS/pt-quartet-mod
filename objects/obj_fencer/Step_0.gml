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
	case states.pummel:
		scr_enemy_pummel()
		break
	case states.staggered:
		scr_enemy_staggered()
		break
	case states.rage:
		scr_enemy_rage()
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
var player = instance_nearest(x, y, obj_player)
if (ragebuffer > 0)
	ragebuffer--
if (player.x > (x - 400) && player.x < (x + 400) && y <= (player.y + 60) && y >= (player.y - 60))
{
	if (state != states.rage && ragebuffer == 0 && elite && (state == states.walk or state == states.charge))
	{
		state = states.rage
		sprite_index = spr_fencer_rage
		if (x != player.x)
			image_xscale = (-(sign((x - player.x))))
		ragebuffer = 100
		image_index = 0
		image_speed = 0.5
		flash = 1
		alarm[4] = 5
		create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale)
	}
	else if (x != player.x && grounded)
	{
		if (state == states.walk && charging == 0)
		{
			with (instance_create(x, y, obj_forkhitbox))
				ID = other.id
			charging = 1
			state = states.charge
			movespeed = 5
			vsp = -7
			sprite_index = spr_fencer_chargestart
		}
	}
}
if (state == states.stun or state == states.walk)
{
	charging = 0
	movespeed = 0
}
if (sprite_index == spr_fencer_chargestart && floor(image_index) == (image_number - 1))
	sprite_index = spr_fencer_charge
if (flash == 1 && alarm[2] <= 0)
	alarm[2] = (0.15 * room_speed)
if (hitboxcreate == 0 && (state == states.walk or state == states.rage or state == states.charge))
{
	hitboxcreate = 1
	with (instance_create(x, y, obj_forkhitbox))
		ID = other.id
}
if (state != states.grabbed)
	depth = 0
if (state != states.stun)
	thrown = false
if (boundbox == 0)
{
	with (instance_create(x, y, obj_baddiecollisionbox))
	{
		sprite_index = other.sprite_index
		baddieID = other.id
		other.boundbox = 1
	}
}
