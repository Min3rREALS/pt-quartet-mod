function scr_player_Sjump()
{
	move = (key_right + key_left)
	hsp = 0
	mach2 = 0
	jumpAnim = 1
	dashAnim = 1
	landAnim = 0
	moveAnim = 1
	stopAnim = 1
	crouchslideAnim = 1
	crouchAnim = 0
	machhitAnim = 0
	if ((sprite_index == spr_superjump or sprite_index == spr_superspringplayer) && (character == "N" or character == "P" or character == "I"))
		vsp = sjumpvsp
	sjumpvsp -= 0.1
	if (character == "V" && image_index > 3)
		vsp = -11
	if (sprite_index == spr_player_supersidejump)
	{
		if (a < 25)
			a++
		hsp = (xscale * a)
		vsp = 0
	}
	if (scr_solid(x, (y - 1)) && (!(place_meeting(x, (y - 1), obj_destructibles))))
	{
		pizzapepper = 0
		a = 0
		if (sprite_index == spr_player_supersidejump)
			sprite_index = spr_player_supersidejumpland
		if (sprite_index == spr_superjump or sprite_index == spr_superspringplayer)
			sprite_index = spr_superjumpland
		with (obj_camera)
		{
			shake_mag = 110
			shake_mag_acc = (30 / room_speed)
		}
		with (obj_baddie)
		{
			if (shakestun && point_in_camera(x, y, view_camera[0]) && grounded && vsp > 0)
			{
				image_index = 0
				if grounded
					vsp = -7
			}
		}
		scr_soundeffect(sfx_groundpound)
		image_index = 0
		state = states.Sjumpland
		machhitAnim = 0
	}
	else if (key_slap2 && (character == "P" or character == "I") && sprite_index != spr_superspringplayer && sprite_index != spr_Sjumpcancelstart)

	{
		image_index = 0
		sprite_index = spr_Sjumpcancelstart
	}
	if (sprite_index == spr_Sjumpcancelstart && (character == "P" or character == "I"))
	{
		vsp = 0
		if (move != 0)
			xscale = move
		if (floor(image_index) == (image_number - 1))
		{
			vsp = -1
			movespeed = 4
			image_index = 0
			sprite_index = spr_Sjumpcancel
			scr_soundeffect(sfx_suplexdash)
			state = states.punch
			with (instance_create(x, y, obj_crazyruneffect))
				image_xscale = other.xscale
		}
	}
	if (character == "N" && key_jump2)
	{
		scr_soundeffect(sfx_jump)
		scr_soundeffect(sfx_woosh)
		jumpstop = 0
		vsp = -15
		state = states.jump
		sprite_index = spr_playerN_noisebombspinjump
		image_index = 0
		with (instance_create(x, y, obj_jumpdust))
			image_xscale = other.xscale
	}
	if (character == "N")
	{
		if (move == 1)
			hsp = 3
		if (move == -1)
			hsp = -3
	}
	if (character == "V" && floor(image_index) == (image_number - 1))
	{
		state = states.jump
		sprite_index = spr_playerV_fall
	}
	image_speed = 0.5
	scr_collide_player()
	exit;
}