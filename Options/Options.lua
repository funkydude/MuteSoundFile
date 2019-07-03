
local acr = LibStub("AceConfigRegistry-3.0")
local acd = LibStub("AceConfigDialog-3.0")
local adbo = LibStub("AceDBOptions-3.0")

local msf = MuteSoundFileFrame
local MuteSoundFile, UnmuteSoundFile = msf.MuteSoundFile, msf.UnmuteSoundFile
local L
do
	local _, mod = ...
	L = mod.L
end

local addSoundById, removeSoundByIdOrName, addSoundNickname = nil, nil, nil

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
						name = L.addSounds,
						order = 1,
					},
					inputSoundById = {
						type = "input",
						name = L.soundId,
						dialogControl = "MuteSoundFileEditBox",
						order = 2,
						get = function()
							return addSoundById
						end,
						set = function(_, value)
							addSoundById = value
						end,
					},
					inputSoundNickname = {
						type = "input",
						name = L.nickname,
						dialogControl = "MuteSoundFileEditBox",
						order = 3,
						get = function()
							return addSoundNickname
						end,
						set = function(_, value)
							addSoundNickname = value
						end,
					},
					addButton = {
						type = "execute",
						name = L.muteSound,
						width = "full",
						func = function()
							local id = tonumber(addSoundById)
							if id and id > 0 then
								local name = tostring(addSoundNickname)
								if addSoundNickname and name and name ~= "" and not name:find("^ *$") then
									if msf.db.profile.soundList[name] then
										print(L.nicknameExists:format(name))
									else
										msf.db.profile.soundList[name] = id
										MuteSoundFile(id)
										addSoundById = nil
										addSoundNickname = nil
									end
								else
									if msf.db.profile.soundList[id] then
										print(L.soundIdExists:format(id))
									else
										msf.db.profile.soundList[id] = id
										MuteSoundFile(id)
										addSoundById = nil
										addSoundNickname = nil
									end
								end
							else
								print(L.invalidSound:format(addSoundById or ""))
							end
						end,
						order = 4,
					},
					removeSoundByIdOrNameHeader = {
						type = "header",
						name = L.removeSounds,
						order = 5,
					},
					removeSoundByIdOrName = {
						type = "input",
						name = L.soundIdOrName,
						dialogControl = "MuteSoundFileEditBox",
						order = 6,
						get = function()
							return removeSoundByIdOrName
						end,
						set = function(_, value)
							removeSoundByIdOrName = value
						end,
					},
					removeButton = {
						type = "execute",
						name = L.removeSound,
						func = function()
							local id = tonumber(removeSoundByIdOrName)
							if id then
								if id > 0 and msf.db.profile.soundList[id] then
									UnmuteSoundFile(id)
									msf.db.profile.soundList[id] = nil
									removeSoundByIdOrName = nil
								else
									local numAsNick = tostring(id) -- We store nicknames as strings but the user may be using a number as a nickname e.g. -2
									if msf.db.profile.soundList[numAsNick] then
										UnmuteSoundFile(msf.db.profile.soundList[numAsNick])
										msf.db.profile.soundList[numAsNick] = nil
										removeSoundByIdOrName = nil
									else
										print(L.noSuchID:format(id))
									end
								end
							else
								local name = tostring(removeSoundByIdOrName)
								if removeSoundByIdOrName and name and name ~= "" and not name:find("^ *$") then
									if msf.db.profile.soundList[name] then
										UnmuteSoundFile(msf.db.profile.soundList[name])
										msf.db.profile.soundList[name] = nil
										removeSoundByIdOrName = nil
									else
										print(L.noSuchNickname:format(name))
									end
								else
									print(L.noSuchNickname:format(removeSoundByIdOrName or ""))
								end
							end
						end,
						order = 7,
					},
					previewSoundHeader = {
						type = "header",
						name = L.soundsList,
						order = 8,
					},
					soundsDropdown = {
						type = "select",
						name = L.mutedSounds,
						order = 9,
						values = function()
							local tbl = {}
							for k in next, msf.db.profile.soundList do
								tbl[#tbl+1] = k
							end
							table.sort(tbl)
							return tbl
						end,
						width = "full",
					},
					findSoundFileDesc = {
						type = "description",
						name = L.soundDesc,
						order = 10,
						width = "full",
					},
				},
			},
			presets = {
				name = "Presets",
				order = 2, type = "group",
				args = {
					presetHeader = {
						type = "header",
						name = "Coming soon",
						order = 1,
					},
				},
			},
			profiles = adbo:GetOptionsTable(msf.db),
		},
	}
	acOptions.args.profiles.order = 3
	return acOptions
end

acr:RegisterOptionsTable("MuteSoundFile", options, true)
acd:SetDefaultSize("MuteSoundFile", 420, 470)
