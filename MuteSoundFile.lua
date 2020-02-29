
local name, mod = ...
local L = mod.L
local MuteSoundFile, UnmuteSoundFile = MuteSoundFile, UnmuteSoundFile

local frame = CreateFrame("Frame", "MuteSoundFileFrame")
frame.MuteSoundFile, frame.UnmuteSoundFile = MuteSoundFile, UnmuteSoundFile
do
	local function openOpts()
		EnableAddOn("MuteSoundFile_Options") -- Make sure it wasn't left disabled for whatever reason
		LoadAddOn("MuteSoundFile_Options")
		LibStub("AceConfigDialog-3.0"):Open(name)
	end
	SlashCmdList[name] = openOpts
	SLASH_MuteSoundFile1 = "/msf"
	SLASH_MuteSoundFile2 = "/mutesoundfile"
	frame:RegisterEvent("ADDON_LOADED")
end

frame:SetScript("OnEvent", function(f, event, addon)
	if addon ~= name then return end
	f:UnregisterEvent(event)

	if type(MuteSoundFileDB) ~= "table" then
		MuteSoundFileDB = {}
	end

	-- saved variables database setup
	local defaults = {
		profile = {
			soundList = {},
			mutedPresets = {},
			collections = {}
		},
	}
	f.db = LibStub("AceDB-3.0"):New("MuteSoundFileDB", defaults, true)

	for _, sounds in next, f.db.profile.soundList do
		if type(sounds) == "table" then
			for _, soundID in  next, sounds do
				MuteSoundFile(soundID)
			end
		else
			MuteSoundFile(sounds)
		end
	end
	for _, presetTable in next, f.db.profile.mutedPresets do
		for i = 1, #presetTable do
			local id = presetTable[i]
			MuteSoundFile(id)
		end
	end
end)
