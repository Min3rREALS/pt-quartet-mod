var p = other.id
with (instance_create(x, (y - 60), obj_grabbiehand))
{
	playerid = p
	state = states.grabbing
	fake = 1
}
instance_destroy()
