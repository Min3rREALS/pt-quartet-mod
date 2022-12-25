event_inherited()
dialog[0] = dialog_create("AAAAAAAAAAAAAAAAAAAAAAAAAAA PRPPINO SPAGHETI    FUCK SHIT SHIT FUCK SHIT          OH NO HE NEEDS YOUR HELP                                                                                 welcome to your desert", -4, function()
{
	if (global.chieftaincutscene == -4 or (!global.chieftaincutscene))
	{
		global.chieftaincutscene = 1
		quick_ini_write_real(get_savefile_ini(), "cutscene", "chieftain", 1)
	}
	exit;
}
)
