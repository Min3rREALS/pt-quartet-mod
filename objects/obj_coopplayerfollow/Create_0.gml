image_speed = 0.35
depth = -6
xoffset = 25
yoffset = 0
LAG_STEPS = 20
followqueue = ds_queue_create()
spritequeue = ds_queue_create()
ds_list_insert(global.followerlist, 0, id)
pos = ds_list_find_index(global.followerlist, id)
followid = (pos > 0 ? ds_list_find_value(global.followerlist, (pos - 1)) : -4)
following_character_calculate()
dir = obj_player1.xscale
space = 0
maxspace = 1
spaceaccel = 0.2
sprite_index = obj_player2.spr_idle
