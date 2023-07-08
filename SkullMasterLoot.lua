local EventFrame = CreateFrame("Frame")
EventFrame:RegisterEvent("PLAYER_TARGET_CHANGED")
EventFrame:SetScript("OnEvent", function()
    inInstance, instanceType = IsInInstance()

    if inInstance and instanceType == 'raid' then
        local isFightingBoss = UnitLevel("target") < 0 or UnitLevel("targettarget") < 0
        local bossName = (UnitLevel("target") < 0 and UnitName("target")) or (UnitLevel("targettarget") < 0 and UnitName("targettarget"))
    
        if isFightingBoss and GetLootMethod() ~= "master" and IsRaidLeader() then
            ChatFrame1:AddMessage('SkullMasterLoot detected a boss! Switching to master loot.')
            SetLootMethod("master", UnitName("player"))
            SendChatMessage(UnitName("player") .. " " .. "switched to master loot for" .. " " .. bossName,
                "RAID_WARNING")
        end 
    end
end)
