local _, AddonTable = ...

local idtoclass = {
    [1] = "Warrior",
    [2] = "Paladin",
    [3] = "Hunter",
    [4] = "Rogue",
    [5] = "Priest",
    [6] = "Death Knight",
    [7] = "Shaman",
    [8] = "Mage",
    [9] = "Warlock",
    [10] = "Monk",
    [11] = "Druid",
    [12] = "Demon Hunter",
    [13] = "Evoker",
}

local idtospec = {
    --Death Knight
    [250] = "Blood",
    [251] = "Frost",
    [252] = "Unholy",
    --Demon Hunter
    [577] = "Havoc",
    [581] = "Vengeance",
    --Druid
    [102] = "Balance",
    [103] = "Feral",
    [104] = "Guardian",
    [105] = "Restoration",
    --Evoker
    [1473] = "Augmentation",
    [1467] = "Devastation",
    [1468] = "Preservation",
    --Hunter
    [253] = "Beast Mastery",
    [254] = "Marksmanship",
    [255] = "Survival",
    --Mage
    [62] = "Arcane",
    [63] = "Fire",
    [64] = "Frost",
    --Monk
    [268] = "Brewmaster",
    [269] = "Windwalker",
    [270] = "Mistweaver",
    --Paladin
    [65] = "Holy",
    [66] = "Protection",
    [70] = "Retribution",
    --Priest
    [256] = "Discipline",
    [257] = "Holy",
    [258] = "Shadow",
    --Rogue
    [259] = "Assassination",
    [260] = "Outlaw",
    [261] = "Subtlety",
    --Shaman
    [262] = "Elemental",
    [263] = "Enhancement",
    [264] = "Restoration",
    --Warlock
    [265] = "Affliction",
    [266] = "Demonology",
    [267] = "Destruction",
    --Warrior
    [71] = "Arms",
    [72] = "Fury",
    [73] = "Protection",
}

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
eventFrame:RegisterEvent("LOADING_SCREEN_DISABLED")

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
    local _, classFilename, classID = UnitClass("player")
    local currentSpec = GetSpecialization()
    local specID = select(1, GetSpecializationInfo(currentSpec))
    --print("looting!!!!!!!")
    --print(classFilename)
    --print(currentSpec)
    --print(idtospec[specID])
    --print(idtoclass[classID])
    --local specName = select(2, GetSpecializationInfo(currentSpec))
    if AddonTable.bis[idtoclass[classID]] and AddonTable.bis[idtoclass[classID]][idtospec[specID]] then
        --print("passed data table check")
        for i = 1, 10 do
            local button = _G["GroupLootFrame"..i]
            if button and button:IsVisible() then
                --print("found an loot roll window")
                local ItemName = button.Name:GetText()
                --print(ItemName)
                if AddonTable.ResolveTokenNameForMyClass(ItemName) then
                    ItemName = AddonTable.ResolveTokenNameForMyClass(ItemName)
                end
                local label = button:CreateFontString(nil, "OVERLAY", "GameFontNormal")
                label:SetFont("Fonts\\FRIZQT__.TTF", 14, "OUTLINE")
                label:SetPoint("CENTER", 0, -4)
                label:SetText("")
                label:SetTextColor(1, 1, 0)   -- yellow
                label:SetJustifyH("LEFT")
                label:SetJustifyV("BOTTOM")
                --if AddonTable.bis[classFilename][idtospec[specID]]["O"][ItemName] then
                --    local currentText = label:GetText()
                --    label:SetText(currentText .. " O ")
                --end
                --if AddonTable.bis[classFilename][idtospec[specID]]["M+"][ItemName] then
                --    local currentText = label:GetText()
                --    label:SetText(currentText .. " M+ ")
                --end
                --if AddonTable.bis[classFilename][idtospec[specID]]["R"][ItemName] then
                --    local currentText = label:GetText()
                --    label:SetText(currentText .. " R ")
                --end
                for className, classData in pairs(AddonTable.bis) do
                    for specName, specData in pairs(classData) do
                        for sectionName, items in pairs(specData) do
                            if sectionName == "O" or sectionName == "R" or sectionName == "M+" then
                                for _, item in ipairs(items) do
                                    if item.name and item.name == ItemName then
                                        local currentText = label:GetText()
                                        label:SetText(currentText .. " " .. sectionName)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)