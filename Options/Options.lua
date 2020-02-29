
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
					soundPreviewHeader = {
						type = "header",
						name = L.soundPreview,
						order = 1,
					},
					previewSoundById = {
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
					previewSoundButton = {
						type = "execute",
						name = L.previewSound,
						order = 3,
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

					},
					muteSoundHeader = {
						type = "header",
						name = L.muteSounds,
						order = 4,
					},
					collectionNameInput = {
						type = "input",
						name = L.collectionName,
						order = 5,
						dialogControl = "MuteSoundFileEditBox",
						get = function()
							return mod[L.collectionName]
						end,
						set = function(_, value)
							mod[L.collectionName] = value
						end,
					},
					collectionsDropdown = {
						type = "select",
						name = L.collectionList,
						order = 6,
						values = function()
							local tbl = {}
							for k,v in next, msf.db.profile.soundList do
								tbl[k] = k
							end
							table.sort(tbl, sortTbl)
							return tbl
						end,
						set = function(_, tableEntry)
							mod[L.collectionName] = tableEntry
							local text = ""
							local sounds = msf.db.profile.soundList[tableEntry]
							if type(sounds) == "table" then
								for k, v in next, msf.db.profile.soundList[tableEntry] do
									if text == "" then
										text = tostring(v)
									else
										text = text.."\n"..tostring(v)
									end
								end
							else
								text = tostring(sounds)
							end
							mod[L.soundIDs] = text
						end,
					},
					collectionCreateOrSaveButton = {
						type = "execute",
						name = L.collectionCreateOrSave,
						order = 7,
						func = function()
							if mod[L.collectionName] == nil then
								print(L.collectionNoName)
							else
								local failed = false
								local tbl = {}
								for s in mod[L.soundIDs]:gmatch("[^\r\n]+") do
									local OK, err = pcall(tonumber, s)
									if not OK then
										failed = true
										print(L.collectionIdNotANumber:format(s))
									else
										table.insert(tbl, tonumber(s))
									end	
								end
								local sounds = msf.db.profile.soundList[mod[L.collectionName]] 
								if sounds then
									if type(sounds) == "table"  then 
										for _, id in next, sounds do
											UnmuteSoundFile(id)
										end
									else
										UnmuteSoundFile(sounds)
									end
								end
								for _, id in next, tbl do
									local _, playId = PlaySoundFile(id, "Master")
									if playId and playId < 100000000 then -- Seems to return a random high id when you try to play non-sound files
										StopSound(playId)
									else
										failed = true
										print(L.failedToAdd:format(id))
									end
								end
				
								if not failed then
									local count = 0
									for _ in next, tbl do
										count = count + 1
										if count > 1 then break end
									end
									if count == 1 then
										msf.db.profile.soundList[mod[L.collectionName]] = tbl[1]
									else
										msf.db.profile.soundList[mod[L.collectionName]] = tbl
									end
									print(L.collectionCreatedOrSaved:format(mod[L.collectionName]))
									for k, v in next, tbl do
										MuteSoundFile(v)
									end
									mod[L.collectionName] = nil
									mod[L.soundIDs] = nil
								end
							end
						end
					},
					collectionRemoveButton = {
						type = "execute",
						name = L.collectionRemove,
						order = 8,
						func = function()
							if msf.db.profile.soundList[mod[L.collectionName]] == nil then
								print(L.noSuchCollectionName:format(mod[L.collectionName] or ""))
							else
								for k, v in next, msf.db.profile.soundList[mod[L.collectionName]] do
									UnmuteSoundFile(v);
								end
								msf.db.profile.soundList[mod[L.collectionName]] = nil
								mod[L.collectionName] = nil
								mod[L.soundIDs] = nil
							end
						
						end
					},
					soundIdsInput = {
						type = "input",
						name = L.soundIDs,
						order = 9,
						width = "full",
						multiline = 7,
						desc = L.soundIDsDesc,
						get = function()
							return mod[L.soundIDs];
						end,
						set = function(_, value)
							mod[L.soundIDs] = value
						end
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
