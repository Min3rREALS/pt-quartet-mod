function scr_player_stringfling()
{
	sprite_index = spr_player_mrpinch
	hsp = (move * movespeed)
	movespeed = 2
	vsp = 2
	move = (key_left + key_right)
	if (move != 0)
		xscale = move
	exit;
}

