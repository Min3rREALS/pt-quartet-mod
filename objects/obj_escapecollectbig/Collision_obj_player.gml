if (room == rm_editor)
	exit;
if (image_alpha == 1)
{
	if (other.state != states.gotoplayer)
	{
		if (obj_player1.character == "V")
			global.playerhealth = clamp((global.playerhealth + 10), 0, 100)
		global.heattime = 60
		with (obj_camera)
			healthshaketime = 60
		global.combotime = 60
		scr_soundeffect(sfx_collectpizza)
		instance_destroy()
		var val = heat_calculate(100)
		if (other.object_index == obj_player1)
			global.collect += val
		else
			global.collectN += val
		create_collect(x, y, sprite_index)
		with (instance_create((x + 16), y, obj_smallnumber))
			number = string(val)
	}
}
