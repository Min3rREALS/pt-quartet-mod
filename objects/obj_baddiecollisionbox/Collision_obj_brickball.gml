if (instance_exists(baddieID) && baddieID.invtime == 0 && baddieID.rattime <= 0 && baddieID.state != states.grabbed && baddieID.state != states.hit && (!baddieID.invincible) && baddieID.instantkillable)
{
	scr_soundeffect(sfx_punch)
	if (!baddieID.important)
	{
		global.style += (5 + global.combo)
		global.combotime = 60
		global.heattime = 60
	}
	if ((!baddieID.elite) or baddieID.elitehit <= 0)
	{
		if baddieID.destroyable
		{
			instance_destroy()
			instance_destroy(baddieID)
		}
	}
	else
	{
		var lag = 2
		baddieID.hitLag = lag
		baddieID.hitX = baddieID.x
		baddieID.hitY = baddieID.y
		baddieID.hp -= 1
		instance_create(baddieID.x, baddieID.y, obj_parryeffect)
		baddieID.alarm[3] = 3
		baddieID.state = states.hit
		baddieID.image_xscale = (-other.image_xscale)
		instance_create(x, y, obj_slapstar)
		instance_create(x, y, obj_slapstar)
		instance_create(x, y, obj_slapstar)
		instance_create(x, y, obj_baddiegibs)
		instance_create(x, y, obj_baddiegibs)
		instance_create(x, y, obj_baddiegibs)
		with (obj_camera)
		{
			shake_mag = 13
			shake_mag_acc = (3 / room_speed)
		}
		baddieID.invtime = 30
		baddieID.hitvsp = -4
		baddieID.hithsp = (other.image_xscale * 10)
	}
}
