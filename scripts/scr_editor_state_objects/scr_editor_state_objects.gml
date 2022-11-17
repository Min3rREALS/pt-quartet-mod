function scr_editor_state_objects()
{
	var mx = mouse_x
	var my = mouse_y
	if (button == -4 && key_mbleft2)
	{
		scr_editor_get_object_mouse(mx, my)
		if (object != -4 && ds_list_empty(selectedobjects))
			scr_do_command(new PlaceCommand(mx, my, object))
		if (!ds_list_empty(selectedobjects))
		{
			for (var i = 0; i < ds_list_size(selectedobjects); i++)
			{
				var b = ds_list_find_value(selectedobjects, i)
				with (b)
					selected = 1
			}
		}
	}
}

function scr_editor_get_object_mouse(argument0, argument1)
{
	scr_editor_clear_selectedobjects()
	var num = instance_place_list(argument0, argument1, obj_fakeobject, global.instancelist, 1)
	var o = noone
	for (i = 0; i < num; i++)
	{
		b = ds_list_find_value(global.instancelist, i)
		with (b)
		{
			if (layerdepth == other.layerdepth && (o == noone or depth < o.depth))
				o = b
		}
	}
	ds_list_clear(global.instancelist)
	if (o != noone)
		ds_list_add(selectedobjects, o)
}

function scr_editor_clear_selectedobjects()
{
	for (i = 0; i < ds_list_size(selectedobjects); i++)
	{
		b = ds_list_find_value(selectedobjects, i)
		with (b)
			selected = 0
	}
	ds_list_clear(selectedobjects)
}
