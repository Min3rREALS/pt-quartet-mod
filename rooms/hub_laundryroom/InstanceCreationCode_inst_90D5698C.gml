if (global.factorycutscene == -4)
	global.factorycutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "factory", 0)
if global.factorycutscene
	electricity = 1
