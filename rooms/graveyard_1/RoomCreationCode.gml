pal_swap_init_system(shd_pal_swapper)
global.roommessage = "PIZZA TOWER WITH THE DEAD"
if (!obj_secretmanager.init)
{
	obj_secretmanager.init = 1
	secret_add(-4, function()
	{
		if secret_check_trigger(0)
			secret_open_portal(0)
		exit;
	}
)
	secret_add(-4, function()
	{
		secret_open_portal(1)
		exit;
	}
)
	secret_add(-4, function()
	{
		if secret_check_trigger(2)
			secret_open_portal(2)
		exit;
	}
)
}
