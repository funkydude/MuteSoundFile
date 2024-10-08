
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
	}
}
