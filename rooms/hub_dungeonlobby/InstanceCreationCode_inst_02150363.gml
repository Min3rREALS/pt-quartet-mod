if (global.dungeoncutscene == -4)
	global.dungeoncutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "dungeon", 0)
if (global.levelcomplete && (!global.dungeoncutscene))
{
	global.levelcomplete = 0
	currentroom = room
	scene_info = [[cutscene_entrance_start], [cutscene_waitfor_sprite, obj_player1], [cutscene_player_idleanim], [cutscene_change_room, hub_pizzatowercomplex], [cutscene_set_player_visible, 0], [cutscene_player_float, 1], [cutscene_set_player_pos, 1696, 1600], [cutscene_wait, 40], [cutscene_dungeon_middle], [cutscene_wait, 200], [cutscene_change_room, currentroom], [cutscene_player_float, 0], [cutscene_set_player_visible, 1], [cutscene_dungeon_end], [cutscene_save_game]]
}
else if global.levelcomplete
{
	global.levelcomplete = 0
	scene_info = [[cutscene_save_game]]
}
else
	scene_info = [[cutscene_wait, 20]]
