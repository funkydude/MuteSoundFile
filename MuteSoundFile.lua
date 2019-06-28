
local name, mod = ...
local L = mod.L

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
	frame:RegisterEvent("PLAYER_LOGIN")
end

frame:SetScript("OnEvent", function(f)
	f:UnregisterEvent("PLAYER_LOGIN")

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
