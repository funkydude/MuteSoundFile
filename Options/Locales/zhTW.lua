
if GetLocale() ~= "zhTW" then return end
local _, mod = ...
local L = mod.L

L.addSounds = "添加音效"
L.soundId = "音效ID （數字）"
L.nickname = "別名（非必要）"
L.muteSound = "|T514607:0|t 靜音"
L.previewSound = "|T136507:0|t 試聽"
L.removeSounds = "移除音效"
L.soundIdOrName = "音效ID或別名"
L.removeSound = "|T851905:0|t 取消靜音"
L.soundsList = "靜音列表"
L.mutedSounds = "已靜音的音效"
L.nicknameExists = "|cFF33FF99MuteSoundFile:|r 「%q」這個別名已被使用，請換一個。"
L.soundIdExists = "|cFF33FF99MuteSoundFile:|r 「%d」這個音效ID 已被靜音。"
L.invalidSound = "|cFF33FF99MuteSoundFile:|r 無法靜音「%q」，因為它不是數字編號。"
L.noSuchNickname = "|cFF33FF99MuteSoundFile:|r 無法在靜音列表中找到別名為「%q」的條目。"
L.noSuchID = "|cFF33FF99MuteSoundFile:|r 無法在靜音列表中找到音效ID 為「%d」的條目。"
L.failedToAdd = "|cFF33FF99MuteSoundFile:|r 找不到編號為「%d」的音效ID，或你已將音效關閉。"
L.soundDesc = "\n\n\n\n你可以在這個網站查詢音效ID："
L.presetDesc = "你可以快速地從預設列表選擇要靜音的音效，預設列表的每一個條目都可以是單獨一個音效，或多個同類音效。列表中，|T136814:0|t 表示已靜音，|T136813:0|t 表示未靜音。\n\n"
L.presets = "預設"
L.presetList = "預設列表"
L.presetSubmitYourOwn = "\n\n到我們的 GitHub 項目頁面推送你想添加至預設靜音列表的音效！"

L.lfgping = "介面：隨機團隊等待進入"
L.yakVendors = "座騎：大型遠征犛牛"
L.sunwarmedFurline = "座騎：暖陽陽毛毛貓"
L.choochooEmotes = "表情：小火車"
L.mooEmotes = "表情：哞哞叫"
--L.peaFowl = "Mount: Majestic Azure Peafowl"
--L.brutoUnta = "Mount: Mighty Caravan Brutosaur (Auctioneer Unta)"
