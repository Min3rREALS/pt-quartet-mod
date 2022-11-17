with (instance_create(x, y, obj_fadeout))
{
	obj_player1.targetRoom = tower_entrancehall
	obj_player1.targetDoor = "A"
	obj_player1.state = states.comingoutdoor
	if (global.coop == true)
	{
		obj_player2.state = states.comingoutdoor
		obj_player2.targetDoor = "A"
	}
}
gamesave_async_load()
