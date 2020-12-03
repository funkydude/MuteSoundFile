-- LICENSED UNDER 'ALL RIGHTS RESERVED'
-- DO NOT USE THIS "LIBRARY" ANYWHERE ELSE OTHER THAN THE 'MUTESOUNDFILE' WOW ADDON

local prototype = LibStub("AceGUI-3.0-DropDown-ItemBase"):GetItemBase()
local version = 1

local gui = LibStub("AceGUI-3.0")

-----------------------------------------------------------------------
-- Common
--

local function updateToggle(self)
	if self.value then
		self.check:Show()
	else
		self.check:Hide()
	end
end
local function onRelease(self)
	prototype.OnRelease(self)
	self:SetValue(nil)
end
local function onClick(frame)
	local self = frame.obj
	if self.disabled then return end
	self.value = not self.value
	if self.value then
		PlaySound(856) -- SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON
	else
		PlaySound(857) -- SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_OFF
	end
	updateToggle(self)
	self:Fire("OnValueChanged", self.value)
end
local function setValue(self, value)
	self.value = value
	updateToggle(self)
end
local function getValue(self)
	return self.value
end
local function commonConstructor(type)
	local self = prototype.Create(type)
	self.frame:SetScript("OnClick", onClick)
	self.SetValue = setValue
	self.GetValue = getValue
	self.OnRelease = onRelease
	return self
end

-----------------------------------------------------------------------
-- Sound
--

do
	local widgetType = "MuteSoundFileSound"
	local function onClick(self)
		local text = self.sound:GetText()
		local id = tonumber(text)
		local sound = MuteSoundFileFrame.db.profile.soundList[id or text]
		if sound then
			UnmuteSoundFile(sound)
			PlaySoundFile(sound, "Master")
			MuteSoundFile(sound)
		end
	end
	local function constructor()
		local self = commonConstructor(widgetType)
		local frame = self.frame

		local sndButton = CreateFrame("Button", nil, frame)
		sndButton:SetWidth(16)
		sndButton:SetHeight(16)
		sndButton:SetPoint("RIGHT", frame, "RIGHT", -3, -1)
		sndButton:SetScript("OnClick", onClick)
		sndButton.sound = frame.obj.text

		local icon = sndButton:CreateTexture(nil, "BACKGROUND")
		icon:SetTexture(130979) --"Interface\\Common\\VoiceChat-Speaker"
		icon:SetAllPoints(sndButton)

		local highlight = sndButton:CreateTexture(nil, "HIGHLIGHT")
		highlight:SetTexture(130977) --"Interface\\Common\\VoiceChat-On"
		highlight:SetAllPoints(sndButton)

		gui:RegisterAsWidget(self)
		return self
	end
	gui:RegisterWidgetType(widgetType, constructor, version)
end
