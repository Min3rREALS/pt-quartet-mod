event_inherited()
state = states.arenaround
ds_map_set(player_hurtstates, states.handstandjump, 30)
ds_map_set(player_hurtstates, states.chainsawbump, 50)
ds_map_set(player_hurtstates, states.mach2, 20)
ds_map_set(player_hurtstates, states.mach3, 30)
ds_map_set(player_hurtstates, states.freefall, 20)
ds_map_set(player_hurtstates, states.punch, 20)
ds_map_set(player_hurtstates, states.tumble, 20)
ds_map_set(player_hurtstates, states.Sjump, 20)
ds_map_set(boss_hurtstates, states.shoulder, 60)
ds_map_set(boss_hurtstates, states.shoulderbash, 60)
ds_map_set(boss_hurtstates, states.boss_supershoulderbash, 90)
ds_map_set(boss_hurtstates, states.superslam, 200)
ds_map_set(boss_hurtstates, states.punch, 30)
ds_map_set(boss_hurtstates, states.freefall, 70)
stunfallspr = spr_pepperman_hurtplayer
walkspr = spr_pepperman_move
idlespr = spr_pepperman_idle
spr_dead = spr_pepperman_timesup
tauntspr = spr_pepperman_taunt
fallspr = spr_pepperman_fall
defeatplayerspr = spr_pepperman_shoulderstart
normal_spd = 6
shoulder_spd = 12
attack_max[0] = 120
attack_max[1] = 80
attack_max[2] = 0
attack_max[3] = 0
attack_max[4] = 0
attack_max[5] = 0
attack_cooldown = attack_max[0]
targetstunned = 0
targetstunnedminus[0] = 40
targetstunnedminus[1] = 40
targetstunnedminus[2] = 40
targetstunnedminus[3] = 40
targetstunnedminus[4] = 40
targetstunnedminus[5] = 40
targetxscale = 1
phase = 1
max_phase = 6
max_hp = (500 * max_phase)
hp = max_hp
xscale = 1
jumping_pepper = 0
shoulderbash_fakeout = 0
groundpound_fakeout = 0
groundpound_readjust = 3
groundpound_readjust_max = 16
groundpound_readjust_buffer = groundpound_readjust_max
readjusting = 0
superjumping_pepper = 0
shoulderturns = 3
target_x = 0
shoulderpound_fakeout = 0
shoulderpound_buffer = 0
shoulderpound_max = 60
chooseparry_max[0] = 600
chooseparry_max[1] = 480
chooseparry_max[2] = 300
chooseparry_max[3] = 300
chooseparry_max[4] = 300
chooseparry_max[5] = 300
chooseparry_random = 4
chooseparry_buffer = chooseparry_max[(phase - 1)]
taunt_buffer = 0
taunt_max = 25
fistmatch_buffer = 0
fistmatch_max = 360
fist_buffer = 0
fist_max = 20
fist_dmg = 10
fist_dmg_player = 20
superattack_hpthreshold = 500
superattack_buffer = 0
superattack_max = 360
function player_destroy(argument0)
{
	SUPER_player_destroy(argument0)
	exit;
}

function boss_destroy(argument0)
{
	hitstate = states.normal
	SUPER_boss_destroy(argument0)
	with (obj_peppermanbrick)
		instance_destroy()
	global.peppermancutscene2 = 1
	quick_ini_write_real(get_savefile_ini(), "cutscene", "pepperman2", 1)
	targetstunned = 1000
	stunned = 1000
	exit;
}

function boss_hurt(argument0, argument1)
{
	if (targetstunned > 0)
	{
		targetstunned -= targetstunnedminus[(phase - 1)]
		attack_cooldown = 0
		if (targetstunned < 0)
			targetstunned = 1
	}
	else
		targetstunned = 150
	SUPER_boss_hurt(argument0, argument1)
	targetxscale = (-argument1.xscale)
	exit;
}

function boss_hurt_noplayer(argument0)
{
	if (targetstunned > 0)
	{
		targetstunned -= targetstunnedminus[(phase - 1)]
		attack_cooldown = 0
		if (targetstunned < 0)
			targetstunned = 1
	}
	else
		targetstunned = 150
	SUPER_boss_hurt_noplayer(argument0)
	exit;
}

function player_hurt(argument0, argument1)
{
	if (argument1.state != states.backbreaker or argument1.parry_inst == -4)
	{
		var _prevstate = state
		SUPER_player_hurt(argument0, argument1)
		if (_prevstate == states.shoulderbash or _prevstate == states.boss_supershoulderbash or _prevstate == states.shoulder or _prevstate == states.superslam)
		{
			with (obj_camera)
			{
				shake_mag = 3
				shake_mag_acc = (3 / room_speed)
			}
			hitstate = states.stun
			stunned = 70
			hitvsp = -4
			hithsp = ((-image_xscale) * 8)
		}
		else if (_prevstate == states.backbreaker)
		{
			with (obj_camera)
			{
				shake_mag = 3
				shake_mag_acc = (3 / room_speed)
			}
			sprite_index = spr_pepperman_throw
			image_index = 0
			hitstate = states.parry
			hitvsp = 0
			hithsp = 0
			movespeed = 8
		}
		else
		{
			hithsp = 0
			hitvsp = -4
			hitstate = states.normal
		}
	}
	else if (state == states.superslam)
	{
		with (argument1)
		{
			if (state == states.hit or state == states.chainsaw)
			{
				x = hitX
				y = hitY
			}
			if (other.state == states.hit or other.state == states.chainsaw)
			{
				other.x = hitX
				other.y = hitY
			}
			sprite_index = spr_idle
			state = states.boss_fistmatch
			hitX = x
			hitY = y
			hsp = 0
			vsp = 0
			movespeed = 0
			other.sprite_index = other.idlespr
			other.state = states.boss_fistmatch
			other.image_xscale = (-xscale)
			other.hitX = (x + (xscale * 16))
			other.hitY = y
			other.hsp = 0
			other.vsp = 0
			other.fistmatch_buffer = other.fistmatch_max
			camera_zoom(0.6, 0.1)
		}
	}
	exit;
}

