function scr_player_knightpepslopes()
{
	if ((x + hsp) == xprevious)
		slope_buffer--
	else
		slope_buffer = 20
	alarm[5] = 2
	alarm[7] = 60
	if (knightmiddairstop == 0)
		hsp = (xscale * movespeed)
	image_speed = 0.35
	if key_jump
		input_buffer_jump = 0
	if ((!key_jump2) && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
	{
		vsp /= 2
		jumpstop = 1
	}
	if (grounded && vsp > 0)
		jumpstop = 0
	if ((!scr_slope()) && grounded)
		sprite_index = spr_knightpepcharge
	if scr_slope()
		sprite_index = spr_knightpepdownslope
	if (input_buffer_jump < 8)
	{
		if (grounded or (!doublejump))
		{
			vsp = -11
			sprite_index = spr_knightpep_fly
			image_index = 0
			input_buffer_jump = 8
			if (!grounded)
			{
				vsp = -11
				doublejump = 1
				sprite_index = spr_knightpep_doublejump
			}
		}
	}
	if ((sprite_index == spr_knightpep_doublejump or sprite_index == spr_knightpep_fly) && floor(image_index) == (image_number - 1))
		image_index = (image_number - 1)
	if (scr_solid((x + sign(hsp)), y) && ((!scr_slope()) or place_meeting((x + sign(hsp)), (y - 2), obj_solid)) && (!(place_meeting((x + sign(hsp)), y, obj_slope))) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))))
	{
		movespeed = 0
		vsp = -6
		sprite_index = spr_knightpep_bump
		image_index = floor((image_number - 1))
		state = states.knightpepbump
		scr_soundeffect(sfx_groundpound)
	}
	if scr_slope()
	{
		with (instance_place(x, (y + 1), obj_slope))
		{
			if (other.xscale == (-sign(image_xscale)))
			{
				if (other.movespeed < 14)
					other.movespeed += 0.25
			}
		}
	}
	if ((!grounded) && key_down2 && sprite_index != spr_knightpep_downtrust)
	{
		with (instance_create(x, y, obj_parryeffect))
			sprite_index = spr_knightpep_downcloud
		sprite_index = spr_knightpep_downtrust
		vsp = -5
		hsp = 0
		movespeed = 0
		state = states.knightpep
	}
	exit;
}

