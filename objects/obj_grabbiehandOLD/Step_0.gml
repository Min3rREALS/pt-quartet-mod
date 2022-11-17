if (sprite_index == spr_grabbiehand_hifive && floor(image_index) == (image_number - 1))
{
	sprite_index = spr_grabbiehand_idle
	thumbingup = 0
	image_xscale = 1
}
for (var i = 0; i < 2; i++)
{
	var targetplayer = asset_get_index(concat("obj_player", (i + 1)))
	if (distance_to_pos(x, y, xstart, ystart, 6, 6) && targetplayer.sprite_index != spr_player_catched && targetplayer.x > (x - 50) && targetplayer.x < (x + 50) && targetplayer.y > y && targetplayer.y < (y + 200) && (!thumbingup))
	{
		delay--
		if (delay <= 0)
		{
			grav = 0.35
			vsp = 10
			sprite_index = spr_grabbiehand_fall
			delay = 5
		}
	}
}
if grabbing
{
	if (sprite_index == spr_grabbiehand_catch && (!released))
	{
		var _normalaccel = 1
		if distance_to_pos(x, y, grab_xstart, grab_ystart, 78, 78)
		{
			trace("start")
			accel += 0.8
			_normalaccel = 0
		}
		if distance_to_pos(x, y, dropspotx, dropspoty, 70, 70)
		{
			trace("end")
			accel -= 0.5
			_normalaccel = 0
		}
		if _normalaccel
		{
			trace("middle")
			accel = maxaccel
		}
		accel = clamp(accel, 0.25, maxaccel)
		trace(accel)
		x = Approach(x, dropspotx, accel)
		y = Approach(y, dropspoty, accel)
	}
	if (distance_to_pos(x, y, dropspotx, dropspoty, 5, 5) && (!released))
	{
		player.state = states.freefall
		player.x = dropspotx
		player.y = dropspoty
		player = -4
		image_index = 0
		sprite_index = spr_grabbiehand_release
		released = 1
	}
	if (sprite_index == spr_grabbiehand_release && floor(image_index) == (image_number - 1) && released)
		sprite_index = spr_grabbiehand_idle
	if (sprite_index == spr_grabbiehand_idle)
	{
		if released
		{
			if (xstarte > x)
				x += 4
			if (xstarte < x)
				x -= 4
			if (ystarte > y)
				y += 4
			if (ystarte < y)
				y -= 4
		}
		if (distance_to_pos(x, y, xstart, ystart, 6, 6) && grabbing)
		{
			grabbing = 0
			released = 0
		}
	}
}
else
{
	if (sprite_index == spr_grabbiehand_fall && grounded)
	{
		grav = 0
		sprite_index = spr_grabbiehand_idle
		vsp = -3
	}
	if (y <= (ystart + 6) && y >= (ystart - 6) && vsp < 0)
		vsp = 0
}
