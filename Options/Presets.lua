
local _, scope = ...
scope.presets = {
	lfgping = { -- LFG people requesting to join your group ping
		1067667, -- sound/interface/ui_groupfinderreceiveapplication_01.ogg
	},
	yakVendors = {
		640336, 640338, 640340, -- vo_grummle_standard_vendor_01 / 2 / 3
		640314, 640316, 640318, 640320, -- vo_grummle_standard_farewell_01 / 2 / 3 / 4
		640180, 640182, 640184, -- vo_grummle_kooky_vendor_01 / 2 / 3
		640158, 640160, 640162, 640164, -- vo_grummle_kooky_farewell_01 / 2 / 3 / 4
	},
	sunwarmedFurline = {
		3598605, -- catmount_aggro_3598605
		3598607, -- catmount_oneshot_3598607
		3598611, -- catmount_oneshot_3598611
		3598613, -- catmount_oneshot_3598613
		3598617, -- catmount_oneshot_3598617
		3598619, -- catmount_oneshot_3598619
		3598621, -- catmount_oneshot_3598621
		3598623, -- catmount_oneshot_3598623
		3598625, -- catmount_oneshot_3598625
		3598635, -- catmount_cast_oneshot_3598635
		3598637, -- catmount_cast_oneshot_3598637
	},
	choochooEmotes = {
		540734, -- humanmalechoochoo01
		540535, -- humanfemalechoochoo01
		539881, -- dwarfmalechoochoo01
		539802, -- dwarffemalechoochoo01
		540271, -- gnomefemalechoochoo01
		540275, -- gnomemalechoochoo01
		540870, -- nightelffemalechoochoo01
		540947, -- nightelfmalechoochoo01
		541239, -- orcmalechoochoo01
		541157, -- orcfemalechoochoo01
		542600, -- undeadmalechoochoo01
		542526, -- undeadfemalechoochoo01
		542896, -- taurenmalechoochoo01
		542818, -- taurenfemalechoochoo01
		543093, -- trollmalechoochoo01
		543085, -- trollfemalechoochoo01
		539219, -- bloodelffemaletrain01
		539203, -- bloodelfmaletrain01
		539516, -- draeneifemaletrain01
		539730, -- draeneimaletrain01
		541463, -- vo_pcgilneanfemale_train01
		541601, -- vo_pcgilneanmale_train01
		542017, -- vo_pcgoblinmale_train01
		541769, -- vo_pcgoblinfemale_train01
		542206, -- vo_pcworgenmale_train01
		542035, -- vo_pcworgenfemale_train01
		630296, -- vo_pcpandarenmale_train01
		630298, -- vo_pcpandarenmale_train02
		636621, -- vo_pcpandarenfemale_train01
		1306531, -- vo_dhbloodelfmaletrain01
		1313588, -- vo_dhbloodelffemale_train01
		1304872, -- vo_dhnightelfmalechoochoo01
		1316209, -- vo_dhnightelffemale_choochoo01
		1733163, -- vo_735_pc_-_void_elf_male_194_m
		1732785, -- vo_735_pc_-_void_elf_female_194_f
		1730908, -- vo_735_pc_-_highmountain_tauren_male_193_m
		1730534, -- vo_735_pc_-_highmountain_tauren_female_193_f
		1731282, -- vo_735_pc_-_lightforged_draenei_female_193_f
		1731656, -- vo_735_pc_-_lightforged_draenei_male_193_m
		1732030, -- vo_735_pc_-_nightborne_elf_female_193_f
		1732405, -- vo_735_pc_-_nightborne_elf_male_193_m
		1902030, -- vo_801_pc_dark_iron_dwarf_female_342_f
		1902543, -- vo_801_pc_dark_iron_dwarf_male_342_m
		1951457, -- vo_801_pc_maghar_orc_female_157_f
		1951458, -- vo_801_pc_maghar_orc_male_157_m
		1903049, -- vo_801_pc_zandalari_troll_female_335_f
		1903522, -- vo_801_pc_zandalari_troll_male_295_m
		2531204, -- vo_815_pc_kul_tiran_human_female_196_f
		2491898, -- vo_815_pc_kul_tiran_human_male_16_m
		3107182, -- vo_83_pc_mechagnome_male_155_m
		3107651, -- vo_83_pc_mechagnome_female_155_f
		3106252, -- vo_83_pc_vulpera_female_155_f
		3106717, -- vo_83_pc_vulpera_male_155_m
	},
	mooEmotes = {
		542820, -- taurenfemalemoo01
		542894, -- taurenmalemoo01
	},
	peaFowl = {
		5546937, -- peacockmount_cast_oneshot_5546937
		5546939, -- peacockmount_cast_oneshot_5546939
		5546941, -- peacockmount_cast_oneshot_5546941
		5546943, -- peacockmount_cast_oneshot_5546943
		5546596, -- peacockmount_moving_5546596
		5546598, -- peacockmount_moving_5546598
		5546600, -- peacockmount_moving_5546600
		5546602, -- peacockmount_moving_5546602
		5546604, -- peacockmount_moving_5546604
		5546606, -- peacockmount_moving_5546606
		5546608, -- peacockmount_moving_5546608
		5546610, -- peacockmount_moving_5546610
		5546612, -- peacockmount_moving_5546612
		5546614, -- peacockmount_moving_5546614
		5546616, -- peacockmount_moving_5546616
	},
	brutoUnta = {
		1998112, -- vo_801_tortollan_male_04_m
		1998113, -- vo_801_tortollan_male_05_m
		1998114, -- vo_801_tortollan_male_06_m
		1998115, -- vo_801_tortollan_male_07_m
		1998116, -- vo_801_tortollan_male_08_m
		1998117, -- vo_801_tortollan_male_09_m
	},
	dornogalInn = {
		-- IDs taken from https://www.wowhead.com/sound=266531/filedata-5919534
		5919534, -- earthendwarfmale_fidget_5919534.ogg
		5919536, -- earthendwarfmale_fidget_5919536.ogg
		5919568, -- earthendwarfmale_fidget13_5919568.ogg
		5919570, -- earthendwarfmale_fidget13_5919570.ogg
		5919572, -- earthendwarfmale_fidget13_5919572.ogg
		5919582, -- holdingmeadmug_aurastart_loop_5919582.ogg
		5919588, -- holdingmeadmug_aurastart_loop_5919588.ogg
	},
	chestMail = {
		-- https://www.wowhead.com/sound=1005/foleysoundchain
		567585, -- ChainFoley01
		567600, -- ChainFoley02
		567597, -- ChainFoley03
		567605, -- ChainFoley04
		567587,	-- ChainFoley05
		567590, -- ChainFoley06
		567603, -- ChainFoley07
		567594, -- ChainFoley08
		567592, -- ChainFoley09
		567593, -- ChainFoley10
	},
	dundun = {
		-- https://www.wowhead.com/sound=301585/vo-120-dundun-rat-20-m
		-- https://www.wowhead.com/sound=301586/vo-120-dundun-rat-21-m
		-- https://www.wowhead.com/sound=301587/vo-120-dundun-rat-22-m
		7251817, -- vo_120_dundun_rat_20_m.ogg
		7251820, -- vo_120_dundun_rat_21_m.ogg
		7251823, -- vo_120_dundun_rat_22_m.ogg
	},
	valeera = {
		-- Delve companion https://www.wowhead.com/npc=248567/valeera-sanguinar
		-- Combat sound IDs #04 - #42 https://wago.tools/sounds?page=8&search=valeera
		7430043, -- vo_120_valeera_sanguinar_04_f.ogg
		7430047, -- vo_120_valeera_sanguinar_05_f.ogg
		7430050, -- vo_120_valeera_sanguinar_06_f.ogg
		7430053, -- vo_120_valeera_sanguinar_07_f.ogg
		7430056, -- vo_120_valeera_sanguinar_08_f.ogg
		7430059, -- vo_120_valeera_sanguinar_09_f.ogg
		7430063, -- vo_120_valeera_sanguinar_10_f.ogg
		7430066, -- vo_120_valeera_sanguinar_11_f.ogg
		7430069, -- vo_120_valeera_sanguinar_12_f.ogg
		7430072, -- vo_120_valeera_sanguinar_13_f.ogg
		7430075, -- vo_120_valeera_sanguinar_14_f.ogg
		7430078, -- vo_120_valeera_sanguinar_15_f.ogg
		7430082, -- vo_120_valeera_sanguinar_16_f.ogg
		7430086, -- vo_120_valeera_sanguinar_17_f.ogg
		7430089, -- vo_120_valeera_sanguinar_18_f.ogg
		7430092, -- vo_120_valeera_sanguinar_19_f.ogg
		7430095, -- vo_120_valeera_sanguinar_20_f.ogg
		7430098, -- vo_120_valeera_sanguinar_21_f.ogg
		7430101, -- vo_120_valeera_sanguinar_22_f.ogg
		7430104, -- vo_120_valeera_sanguinar_23_f.ogg
		7430107, -- vo_120_valeera_sanguinar_24_f.ogg
		7430110, -- vo_120_valeera_sanguinar_25_f.ogg
		7430113, -- vo_120_valeera_sanguinar_26_f.ogg
		7430116, -- vo_120_valeera_sanguinar_27_f.ogg
		7430119, -- vo_120_valeera_sanguinar_28_f.ogg
		7430122, -- vo_120_valeera_sanguinar_29_f.ogg
		7430125, -- vo_120_valeera_sanguinar_30_f.ogg
		7430156, -- vo_120_valeera_sanguinar_31_f.ogg
		7430159, -- vo_120_valeera_sanguinar_32_f.ogg
		7430162, -- vo_120_valeera_sanguinar_33_f.ogg
		7430165, -- vo_120_valeera_sanguinar_34_f.ogg
		7430168, -- vo_120_valeera_sanguinar_35_f.ogg
		7430171, -- vo_120_valeera_sanguinar_36_f.ogg
		7430174, -- vo_120_valeera_sanguinar_37_f.ogg
		7430177, -- vo_120_valeera_sanguinar_38_f.ogg
		7430180, -- vo_120_valeera_sanguinar_39_f.ogg
		7430183, -- vo_120_valeera_sanguinar_40_f.ogg
		7430186, -- vo_120_valeera_sanguinar_41_f.ogg
		7430189, -- vo_120_valeera_sanguinar_42_f.ogg
	},
}
