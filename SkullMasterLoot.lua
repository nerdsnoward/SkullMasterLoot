local EventFrame = CreateFrame("Frame")
EventFrame:RegisterEvent("PLAYER_TARGET_CHANGED")
EventFrame:SetScript("OnEvent", function(self, event, ...)
    local targetLevel = UnitLevel("target")
    local targetOfTargetLevel = UnitLevel("targettarget")

    if targetLevel < 0 and GetLootMethod() ~= "master" and GetNumRaidMembers() > 0 and IsRaidLeader() then
        ChatFrame1:AddMessage('SkullMasterLoot detected a boss! Switching to master loot.')

        SetLootMethod("master", UnitName("player"))
        SendChatMessage(UnitName("player") .. " " .. "switched to master loot for" .. " " .. UnitName("target"),
            "RAID_WARNING")
    end

    if targetOfTargetLevel < 0 and GetLootMethod() ~= "master" and GetNumRaidMembers() > 0 and IsRaidLeader() then
        ChatFrame1:AddMessage('SkullMasterLoot detected a boss! Switching to master loot.')

        SetLootMethod("master", UnitName("player"))
        SendChatMessage(UnitName("player") .. " " .. "switched to master loot for" .. " " .. UnitName("targettarget"),
            "RAID_WARNING")
    end
end)
