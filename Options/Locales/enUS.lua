
local _, mod = ...
if not mod.L then -- Support repo users by checking if it already exists
	mod.L = {}
end
local L = mod.L

L.addSounds = "Add Sounds"
L.soundId = "Sound ID (number)"
L.nickname = "Nickname (optional)"
L.muteSound = "Mute this sound"
L.removeSounds = "Remove Sounds"
L.soundIdOrName = "Sound ID or Nickname"
L.removeSound = "Unmute this sound"
L.soundsList = "Muted Sounds List"
L.mutedSounds = "Muted Sounds"