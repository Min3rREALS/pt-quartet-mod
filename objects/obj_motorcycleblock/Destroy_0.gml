if destroy
{
	global.chieftaincutscene2 = 1
	quick_ini_write_real(get_savefile_ini(), "cutscene", "chieftain2", 1)
	repeat (7)
		create_debris((x + 32), (y + 32), spr_rockdebris)
}
