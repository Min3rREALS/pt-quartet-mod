if destroy
{
	instance_create(x, y, obj_haystack)
	global.vigilantecutscene3 = 1
	quick_ini_write_real(get_savefile_ini(), "cutscene", "vigilante3", 1)
}
