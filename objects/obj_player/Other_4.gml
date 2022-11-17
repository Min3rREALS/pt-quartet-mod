savedhallwaydirection = hallwaydirection
savedhallway = hallway
savedvhallwaydirection = vhallwaydirection
savedverticalhallway = verticalhallway
with (obj_secretportal)
{
	if secret
	{
		if (!instance_exists(obj_ghostcollectibles))
		{
			instance_create(0, 0, obj_ghostcollectibles)
			trace(instance_number(obj_ghostcollectibles))
		}
	}
}
if (!is_bossroom())
	hitstunned = 0
if global.levelreset
{
	scr_playerreset()
	global.levelreset = 0
}
if (state == states.comingoutdoor && global.coop == true && (!(place_meeting(x, y, obj_exitgate))))
{
	if (object_index == obj_player1 && obj_player1.spotlight == 0)
		visible = false
	if (object_index == obj_player2 && obj_player1.spotlight == 1)
		visible = false
}
if (global.coop == true)
{
	scr_changetoppings()
	if (!instance_exists(obj_cooppointer))
		instance_create(x, y, obj_cooppointer)
	if (!instance_exists(obj_coopflag))
		instance_create(x, y, obj_coopflag)
}
if (state == states.grab)
	state = states.normal
if (place_meeting(x, y, obj_boxofpizza) or place_meeting(x, (y - 1), obj_boxofpizza))
{
	box = 1
	hallway = 0
	state = states.crouch
}
if (object_index != obj_player2 or global.coop == true)
{
	if (targetDoor == "A" && instance_exists(obj_doorA))
	{
		if (hallway == 1)
			x = (obj_doorA.x + (hallwaydirection * 100))
		else if (box == 1)
			x = (obj_doorA.x + 32)
		else
			x = (obj_doorA.x + 16)
		y = (obj_doorA.y - 14)
	}
	if (targetDoor == "B" && instance_exists(obj_doorB))
	{
		if (hallway == 1)
			x = (obj_doorB.x + (hallwaydirection * 100))
		else if (box == 1)
			x = (obj_doorB.x + 32)
		else
			x = (obj_doorB.x + 16)
		y = (obj_doorB.y - 14)
	}
	if (targetDoor == "C" && instance_exists(obj_doorC))
	{
		if (hallway == 1)
			x = (obj_doorC.x + (hallwaydirection * 100))
		else if (box == 1)
			x = (obj_doorC.x + 32)
		else
			x = (obj_doorC.x + 16)
		y = (obj_doorC.y - 14)
	}
	if (targetDoor == "D" && instance_exists(obj_doorD))
	{
		if (hallway == 1)
			x = (obj_doorD.x + (hallwaydirection * 100))
		else if (box == 1)
			x = (obj_doorD.x + 32)
		else
			x = (obj_doorD.x + 16)
		y = (obj_doorD.y - 14)
	}
	if (targetDoor == "E" && instance_exists(obj_doorE))
	{
		if (hallway == 1)
			x = (obj_doorE.x + (hallwaydirection * 100))
		else if (box == 1)
			x = (obj_doorE.x + 32)
		else
			x = (obj_doorE.x + 16)
		y = (obj_doorE.y - 14)
	}
	if (targetDoor == "F" && instance_exists(obj_doorF))
	{
		if (hallway == 1)
			x = (obj_doorF.x + (hallwaydirection * 100))
		else if (box == 1)
			x = (obj_doorF.x + 32)
		else
			x = (obj_doorF.x + 16)
		y = (obj_doorF.y - 14)
	}
}
if verticalhallway
{
	verticalbuffer = 2
	var _vinst = noone
	with (obj_verticalhallway)
	{
		event_perform(ev_step, ev_step_normal)
		if (targetDoor == other.targetDoor)
			_vinst = id
	}
	if (_vinst != noone)
	{
		x = (_vinst.x + (_vinst.sprite_width * vertical_x))
		var bbox_size = abs((bbox_right - bbox_left))
		x = clamp(x, (_vinst.x + bbox_size), (_vinst.bbox_right - bbox_size))
		trace(x, _vinst.x)
		if (vhallwaydirection > 0)
			y = (_vinst.bbox_bottom + 32)
		else
			y = (_vinst.bbox_top - 78)
		if (verticalstate == states.climbwall)
			state = states.climbwall
		if (state == states.climbwall)
		{
			x = round(x)
			var i = 0
			while (!(scr_solid((x + xscale), y)))
			{
				x += xscale
				trace(x)
				i++
				if (i > room_width)
					break
				else
					continue
			}
		}
		y += verticalhall_vsp
		vsp = verticalhall_vsp
	}
	y += (vhallwaydirection * 20)
	y = floor(y)
	verticalstate = states.normal
}
if (character == "M" && place_meeting(x, y, obj_boxofpizza))
{
	while place_meeting(x, y, obj_boxofpizza)
	{
		var _inst = instance_place(x, y, obj_boxofpizza)
		y -= _inst.image_yscale
	}
}
if (state == states.taxi)
{
	x = obj_stopsign.x
	y = obj_stopsign.y
}
hallway = 0
verticalhallway = 0
box = 0
if isgustavo
	brick = 1
if place_meeting(x, y, obj_exitgate)
{
	with (instance_place(x, y, obj_exitgate))
		other.x = x
}
if (room == rank_room)
{
	x = rankpos_x
	y = rankpos_y
}
roomstartx = x
roomstarty = y
