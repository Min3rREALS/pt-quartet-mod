image_speed = 0.5
playerid = ((!(place_meeting(x, y, obj_player))) ? instance_nearest(x, y, obj_player) : instance_place(x, y, obj_player))
image_xscale = playerid.xscale
is_solid = 1
spd = 25
spdh = 0
pistol = 0
shotgun = 0
