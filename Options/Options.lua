
local acr = LibStub("AceConfigRegistry-3.0")
local acd = LibStub("AceConfigDialog-3.0")
local adbo = LibStub("AceDBOptions-3.0")

local msf = MuteSoundFileFrame
local MuteSoundFile, UnmuteSoundFile = msf.MuteSoundFile, msf.UnmuteSoundFile
local mod, L
do
	local _
	_, mod = ...
	L = mod.L
end

local lastPlayedSound = 0
local function sortTbl(x,y)
	local num1, num2 = tonumber(x), tonumber(y)
	if num1 and num2 then -- numeric comparison, either two numbers or numeric strings
		return num1 < num2
	else -- compare everything else tostring'ed
		return tostring(x) < tostring(y)
	end
end

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
							return mod[L.soundId]
						end,
						set = function(_, value)
							mod[L.soundId] = value
						end,
					},
					inputSoundNickname = {
						type = "input",
						name = L.nickname,
						dialogControl = "MuteSoundFileEditBox",
						order = 3,
						get = function()
							return mod[L.nickname]
						end,
						set = function(_, value)
							mod[L.nickname] = value
						end,
					},
					previewSoundButton = {
						type = "execute",
						name = L.previewSound,
						func = function()
							local id = tonumber(mod[L.soundId])
							if id and id > 0 and id < 1000000000 then
								local name = tostring(mod[L.nickname])
								if mod[L.nickname] and name and name ~= "" and not name:find("^ *$") then
									if msf.db.profile.soundList[name] then
										print(L.nicknameExists:format(name))
									else
										local _, playId = PlaySoundFile(id, "Master")
										if playId and playId < 100000000 then -- Seems to return a random high id when you try to play non-sound files
											lastPlayedSound = playId
										else
											print(L.failedToAdd:format(id))
										end
									end
								else
									if msf.db.profile.soundList[id] then
										print(L.soundIdExists:format(id))
									else
										local _, playId = PlaySoundFile(id, "Master")
										if playId and playId < 100000000 then -- Seems to return a random high id when you try to play non-sound files
											lastPlayedSound = playId
										else
											print(L.failedToAdd:format(id))
										end
									end
								end
							else
								print(L.invalidSound:format(mod[L.soundId] or ""))
							end
						end,
						order = 4,
					},
					addButton = {
						type = "execute",
						name = L.muteSound,
						func = function()
							local id = tonumber(mod[L.soundId])
							if id and id > 0 and id < 1000000000 then
								local name = tostring(mod[L.nickname])
								if mod[L.nickname] and name and name ~= "" and not name:find("^ *$") then
									if msf.db.profile.soundList[name] then
										print(L.nicknameExists:format(name))
									else
										if lastPlayedSound > 0 then
											StopSound(lastPlayedSound)
											lastPlayedSound = 0
										end
										local _, playId = PlaySoundFile(id, "Master")
										if playId and playId < 100000000 then -- Seems to return a random high id when you try to play non-sound files
											msf.db.profile.soundList[name] = id
											StopSound(playId)
											MuteSoundFile(id)
											mod[L.soundId] = nil
											mod[L.nickname] = nil
										else
											print(L.failedToAdd:format(id))
										end
									end
								else
									if msf.db.profile.soundList[id] then
										print(L.soundIdExists:format(id))
									else
										if lastPlayedSound > 0 then
											StopSound(lastPlayedSound)
											lastPlayedSound = 0
										end
										local _, playId = PlaySoundFile(id, "Master")
										if playId and playId < 100000000 then -- Seems to return a random high id when you try to play non-sound files
											msf.db.profile.soundList[id] = id
											StopSound(playId)
											MuteSoundFile(id)
											mod[L.soundId] = nil
											mod[L.nickname] = nil
										else
											print(L.failedToAdd:format(id))
										end
									end
								end
							else
								print(L.invalidSound:format(mod[L.soundId] or ""))
							end
						end,
						order = 5,
					},
					removeSoundByIdOrNameHeader = {
						type = "header",
						name = L.removeSounds,
						order = 6,
					},
					removeSoundByIdOrNameInput = {
						type = "input",
						name = L.soundIdOrName,
						dialogControl = "MuteSoundFileEditBox",
						order = 7,
						get = function()
							return mod[L.soundIdOrName]
						end,
						set = function(_, value)
							mod[L.soundIdOrName] = value
						end,
					},
					removeButton = {
						type = "execute",
						name = L.removeSound,
						func = function()
							local id = tonumber(mod[L.soundIdOrName])
							if id then
								if id > 0 and msf.db.profile.soundList[id] then
									UnmuteSoundFile(id)
									msf.db.profile.soundList[id] = nil
									mod[L.soundIdOrName] = nil
								else
									local numAsNick = tostring(id) -- We store nicknames as strings but the user may be using a number as a nickname e.g. -2
									if msf.db.profile.soundList[numAsNick] then
										UnmuteSoundFile(msf.db.profile.soundList[numAsNick])
										msf.db.profile.soundList[numAsNick] = nil
										mod[L.soundIdOrName] = nil
									else
										print(L.noSuchID:format(id))
									end
								end
							else
								local name = tostring(mod[L.soundIdOrName])
								if mod[L.soundIdOrName] and name and name ~= "" and not name:find("^ *$") then
									if msf.db.profile.soundList[name] then
										UnmuteSoundFile(msf.db.profile.soundList[name])
										msf.db.profile.soundList[name] = nil
										mod[L.soundIdOrName] = nil
									else
										print(L.noSuchNickname:format(name))
									end
								else
									print(L.noSuchNickname:format(mod[L.soundIdOrName] or ""))
								end
							end
						end,
						order = 8,
					},
					previewSoundHeader = {
						type = "header",
						name = L.soundsList,
						order = 9,
					},
					soundsDropdown = {
						type = "select",
						name = L.mutedSounds,
						order = 10,
						itemControl = "MuteSoundFileSound",
						values = function()
							local tbl = {}
							for k in next, msf.db.profile.soundList do
								tbl[#tbl+1] = k
							end
							table.sort(tbl, sortTbl)
							return tbl
						end,
						width = "full",
						set = function(_, tableEntry)
							local tbl = {}
							for k in next, msf.db.profile.soundList do
								tbl[#tbl+1] = k
							end
							table.sort(tbl, sortTbl)
							mod[L.soundIdOrName] = tostring(tbl[tableEntry]) -- Need to tostring numbers to get the editbox to update
						end,
					},
					findSoundFileDesc = {
						type = "description",
						name = L.soundDesc,
						order = 11,
						width = "full",
					},
					wago = {
						type = "input",
						get = function() return "wago.tools/sounds" end,
						set = function() end,
						name = "wago.tools/sounds",
						order = 12,
						width = 1,
					},
				},
			},
			presets = {
				name = L.presets,
				order = 2, type = "group",
				args = {
					description = {
						type = "description",
						name = L.presetDesc,
						order = 1,
						width = "full",
						fontSize = "medium",
					},
					presetsDropdown = {
						type = "select",
						name = L.presetList,
						order = 2,
						values = function()
							local presets = mod.presets
							local tbl = {}
							for k in next, presets do
								local text = L[k] or "MISSING LOCALE FOR "..k
								if msf.db.profile.mutedPresets[k] then
									text = "|T136814:0|t ".. text
								else
									text = "|T136813:0|t ".. text
								end
								tbl[#tbl+1] = text
							end
							table.sort(tbl, sortTbl)
							return tbl
						end,
						width = "full",
						set = function(_, tableEntry)
							local presets = mod.presets
							local tbl, sortedTbl = {}, {}
							for k in next, presets do
								local text = L[k] or "MISSING LOCALE FOR "..k
								if msf.db.profile.mutedPresets[k] then
									text = "|T136814:0|t ".. text
								else
									text = "|T136813:0|t ".. text
								end
								tbl[text] = k
								sortedTbl[#sortedTbl+1] = text
							end
							table.sort(sortedTbl, sortTbl)

							local localizedName = sortedTbl[tableEntry]
							local selectedPreset = tbl[localizedName]
							if selectedPreset and presets[selectedPreset] then
								if msf.db.profile.mutedPresets[selectedPreset] then
									msf.db.profile.mutedPresets[selectedPreset] = nil
									for i = 1, #presets[selectedPreset] do
										local id = presets[selectedPreset][i]
										UnmuteSoundFile(id)
									end
								else
									msf.db.profile.mutedPresets[selectedPreset] = presets[selectedPreset]
									for i = 1, #presets[selectedPreset] do
										local id = presets[selectedPreset][i]
										MuteSoundFile(id)
									end
								end
							end
						end,
					},
					noteSubmitYourOwn = {
						type = "description",
						name = L.presetSubmitYourOwn,
						order = 3,
						width = "full",
						fontSize = "medium",
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
