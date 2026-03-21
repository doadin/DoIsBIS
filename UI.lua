local ADDON_NAME, AddonTable = ...

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

local function GetPlayerClassSpec()
    local _, _, classID = UnitClass("player")
    local specIndex = GetSpecialization()
    local specID = specIndex and select(1, GetSpecializationInfo(specIndex))
    local class = idtoclass[classID]
    local specName = idtospec[specID]
    return class, specName
end

local function CreateBiSWindow()
    local f = CreateFrame("Frame", nil, UIParent, "BackdropTemplate")
    f:SetSize(400, 500)
    f:SetPoint("CENTER")
    f:SetBackdrop({
        bgFile = "Interface/Tooltips/UI-Tooltip-Background",
        edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
        tile = true, tileSize = 16, edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 }
    })
    f:SetBackdropColor(0, 0, 0, 0.85)
    f:EnableMouse(true)
    f:SetMovable(true)
    f:RegisterForDrag("LeftButton")
    f:SetScript("OnDragStart", f.StartMoving)
    f:SetScript("OnDragStop", f.StopMovingOrSizing)
    f:Hide()

    f.title = f:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    f.title:SetPoint("TOP", 0, -10)
    f.title:SetText("BiS Items")

    local close = CreateFrame("Button", nil, f, "UIPanelCloseButton")
    close:SetPoint("TOPRIGHT", -5, -5)

    return f
end

local function CreateScrollArea(parent)
    local scrollFrame = CreateFrame("ScrollFrame", nil, parent, "UIPanelScrollFrameTemplate")
    scrollFrame:SetPoint("TOPLEFT", 10, -40)
    scrollFrame:SetPoint("BOTTOMRIGHT", -30, 10)

    local content = CreateFrame("Frame", nil, scrollFrame)
    content:SetPoint("TOPLEFT")
    content:SetPoint("TOPRIGHT")
    content:SetWidth(scrollFrame:GetWidth())  -- CRITICAL
    content:SetHeight(1)
    --content:SetSize(1, 1) -- will expand dynamically
    scrollFrame:SetScrollChild(content)

    return scrollFrame, content
end



local function BuildRowsForClassSpec(className, specName)
    local rows = {}

    if not AddonTable or not AddonTable.bis then
        return rows
    end

    local classData = AddonTable.bis[className]
    if not classData then
        return rows
    end

    local specData = classData[specName]
    if not specData then
        return rows
    end

    for contentType, items in pairs(specData) do
        table.insert(rows, { isHeader = true, text = contentType })

        if type(items) == "table" then
            for _, data in ipairs(items) do
                --local itemName = data and data.id and C_Item and C_Item.GetItemNameByID and C_Item.GetItemNameByID(data.id)
                --itemName = itemName or ("Item " .. tostring(data.id))
                local itemLink = select(2, GetItemInfo(data.id)) or ("item:" .. data.id)
                table.insert(rows, { isHeader = false, text = itemLink, itemID = data.id })
            end
        end
    end

    return rows
end

local function PopulateScrollFrame(content, rows)
    -- Clear old rows
    for _, child in ipairs({ content:GetChildren() }) do
        child:Hide()
        child:SetParent(nil)
    end

    local yOffset = -5
    local width = content:GetParent():GetWidth() - 20

    for _, row in ipairs(rows) do
        local rowFrame = CreateFrame("Frame", nil, content)
        rowFrame:SetPoint("TOPLEFT", 0, yOffset)
        rowFrame:SetPoint("TOPRIGHT", 0, yOffset)
        rowFrame:SetHeight(row.isHeader and 24 or 18)
        rowFrame:EnableMouse(true)

        local fs = rowFrame:CreateFontString(nil, "OVERLAY", row.isHeader and "GameFontNormalLarge" or "GameFontNormal")
        fs:SetPoint("LEFT", 5, 0)

        if row.isHeader then
            fs:SetText("|cffFFD100" .. row.text .. "|r")
            yOffset = yOffset - 26
        else
            fs:SetText("• " .. row.text)

            rowFrame:SetScript("OnEnter", function(self)
                GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                GameTooltip:SetHyperlink(row.text)
                GameTooltip:Show()
            end)

            rowFrame:SetScript("OnLeave", function()
                GameTooltip:Hide()
            end)

            rowFrame:SetScript("OnMouseUp", function(self, button)
                if button == "LeftButton" then
                    HandleModifiedItemClick(row.text)
                end
            end)

            yOffset = yOffset - 20
        end
    end

    content:SetHeight(-yOffset + 10)

end

local window
local scrollFrame
local content

local function ShowBiSWindow()
    if not window then
        window = CreateBiSWindow()
        scrollFrame, content = CreateScrollArea(window)
    end

    local class, spec = GetPlayerClassSpec()
    if not class or not spec then
        print("BiS: could not determine class/spec.")
        return
    end

    local rows = BuildRowsForClassSpec(class, spec)
    if #rows == 0 then
        print("BiS: no data for " .. class .. " / " .. spec)
    end

    PopulateScrollFrame(content, rows)

    window.title:SetText(class .. " - " .. spec .. " BiS")
    window:Show()
end


SLASH_SHOWBIS1 = "/doisbis"
SlashCmdList.SHOWBIS = function()
    ShowBiSWindow()
end