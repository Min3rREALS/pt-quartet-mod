with (other)
{
	if (state != states.gotoplayer && state != states.actor)
	{
		var changecoord = 1
		if place_meeting(x, y, obj_superspring)
			changecoord = 0
		if changecoord
			y = (other.y - 14)
		vsp = 0
		create_particle(x, y, particle.jumpdust, 0)
		if (boxxed == 0 && isgustavo == 0)
		{
			if (character == "P")
			{
				if (sprite_index != spr_dashpadmach)
				{
					sprite_index = spr_dashpadmach
					image_index = 0
				}
			}
			else if (character == "N")
			{
				if (sprite_index != spr_crazyrun)
				{
					sprite_index = spr_crazyrun
					image_index = 0
				}
			}
			machhitAnim = 0
			state = states.mach3
			xscale = sign(other.image_xscale)
			if (movespeed < 14)
			{
				movespeed = 14
				hsp = (xscale * movespeed)
			}
			else
			{
				movespeed += 0.5
				hsp = (xscale * movespeed)
			}
		}
		else
		{
			xscale = sign(other.image_xscale)
			if boxxed
			{
				boxxeddash = 1
				if (abs(movespeed) < 14)
					movespeed = (xscale * 14)
				else
					movespeed += (xscale * 0.5)
				sprite_index = spr_boxxedpepwalk
				state = states.boxxedpep
			}
			if isgustavo
			{
				ratmount_movespeed = 12
				gustavodash = 51
				state = states.ratmount
				if (abs(movespeed) < 12)
					movespeed = (other.image_xscale * 12)
			}
		}
	}
}
