local _, AddonTable = ...

local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("START_LOOT_ROLL")
eventFrame:RegisterEvent("BONUS_ROLL_ACTIVATE")
eventFrame:RegisterEvent("BONUS_ROLL_DEACTIVATE")
eventFrame:RegisterEvent("BONUS_ROLL_FAILED")
eventFrame:RegisterEvent("BONUS_ROLL_RESULT")
eventFrame:RegisterEvent("BONUS_ROLL_STARTED")
eventFrame:RegisterEvent("CANCEL_LOOT_ROLL")
eventFrame:RegisterEvent("CONFIRM_DISENCHANT_ROLL")
eventFrame:RegisterEvent("CONFIRM_LOOT_ROLL")
eventFrame:RegisterEvent("LOOT_BIND_CONFIRM")
eventFrame:RegisterEvent("LOOT_ITEM_AVAILABLE")

eventFrame:SetScript("OnEvent", function()
    --function(self, event, ...)
	--if event == "CHAT_MSG_CHANNEL" then
	--	local msg, playerName = ...
	--	print(event, msg, playerName)
	--elseif event == "PLAYER_STARTED_MOVING" then
	--	print("You started moving")
	--elseif event == "PLAYER_STOPPED_MOVING" then
	--	print("You stopped moving")
	--end
    --AddonTable.bis["PALADIN"]["HOLY"]
    local _, classFilename, _ = UnitClass(unit)
    local currentSpec = GetSpecialization()
    local specName = select(2, GetSpecializationInfo(currentSpec))
    for i = 1, 10 do
        local button = _G["GroupLootFrame"..i]
        if button and button:IsVisible() then
            local ItemName = button.Name:GetText()
            if AddonTable.ResolveTokenNameForMyClass(ItemName) then
                ItemName = AddonTable.ResolveTokenNameForMyClass(ItemName)
            end
            local label = button:CreateFontString(nil, "OVERLAY", "GameFontNormal")
            label:SetFont("Fonts\\FRIZQT__.TTF", 14, "OUTLINE")
            label:SetPoint("CENTER")
            label:SetText("")
            label:SetTextColor(1, 1, 0)   -- yellow
            label:SetJustifyH("LEFT")
            label:SetJustifyV("BOTTOM")
            if AddonTable.bis[classFilename][specName]["O"][ItemName] then
                local currentText = label:GetText()
                label:SetText(currentText .. " O ")
            end
            if AddonTable.bis[classFilename][specName]["M+"][ItemName] then
                local currentText = label:GetText()
                label:SetText(currentText .. " M+ ")
            end
            if AddonTable.bis[classFilename][specName]["R"][ItemName] then
                local currentText = label:GetText()
                label:SetText(currentText .. " R ")
            end
        end
    end
end)