function scr_ratmountsounds()
{
	with (obj_player)
	{
			if brick
			{
				if (!landAnim)
				{
					if (hsp != 0)
					{
						if (ratmount_movespeed >= 12)
						{
							ratroll = audio_play_sound(sfx_rattumble, 1, false)
							sfx_gain(ratroll)
						}
						else if (ratmount_movespeed < 12)
						audio_stop_sound(ratroll)
					}
				}
			}
		}
	}
