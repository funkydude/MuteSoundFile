
if GetLocale() ~= "zhCN" then return end
local _, mod = ...
local L = mod.L

L.addSounds = "添加音效"
L.soundId = "音效ID （数字）"
L.nickname = "别名（非必要）"
L.muteSound = "|T514607:0|t 静音"
L.previewSound = "|T136507:0|t 试听"
L.removeSounds = "移除音效"
L.soundIdOrName = "音效ID或别名"
L.removeSound = "|T851905:0|t 取消静音"
L.soundsList = "静音清单"
L.mutedSounds = "已静音的音效"
L.nicknameExists = "|cFF33FF99MuteSoundFile:|r “%q” 这个别名已被使用，请换一个。"
L.soundIdExists = "|cFF33FF99MuteSoundFile:|r “%d” 这个音效ID 已被静音。"
L.invalidSound = "|cFF33FF99MuteSoundFile:|r 无法静音“%q” ，因为它不是数字编号。"
L.noSuchNickname = "|cFF33FF99MuteSoundFile:|r 无法在静音清单中找到别名为“%q” 的条目。"
L.noSuchID = "|cFF33FF99MuteSoundFile:|r 无法在静音清单中找到音效ID 为“%d” 的条目。"
L.failedToAdd = "|cFF33FF99MuteSoundFile:|r 找不到编号为“%d” 的音效ID，或你已将音效关闭。"
L.soundDesc = "\n\n\n\n你可以到这个网站查询音效ID："
L.presetDesc = "你可以快速地从默认清单里选择要静音的音效，默认清单的每一个条目都可以是单独一个音效，或多个同类音效。列表中，|T136814:0|t 表示已静音，|T136813:0|t 表示未静音。\n\n"
L.presets = "默认"
L.presetList = "默认清单"
L.presetSubmitYourOwn = "\n\n欢迎到我们的 GitHub 项目页面推送你想添加至默认静音清单的音效！"

L.lfgping = "界面：随机团队等待进入"
L.yakVendors = "座骑：雄壮远足牦牛"
L.sunwarmedFurline = "座骑：暖日绒猫"
L.choochooEmotes = "表情：小火车"
L.mooEmotes = "表情：哞哞叫"
L.peaFowl = "座骑：威严碧蓝雌孔雀"
--L.brutoUnta = "Mount: Mighty Caravan Brutosaur (Auctioneer Unta)"
