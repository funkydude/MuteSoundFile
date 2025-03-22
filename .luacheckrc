std = "lua51"
max_line_length = false
codes = true
exclude_files = {
	"**/Libs",
}
ignore = {
	"111/SLASH_MuteSoundFile[12]", -- slash handlers
}
globals = {
	-- Addon
	"MuteSoundFileFrame",
	"LibStub",

	-- WoW
	"C_AddOns",
	"CreateFrame",
	"GetLocale",
	"MuteSoundFile",
	"PlaySoundFile",
	"ReloadUI",
	"SlashCmdList",
	"StopSound",
	"UnmuteSoundFile",
}
