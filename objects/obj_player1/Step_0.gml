if (room == rm_editor)
{
	visible = false
	exit;
}
if (room == custom_lvl_room)
{
	if place_meeting(x, y, par_camera_editor)
	{
		cam = instance_place(x, y, par_camera_editor)
		cam_width = instance_place(x, y, par_camera_editor).width
		cam_height = instance_place(x, y, par_camera_editor).height
		with (obj_camera)
			bound_camera = 1
	}
	else
	{
		cam = -4
		cam_width = 0
		cam_height = 0
		instance_activate_all()
		with (obj_camera)
			bound_camera = 0
	}
}
scr_getinput()
event_inherited()
