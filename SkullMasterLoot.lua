local EventFrame = CreateFrame("Frame")
EventFrame:RegisterEvent("PLAYER_TARGET_CHANGED")
EventFrame:SetScript("OnEvent", function(self, event, ...)
    local IsFightingBoss = UnitLevel("target") < 0 or UnitLevel("targettarget") < 0

    if IsFightingBoss and GetLootMethod() ~= "master" and GetNumRaidMembers() > 0 and IsRaidLeader() then
        local BossName = (UnitLevel("target") < 0 and UnitName("target")) or (UnitLevel("targettarget") < 0 and UnitName("targettarget"))

        ChatFrame1:AddMessage('SkullMasterLoot detected a boss! Switching to master loot.')
        SetLootMethod("master", UnitName("player"))
        SendChatMessage(UnitName("player") .. " " .. "switched to master loot for" .. " " .. BossName,
            "RAID_WARNING")
    end
end)
