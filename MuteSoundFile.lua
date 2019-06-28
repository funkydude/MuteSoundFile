
local name, mod = ...
local L = mod.L
local MuteSoundFile = MuteSoundFile

local frame = CreateFrame("Frame", "MuteSoundFileMod")
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
		},
	}
	f.db = LibStub("AceDB-3.0"):New("MuteSoundFileDB", defaults, true)

	for k,v in next, f.db.profile.soundList do
		MuteSoundFile(v)
	end
end)
