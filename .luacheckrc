std = "lua51"
max_line_length = false
codes = true
exclude_files = {
	"**/Libs",
}
ignore = {
	"11/SLASH_MuteSoundFile[12]", -- slash handlers
}
globals = {
	-- Lua

	-- Addon
	"MuteSoundFileFrame",
	"LibStub",

	-- WoW
	"CreateFrame",
	"EnableAddOn",
	"GetLocale",
	"LoadAddOn",
	"SlashCmdList",
}
