function scr_player_freefall()
{
	landAnim = 1
	if (vsp >= 2)
		vsp += 0.5
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_bodyslamstart)
		sprite_index = spr_bodyslamfall
	move = (key_left + key_right)
	if (!grounded)
	{
		if (sprite_index != spr_rockethitwall)
			hsp = (move * movespeed)
		else
			hsp = 0
		if (move != xscale && momemtum == 1 && movespeed != 0)
			movespeed -= 0.05
		if (movespeed == 0)
			momemtum = 0
		if ((move == 0 && momemtum == 0) or scr_solid((x + hsp), y))
		{
			movespeed = 0
			mach2 = 0
		}
		if (move != 0 && movespeed < 7)
			movespeed += 0.25
		if (movespeed > 7)
			movespeed -= 0.05
		if ((scr_solid((x + 1), y) && move == 1) or (scr_solid((x - 1), y) && move == -1))
			movespeed = 0
		if (dir != xscale)
		{
			mach2 = 0
			dir = xscale
			movespeed = 0
		}
		if (move == (-xscale))
		{
			mach2 = 0
			movespeed = 0
			momemtum = 0
		}
		if (move != 0)
			xscale = move
	}
	if (vsp > 0)
		freefallsmash++
	else if (vsp < 0)
		freefallsmash = -14
	if (freefallsmash >= 10 && (!instance_exists(superslameffectid)))
	{
		with (instance_create(x, y, obj_superslameffect))
		{
			playerid = other.object_index
			other.superslameffectid = id
		}
	}
	if (grounded && (freefallsmash < 10 or (!(place_meeting(x, (y + vsp), obj_metalblock)))) && (!(place_meeting(x, (y + vsp), obj_destructibles))))
	{
		if scr_slope()
		{
			with (instance_place(x, (y + 1), obj_slope))
			{
				other.xscale = (-sign(image_xscale))
				other.state = states.tumble
				other.sprite_index = other.spr_crouchslip
				if (other.freefallsmash > 20)
					other.movespeed = 12
				else
					other.movespeed = 8
				with (instance_create(other.x, other.y, obj_jumpdust))
					image_xscale = (-other.image_xscale)
			}
		}
		else
		{
			scr_soundeffect(sfx_groundpound)
			if (sprite_index == spr_player_poundcancel1)
				sprite_index = spr_player_poundcancel2
			else if (shotgunAnim == 0)
				sprite_index = spr_bodyslamland
			else
				sprite_index = spr_shotgunjump2
			image_index = 0
			state = states.freefallland
			jumpAnim = 1
			jumpstop = 0
			with (obj_camera)
			{
				shake_mag = 5
				shake_mag_acc = (15 / room_speed)
			}
			if (freefallsmash >= 10)
			{
				with (obj_baddie)
				{
					if (shakestun && grounded && point_in_camera(x, y, view_camera[0]) && grounded && vsp > 0 && (!invincible) && groundpound)
					{
						state = states.stun
						if (stunned < 60)
							stunned = 60
						vsp = -11
						image_xscale *= -1
						hsp = 0
						momentum = 0
					}
				}
				with (obj_camera)
				{
					shake_mag = 10
					shake_mag_acc = (30 / room_speed)
				}
				combo = 0
				bounce = 0
			}
			create_particle(x, (y + 3), particle.groundpoundeffect, 0)
			freefallstart = 0
		}
	}
	image_speed = 0.35
	if (sprite_index == spr_bodyslamstart)
		image_speed = 0.4
	if (character == "M")
	{
		if (!key_down)
		{
			state = states.jump
			sprite_index = spr_fall
			image_index = 0
		}
	}
	exit;
}

