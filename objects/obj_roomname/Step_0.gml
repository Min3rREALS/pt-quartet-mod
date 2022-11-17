//Text
if showtext && !(instance_exists(obj_tv) && sprite_exists(obj_tv.bubblespr))
	yi = min(yi + 5, 30);
else
{
	if showtext
	{
		yi -= 5;
		if alarm[0] > -1
			alarm[0]++;
	}
	yi = max(yi - 1, -50);
}

