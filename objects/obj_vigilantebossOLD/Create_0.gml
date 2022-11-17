event_inherited()
state = states.arenaround
ds_map_set(player_hurtstates, states.handstandjump, 30)
ds_map_set(player_hurtstates, states.chainsawbump, 50)
ds_map_set(player_hurtstates, states.mach2, 20)
ds_map_set(player_hurtstates, states.mach3, 30)
ds_map_set(boss_hurtstates, states.punch, 30)
ds_map_set(boss_hurtstates, states.crouchslide, 30)
ds_map_set(boss_hurtstates, states.uppunch, 30)
ds_map_set(boss_hurtstates, states.handstandjump, 30)
ds_map_set(boss_hurtstates, states.punch, 60)
ds_map_set(boss_hurtstates, states.boss_millionpunch, 20)
ds_map_set(boss_hurtstates, states.freefall, 60)
phase = 1
max_phase = 6
max_hp = (500 * max_phase)
hp = max_hp
stunfallspr = spr_playerV_hurt
walkspr = spr_playerV_move
idlespr = spr_playerV_idle
spr_dead = spr_playerV_dead
tauntspr = spr_playerV_taunt
fallspr = spr_playerV_fall
bumpspr = spr_playerV_bump
parryspr = spr_playerV_hitwall
defeatplayerspr = spr_playerV_hitwall
movespeed = 0
move = 0
normal_spd = 6
changeside_spd = 10
dynamite_buffer = 0
dynamite_max = 20
dynamite_count = 1
millionpunch_buffer = 0
millionpunch_max = 180
normalattack_cooldown = 0
normalattack_max[3] = 180
normalattack_max[4] = 120
normalattack_max[5] = 60
cancel_buffer = 0
cancel_max = ds_map_create()
cancel_maxdefault = 60
ds_map_set(cancel_max, states.boss_millionpunch, (millionpunch_max / 2))
ds_map_set(cancel_max, states.boss_groundpunchstart, 10)
ds_map_set(cancel_max, states.revolver, 30)
ds_map_set(cancel_max, states.mach1, 120)
combo_count = 0
duelintro_buffer = 0
duelintro_max = 240
duelhp_threshold = 300
duelseconds_threshold = 25
duel_buffer = 0
duel_max = 120
duel_random = 80
duelinst = -4
revolver_count = 0
revolver_jump = -1
revolver_jumpcount = 0
dynamite_shot = 0
superkickattackpursuit = 0
superkickattack_jump = 0
changeside_skid = 0
honor = 1
nexthonor = 1
chooseparry_max[0] = 480
chooseparry_max[1] = 420
chooseparry_max[2] = 360
chooseparry_max[3] = 300
chooseparry_max[4] = 300
chooseparry_max[5] = 300
chooseparry_random = 4
chooseparry_buffer = chooseparry_max[(phase - 1)]
taunt_buffer = 0
taunt_max = 25
attack_max[0] = 120
attack_max[1] = 80
attack_max[2] = 70
attack_max[3] = 70
attack_max[4] = 80
attack_max[5] = 80
attack_cooldown = attack_max[0]
dashcloudid = -4
targetstunned = 0
targetstunnedminus[0] = 30
targetstunnedminus[1] = 30
targetstunnedminus[2] = 30
targetstunnedminus[3] = 30
targetstunnedminus[4] = 30
targetstunnedminus[5] = 30
function boss_destroy(argument0)
{
	SUPER_boss_destroy(argument0)
	targetstunned = 1000
	stunned = 1000
	global.vigilantecutscene2 = 1
	quick_ini_write_real(get_savefile_ini(), "cutscene", "vigilante2", 1)
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
	if ((!argument1.inv_frames) && (argument1.state != states.backbreaker or argument1.parry_inst == -4))
	{
		hitstate = state
		hithsp = hsp
		hitvsp = vsp
		if (state != states.uppunch or vsp < 0)
		{
			SUPER_player_hurt(argument0, argument1)
			with (argument1)
			{
				inv_frames = 1
				alarm[1] = 15
			}
			if (hitstate == states.boss_superattack)
			{
				hithsp = 0
				hitvsp = 0
			}
		}
	}
	exit;
}

