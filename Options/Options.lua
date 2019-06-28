
local acr = LibStub("AceConfigRegistry-3.0")
local acd = LibStub("AceConfigDialog-3.0")
local adbo = LibStub("AceDBOptions-3.0")

local msf = MuteSoundFileMod
local L
do
	local _, mod = ...
	L = mod.L
end

local soundId, removeSound, soundName

local options = function()
	local acOptions = {
		name = "MuteSoundFile",
		type = "group", childGroups = "tab",
		args = {
			bar = {
				name = "Sounds",
				order = 1, type = "group",
				args = {
					addSoundHeader = {
						type = "header",
						name = "Add Sounds",
						order = 1,
					},
					soundId = {
						type = "input",
						name = "Sound ID",
						order = 2,
						get = function()
							return soundId
						end,
						set = function(_, value)
							soundId = value
						end,
					},
					soundName = {
						type = "input",
						name = "Nickname (Optional)",
						order = 3,
						get = function()
							return soundName
						end,
						set = function(_, value)
							soundName = value
						end,
					},
					add = {
						type = "execute",
						name = "Add Sound",
						--desc = L.resetAllCustomSound,
						width = "full",
						func = function()
							local id = tonumber(soundId)
							if id and id > 0 then
								local name = tostring(soundName)
								if name and name ~= "" and not name:find("^ *$") then
									msf.db.profile.soundList[name] = id
									MuteSoundFile(id)
								else
									msf.db.profile.soundList[id] = id
									MuteSoundFile(id)
								end
							else
								--invalid id
							end
						end,
						order = 4,
					},
					removeSoundHeader = {
						type = "header",
						name = "Remove Sounds",
						order = 5,
					},
					removeSound = {
						type = "input",
						name = "Sound ID or Name",
						order = 6,
						get = function()
							return removeSound
						end,
						set = function(_, value)
							removeSound = value
						end,
					},
					remove = {
						type = "execute",
						name = "Remove",
						--desc = L.resetAllCustomSound,
						--width = "full",
						func = function()
							local id = tonumber(removeSound)
							if id then
								if id > 0 and msf.db.profile.soundList[id] then
									UnmuteSoundFile(id)
									msf.db.profile.soundList[id] = nil
								else
									print"invalid sound id"
								end
							else
								local name = tostring(removeSound)
								if name and name ~= "" and not name:find("^ *$") then
									if msf.db.profile.soundList[name] then
										UnmuteSoundFile(msf.db.profile.soundList[name])
										msf.db.profile.soundList[name] = nil
									else
										print"invalid sound name"
									end
								else
									print"invalid sound name"
								end
							end
						end,
						order = 7,
					},
					previewSoundHeader = {
						type = "header",
						name = "Muted Sounds List",
						order = 8,
					},
					sounds = {
						type = "select",
						name = "Muted Sounds",
						order = 9,
						values = function()
							local tbl = {}
							for k in next, msf.db.profile.soundList do
								tbl[#tbl+1] = k
							end
							return tbl
						end,
						--width = 6,
					},
				},
			},
			profiles = adbo:GetOptionsTable(msf.db),
		},
	}
	acOptions.args.profiles.order = 2
	return acOptions
end

acr:RegisterOptionsTable("MuteSoundFile", options, true)
acd:SetDefaultSize("MuteSoundFile", 420, 590)
