var i = 0
repeat (2)
{
	i++
	var _player = asset_get_index(concat("obj_player", i))
	if (_player != self)
	{
		if ((place_meeting((x + 1), y, _player) or place_meeting((x - 1), y, _player)) && _player.state == states.cheeseball)
			instance_destroy()
	}
}
