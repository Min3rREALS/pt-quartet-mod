pausedmusic = 0
fadeoff = 0
global.music = 0
roomname = obj_null
arena = 0
global.mu = -4
music = -4
secretmusic = -4
musicID = -4
secretmusicID = -4
pillarmusicID = -4
secret = 0
secretend = 0
pillar_on_camera = 0
prevpillar_on_camera = 0

room_arr = [
	[Realtitlescreen, mu_title, mu_medievalsecret, false], 
	[rm_levelselect, mu_title, mu_medievalsecret, false], 
	[tower_entrancehall, mu_hub, mu_medievalsecret, false], 
	[tower_3, mu_hub3, mu_medievalsecret, false], 
	[arcade_entrance, mu_arcade, mu_medievalsecret, false], 
	[entrance_1, mu_entrance, mu_medievalsecret, false], 
	[dungeon_1, mu_dungeon, mu_dungeonsecret, false], 
	[dungeon_8, mu_dungeon, mu_dungeonsecret, true], 
	[dungeon_9, mu_dungeondepth, mu_dungeonsecret, true],
	[strongcold_1, mu_chateau, mu_medievalsecret, false], 
	[strongcold_2, mu_strongcold, mu_medievalsecret, false], 
	[strongcold_9, mu_dungeondepth, mu_medievalsecret, false], 
	[medieval_1, mu_medievalentrance, mu_medievalsecret, false], 
	[medieval_2, mu_medievalentrance, mu_medievalsecret, true], 
	[medieval_3, mu_medievalremix, mu_medievalsecret, true], 
	[medieval_5, mu_medievalremix, mu_medievalsecret, true], 
	[medieval_6, mu_medieval, mu_medievalsecret, true],
	[ruin_1, mu_ruin, mu_ruinsecret, false], 
	[ruin_6, mu_ruin, mu_ruinsecret, true], 
	[ruin_7, mu_ruinremix, mu_ruinsecret, true],
	[badland_1, mu_desert, mu_desertsecret, false], 
	[badland_8, mu_desert, mu_desertsecret, true], 
	[badland_9, mu_ufo, mu_desertsecret, true], 
	[badland_mart4, mu_ufo, mu_desertsecret, true], 
	[badland_10, mu_desert, mu_desertsecret, true], 
	[forest_1, mu_forest, mu_forestsecret, false], 
	[forest_G1, mu_forest, mu_forestsecret, true], 
	[forest_G1b, mu_gustavo, mu_forestsecret, false], 
	[forest_5, mu_forest, mu_forestsecret, true], 
	[chateau_1, mu_chateau, mu_medievalsecret, false], 
	[sewer_1, mu_sewer, mu_medievalsecret, false], 
	[freezer_1, mu_freezer, mu_medievalsecret, false], 
	[freezer_15, mu_freezerstorage, mu_medievalsecret, true], 
	[kidsparty_1, mu_kidsparty, mu_medievalsecret, false], 
	[minigolf_1, mu_minigolf, mu_medievalsecret, false], 
	[industrial_1, mu_industrial, mu_medievalsecret, false], 
	[industrial_5, mu_industrialproduction, mu_medievalsecret, true], 
	[street_intro, mu_street, mu_medievalsecret, false], 
	[street_jail, mu_null, mu_medievalsecret, true], 
	[street_4, mu_streetchinatown, mu_medievalsecret, true], 
	[farm_1, mu_farm, mu_farmsecret, false], 
	[space_1, mu_pinball, mu_pinballsecret, false], 
	[space_5, mu_spaceplanet, mu_pinballsecret, true], 
	[graveyard_1, mu_graveyard, mu_medievalsecret, false], 
	[saloon_1, mu_saloon, mu_saloonsecret, false], 
	[ufo_1, mu_ufo, mu_pinballsecret, false], 
	[plage_entrance, mu_beach, mu_medievalsecret, false], 
	[war_1, mu_war, mu_medievalsecret, false], 
	[tower_finalhallway, mu_finalescape, mu_dungeonsecret, false],
	[mansion_3, mu_mansion, mu_medievalsecret, false],
	[fridge_1, mu_freezer, mu_medievalsecret, false],
	[floor2_room9, mu_forest, mu_medievalsecret, true],
    [factory_1_REMIX, mu_industrial, mu_medievalsecret, true], 
    [factory_11_REMIX, mu_factoryescape, mu_dungeonsecret, false], 
	[ancient_1, mu_ancient, mu_medievalsecret, false],
	[PP_room1, mu_tutorial, mu_medievalsecret, false],
	[top_1, mu_top, mu_medievalsecret, false],
	[bathroom_1, mu_bathroom, mu_bathroomsecret, false],
	[tutorial_1, mu_tutorialnew, mu_medievalsecret, false],
	[cold1, mu_dungeondepth, mu_dungeonsecret, false],
	[arctic_1, mu_arctic, mu_medieval, false],

]