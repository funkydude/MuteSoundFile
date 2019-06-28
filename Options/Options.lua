
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
					addSoundById = {
						type = "input",
						name = L.soundId,
						order = 2,
						get = function()
							return addSoundById
						end,
						set = function(_, value)
							addSoundById = value
						end,
					},
					addSoundNickname = {
						type = "input",
						name = L.nickname,
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
								if name and name ~= "" and not name:find("^ *$") then
									if msf.db.profile.soundList[name] then
										print"that name already exists"
									else
										msf.db.profile.soundList[name] = id
										MuteSoundFile(id)
										addSoundById = nil
										addSoundNickname = nil
									end
								else
									if msf.db.profile.soundList[id] then
										print"that sound is already muted"
									else
										msf.db.profile.soundList[id] = id
										MuteSoundFile(id)
										addSoundById = nil
										addSoundNickname = nil
									end
								end
							else
								print("invalid id")
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
									print"invalid sound id"
								end
							else
								local name = tostring(removeSoundByIdOrName)
								if name and name ~= "" and not name:find("^ *$") then
									if msf.db.profile.soundList[name] then
										UnmuteSoundFile(msf.db.profile.soundList[name])
										msf.db.profile.soundList[name] = nil
										removeSoundByIdOrName = nil
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
							return tbl
						end,
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
acd:SetDefaultSize("MuteSoundFile", 420, 470)
