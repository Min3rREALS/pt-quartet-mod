function scr_enemy_grabbed()
{
	if (!pepperman_grab)
	{
		var _obj_player = asset_get_index(concat("obj_player", grabbedby))
		image_xscale = (-_obj_player.xscale)
		stunned = 200
		_obj_player.baddiegrabbedID = id
		if (_obj_player.state == states.grabbing or _obj_player.state == states.grab or _obj_player.state == states.throwing or _obj_player.state == states.slam or _obj_player.state == states.tacklecharge)
		{
			x = _obj_player.x
			if (_obj_player.sprite_index != _obj_player.spr_haulingstart)
				y = (_obj_player.y - 40)
			else if (floor(_obj_player.image_index) == 0)
				y = _obj_player.y
			else if (floor(_obj_player.image_index) == 1)
				y = (_obj_player.y - 10)
			else if (floor(_obj_player.image_index) == 2)
				y = (_obj_player.y - 20)
			else if (floor(_obj_player.image_index) == 3)
				y = (_obj_player.y - 30)
			image_xscale = (-_obj_player.xscale)
		}
		with (_obj_player)
		{
			suplexhavetomash = (other.hp - 1)
			move = (key_left2 + key_right2)
			if (!((state == states.grab or state == states.chainsaw or state == states.pummel or state == states.finishingblow or state == states.grabbing or state == states.throwing or state == states.slam or state == states.tacklecharge or state == states.punch or state == states.superslam or state == states.backkick or state == states.uppunch or state == states.shoulder)))
			{
				other.x = x
				other.y = y
				other.state = states.stun
				other.image_index = 0
			}
		}
		hsp = 0
		if (_obj_player.state == states.punch or _obj_player.state == states.parry)
		{
			alarm[3] = 3
			global.hit += 1
			if (other.object_index == obj_pizzaball)
				global.golfhit += 1
			instance_create((x + (_obj_player.xscale * 30)), y, obj_bumpeffect)
			alarm[1] = 5
			thrown = true
			x = _obj_player.x
			vsp = 0
			y = _obj_player.y
			state = states.stun
			hsp = ((-image_xscale) * 25)
			grav = 0
			global.combotime = 60
			if (!important)
				global.style += (5 + global.combo)
			instance_create(x, y, obj_slapstar)
			instance_create(x, y, obj_baddiegibs)
			flash = 1
			with (obj_camera)
			{
				shake_mag = 13
				shake_mag_acc = (3 / room_speed)
			}
		}
		if (_obj_player.state == states.finishingblow)
		{
			if (floor(_obj_player.image_index) < 1 && _obj_player.sprite_index == _obj_player.spr_swingdingend)
			{
				x = (_obj_player.x + (_obj_player.xscale * 60))
				y = _obj_player.y
			}
			else if (floor(_obj_player.image_index) < 4)
			{
				x = (_obj_player.x + (_obj_player.xscale * 60))
				y = _obj_player.y
			}
			check_grabbed_solid(_obj_player)
		}
		if (_obj_player.state == states.backkick)
		{
			alarm[3] = 3
			global.hit += 1
			if (other.object_index == obj_pizzaball)
				global.golfhit += 1
			hp -= 1
			instance_create((x + ((-_obj_player.xscale) * 50)), y, obj_bumpeffect)
			alarm[1] = 5
			thrown = true
			x = _obj_player.x
			y = _obj_player.y
			state = states.stun
			image_xscale *= -1
			hsp = ((-image_xscale) * 20)
			vsp = -7
			global.combotime = 60
			if (!important)
				global.style += (5 + global.combo)
			instance_create(x, y, obj_slapstar)
			instance_create(x, y, obj_baddiegibs)
			flash = 1
			with (obj_camera)
			{
				shake_mag = 13
				shake_mag_acc = (3 / room_speed)
			}
		}
		if (_obj_player.state == states.shoulder)
		{
			alarm[3] = 3
			global.hit += 1
			if (other.object_index == obj_pizzaball)
				global.golfhit += 1
			hp -= 1
			instance_create(x, (y + 20), obj_bumpeffect)
			alarm[1] = 5
			thrown = true
			x = _obj_player.x
			y = _obj_player.y
			state = states.stun
			if (_obj_player.sprite_index == spr_player_shoulder)
				vsp = 15
			if (_obj_player.sprite_index == spr_player_diagonaldownthrow)
			{
				hsp = ((-image_xscale) * 10)
				vsp = 15
			}
			if (_obj_player.sprite_index == spr_player_diagonalupthrow)
			{
				hsp = ((-image_xscale) * 10)
				vsp = -15
			}
			global.combotime = 60
			if (!important)
				global.style += (5 + global.combo)
			instance_create(x, y, obj_slapstar)
			instance_create(x, y, obj_baddiegibs)
			flash = 1
			with (obj_camera)
			{
				shake_mag = 13
				shake_mag_acc = (3 / room_speed)
			}
		}
		if (_obj_player.state == states.finishingblow && (floor(_obj_player.image_index) >= 4 or (floor(_obj_player.image_index) < 1 && _obj_player.sprite_index == _obj_player.spr_swingdingend)))
		{
			thrown = true
			var lag = 5
			hitLag = lag
			hitX = x
			hitY = y
			if (object_index != obj_noisey && object_index != obj_tank)
			{
			}
			_obj_player.movespeed = 0
			_obj_player.hitLag = lag
			_obj_player.hitX = _obj_player.x
			_obj_player.hitY = _obj_player.y
			instance_create(x, y, obj_parryeffect)
			alarm[3] = 1
			global.combotime = 60
			global.heattime = 60
			if (!important)
				global.style += (5 + global.combo)
			state = states.stun
			image_xscale = (-_obj_player.xscale)
			instance_create(x, y, obj_slapstar)
			instance_create(x, y, obj_slapstar)
			instance_create(x, y, obj_slapstar)
			instance_create(x, y, obj_baddiegibs)
			instance_create(x, y, obj_baddiegibs)
			instance_create(x, y, obj_baddiegibs)
			with (obj_camera)
			{
				shake_mag = 13
				shake_mag_acc = (3 / room_speed)
			}
			with (_obj_player)
			{
				if (sprite_index == spr_uppercutfinishingblow)
				{
					other.hithsp = 0
					other.hitvsp = -25
					other.linethrown = true
				}
				else
				{
					other.hithsp = ((-other.image_xscale) * 25)
					other.hitvsp = -8
					other.linethrown = true
				}
				vsp = -6
			}
			check_grabbed_solid(_obj_player)
			check_grabbed_solid(_obj_player)
			hsp = hithsp
			vsp = hitvsp
			linethrown = true
		}
		if (_obj_player.state == states.throwing)
		{
			global.hit += 1
			if (other.object_index == obj_pizzaball)
				global.golfhit += 1
			alarm[1] = 5
			thrown = true
			x = _obj_player.x
			y = _obj_player.y
			state = states.stun
			hsp = ((-image_xscale) * 8)
			vsp = -6
			check_grabbed_solid(_obj_player)
			check_grabbed_solid(_obj_player)
		}
		if (_obj_player.state == states.uppunch)
		{
			alarm[3] = 3
			global.hit += 1
			if (other.object_index == obj_pizzaball)
				global.golfhit += 1
			hp -= 1
			instance_create((x + ((-_obj_player.xscale) * 15)), (y - 50), obj_bumpeffect)
			alarm[1] = 5
			thrown = true
			x = _obj_player.x
			y = _obj_player.y
			hsp = ((-image_xscale) * 2)
			state = states.stun
			vsp = -20
			global.combotime = 60
			if (!important)
				global.style += (5 + global.combo)
			instance_create(x, y, obj_slapstar)
			instance_create(x, y, obj_baddiegibs)
			flash = 1
			with (obj_camera)
			{
				shake_mag = 13
				shake_mag_acc = (3 / room_speed)
			}
			check_grabbed_solid(_obj_player)
		}
		if (_obj_player.state == states.tacklecharge)
		{
			x = (_obj_player.x + (_obj_player.xscale * 15))
			y = _obj_player.y
		}
		if (_obj_player.state == states.superslam or (_obj_player.state == states.chainsaw && sprite_index == spr_player_piledriver))
		{
			if (_obj_player.character == "P" && _obj_player.ispeppino)
			{
				if (_obj_player.sprite_index != _obj_player.spr_piledriverland)
				{
					if (floor(_obj_player.image_index) == 0)
					{
						depth = 0
						x = (_obj_player.x + (_obj_player.xscale * 10))
						y = _obj_player.y
					}
					if (floor(_obj_player.image_index) == 1)
					{
						depth = 0
						x = (_obj_player.x + (_obj_player.xscale * 5))
						y = _obj_player.y
					}
					if (floor(_obj_player.image_index) == 2)
					{
						depth = 0
						x = _obj_player.x
						y = _obj_player.y
					}
					if (floor(_obj_player.image_index) == 3)
					{
						depth = 0
						x = (_obj_player.x + (_obj_player.xscale * -5))
						y = _obj_player.y
					}
					if (floor(_obj_player.image_index) == 4)
					{
						depth = 0
						x = (_obj_player.x + (_obj_player.xscale * -10))
						y = _obj_player.y
					}
					if (floor(_obj_player.image_index) == 5)
					{
						depth = -8
						x = (_obj_player.x + (_obj_player.xscale * -5))
						y = _obj_player.y
					}
					if (floor(_obj_player.image_index) == 6)
					{
						depth = -8
						x = _obj_player.x
						y = _obj_player.y
					}
					if (floor(_obj_player.image_index) == 7)
					{
						depth = -8
						x = (_obj_player.x + (_obj_player.xscale * 5))
						y = _obj_player.y
					}
					check_grabbed_solid(_obj_player)
				}
				else
				{
					x = (_obj_player.x + (_obj_player.xscale * 10))
					y = _obj_player.y
					check_grabbed_solid(_obj_player)
				}
			}
			else
			{
				depth = -7
				x = _obj_player.x
				y = (_obj_player.y - 40)
			}
		}
		if (_obj_player.sprite_index == _obj_player.spr_piledriverland && floor(_obj_player.image_index) == (_obj_player.image_number - 1))
		{
			lag = 5
			hitLag = lag
			hitX = x
			hitY = y
			_obj_player.hitLag = lag
			_obj_player.hitX = _obj_player.x
			_obj_player.hitY = _obj_player.y
			instance_create(_obj_player.x, _obj_player.y, obj_parryeffect)
			alarm[3] = 3
			if (elitehit > 0)
				elitehit--
			mach3destroy = 1
			state = states.hit
			image_xscale = (-_obj_player.xscale)
			instance_create(x, y, obj_slapstar)
			instance_create(x, y, obj_slapstar)
			instance_create(x, y, obj_slapstar)
			instance_create(x, y, obj_baddiegibs)
			instance_create(x, y, obj_baddiegibs)
			instance_create(x, y, obj_baddiegibs)
			with (obj_camera)
			{
				shake_mag = 13
				shake_mag_acc = (3 / room_speed)
			}
			with (_obj_player)
			{
				if (state != states.chainsaw)
				{
					tauntstoredmovespeed = movespeed
					tauntstoredsprite = sprite_index
					tauntstoredstate = state
					tauntstoredvsp = vsp
				}
				state = states.chainsaw
				other.hithsp = ((-other.image_xscale) * 8)
				other.hitvsp = -11
			}
		}
		if (_obj_player.state == states.grab && _obj_player.sprite_index == _obj_player.spr_swingding)
		{
			if (floor(_obj_player.image_index) == 0)
			{
				depth = -8
				x = (_obj_player.x + (_obj_player.xscale * 25))
				y = _obj_player.y
			}
			if (floor(_obj_player.image_index) == 1)
			{
				depth = -8
				x = _obj_player.x
				y = _obj_player.y
			}
			if (floor(_obj_player.image_index) == 2)
			{
				depth = -8
				x = (_obj_player.x + (_obj_player.xscale * -25))
				y = _obj_player.y
			}
			if (floor(_obj_player.image_index) == 3)
			{
				depth = 0
				x = (_obj_player.x + (_obj_player.xscale * -50))
				y = _obj_player.y
			}
			if (floor(_obj_player.image_index) == 4)
			{
				depth = 0
				x = (_obj_player.x + (_obj_player.xscale * -25))
				y = _obj_player.y
			}
			if (floor(_obj_player.image_index) == 5)
			{
				depth = 0
				x = _obj_player.x
				y = _obj_player.y
			}
			if (floor(_obj_player.image_index) == 6)
			{
				depth = 0
				x = (_obj_player.x + (_obj_player.xscale * 25))
				y = _obj_player.y
			}
			if (floor(_obj_player.image_index) == 7)
			{
				depth = 0
				x = (_obj_player.x + (_obj_player.xscale * 50))
				y = _obj_player.y
			}
		}
		if (state != states.grabbed or _obj_player.state != states.grab)
		{
			check_grabbed_solid(_obj_player)
			if (state == states.hit)
			{
				hitX = x
				hitY = y
			}
		}
	}
	if pepperman_grab
	{
		var _player = (grabbedby == 1 ? obj_player1.id : obj_player2.id)
		image_xscale = _player.xscale
		if (!thrown)
		{
			x = _player.x
			y = (_player.y - 60)
		}
		if (_player.key_attack && (!_player.key_up))
		{
			alarm[1] = 5
			thrown = true
			x = _player.x
			y = (_player.y - 10)
			state = states.stun
			hsp = (image_xscale * 30)
			vsp = -6
			_player.sprite_index = spr_pepperman_throw
			_player.image_index = 0
			_player.pepperman_grabID = -4
		}
		if (_player.key_attack && _player.key_up)
		{
			alarm[1] = 5
			thrown = true
			x = _player.x
			y = (_player.y - 10)
			check_grabbed_solid(_player)
			state = states.stun
			hsp = (image_xscale * 2)
			vsp = -20
			_player.sprite_index = spr_pepperman_throw
			_player.image_index = 0
			_player.pepperman_grabID = -4
		}
		if (_player.state != states.normal && _player.state != states.jump)
		{
			_player.pepperman_grabID = -4
			state = states.stun
			pepperman_grab = 0
		}
	}
	sprite_index = stunfallspr
	image_speed = 0.35
	exit;
}

function check_grabbed_solid(argument0)
{
	if instakilled
		exit;
	if ((!(place_meeting(x, y, obj_destructibles))) && (scr_solid(x, y) or collision_line(x, y, argument0.x, argument0.y, obj_solid, false, true) != -4))
	{
		var _dist = abs((x - obj_player.x))
		x = argument0.x
		y = argument0.y
		if (!(scr_solid((x + argument0.xscale), y)))
		{
			var i = 0
			while (!(scr_solid((x + argument0.xscale), y)))
			{
				x += argument0.xscale
				i++
				if (i > _dist)
					break
				else
					continue
			}
			if scr_solid(x, y)
			{
				i = 0
				while scr_solid(x, y)
				{
					x -= argument0.xscale
					i++
					if (i > _dist)
						break
					else
						continue
				}
			}
		}
	}
	exit;
}

