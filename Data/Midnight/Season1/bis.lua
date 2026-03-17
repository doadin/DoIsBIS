local _, AddonTable = ...

local MIDNIGHT_TIER_IDS = {
    WARRIOR = {
        HELM = 249952,
        SHOULDERS = 249950,
        CHEST = 249955,
        GLOVES = 249953,
        LEGS = 249951,
    },

    PALADIN = {
        HELM = 249961,
        SHOULDERS = 249959,
        CHEST = 249964,
        GLOVES = 249962,
        LEGS = 249960,
    },

    DEATHKNIGHT = {
        HELM = 249970,
        SHOULDERS = 249968,
        CHEST = 249973,
        GLOVES = 249971,
        LEGS = 249969,
    },

    DEMONHUNTER = {
        HELM = 250033,
        SHOULDERS = 250031,
        CHEST = 250036,
        GLOVES = 250034,
        LEGS = 250032,
    },

    DRUID = {
        HELM = 250024,
        SHOULDERS = 250022,
        CHEST = 250027,
        GLOVES = 250025,
        LEGS = 250023,
    },

    EVOKER = {
        HELM = 249997,
        SHOULDERS = 249995,
        CHEST = 250000,
        GLOVES = 249998,
        LEGS = 249996,
    },

    HUNTER = {
        HELM = 249988,
        SHOULDERS = 249986,
        CHEST = 249991,
        GLOVES = 249989,
        LEGS = 249987,
    },

    MAGE = {
        HELM = 250060,
        SHOULDERS = 250058,
        CHEST = 250063,
        GLOVES = 250061,
        LEGS = 250059,
    },

    MONK = {
        HELM = 250015,
        SHOULDERS = 250013,
        CHEST = 250018,
        GLOVES = 250016,
        LEGS = 250014,
    },

    PRIEST = {
        HELM = 250051,
        SHOULDERS = 250049,
        CHEST = 250054,
        GLOVES = 250052,
        LEGS = 250050,
    },

    ROGUE = {
        HELM = 250006,
        SHOULDERS = 250004,
        CHEST = 250009,
        GLOVES = 250007,
        LEGS = 250005,
    },

    SHAMAN = {
        HELM = 249979,
        SHOULDERS = 249977,
        CHEST = 249982,
        GLOVES = 249980,
        LEGS = 249978,
    },

    WARLOCK = {
        HELM = 250042,
        SHOULDERS = 250040,
        CHEST = 250045,
        GLOVES = 250043,
        LEGS = 250041,
    },
}

local MIDNIGHT_TIER_NAMES = {
    DEATHKNIGHT = {
        HELM = "Relentless Rider's Crown",
        SHOULDERS = "Relentless Rider's Dreadthorns",
        CHEST = "Relentless Rider's Cuirass",
        GLOVES = "Relentless Rider's Bonegrasps",
        LEGS = "Relentless Rider's Legguards",
    },

    DEMONHUNTER = {
        HELM = "Devouring Reaver's Intake",
        SHOULDERS = "Devouring Reaver's Exhaustplates",
        CHEST = "Devouring Reaver's Engine",
        GLOVES = "Devouring Reaver's Essence Grips",
        LEGS = "Devouring Reaver's Pistons",
    },

    DRUID = {
        HELM = "Branches of the Luminous Bloom",
        SHOULDERS = "Seedpods of the Luminous Bloom",
        CHEST = "Trunk of the Luminous Bloom",
        GLOVES = "Arbortenders of the Luminous Bloom",
        LEGS = "Phloemwraps of the Luminous Bloom",
    },

    EVOKER = {
        HELM = "Hornhelm of the Black Talon",
        SHOULDERS = "Beacons of the Black Talon",
        CHEST = "Frenzyward of the Black Talon",
        GLOVES = "Enforcer's Grips of the Black Talon",
        LEGS = "Greaves of the Black Talon",
    },

    HUNTER = {
        HELM = "Primal Sentry's Maw",
        SHOULDERS = "Primal Sentry's Trophies",
        CHEST = "Primal Sentry's Scaleplate",
        GLOVES = "Primal Sentry's Talonguards",
        LEGS = "Primal Sentry's Legguards",
    },

    MAGE = {
        HELM = "Voidbreaker's Veil",
        SHOULDERS = "Voidbreaker's Leyline Nexi",
        CHEST = "Voidbreaker's Robe",
        GLOVES = "Voidbreaker's Gloves",
        LEGS = "Voidbreaker's Britches",
    },

    MONK = {
        HELM = "Fearsome Visage of Ra-den's Chosen",
        SHOULDERS = "Aurastones of Ra-den's Chosen",
        CHEST = "Battle Garb of Ra-den's Chosen",
        GLOVES = "Thunderfists of Ra-den's Chosen",
        LEGS = "Swiftsweepers of Ra-den's Chosen",
    },

    PALADIN = {
        HELM = "Luminant Verdict's Unwavering Gaze",
        SHOULDERS = "Luminant Verdict's Providence Watch",
        CHEST = "Luminant Verdict's Divine Warplate",
        GLOVES = "Luminant Verdict's Gauntlets",
        LEGS = "Luminant Verdict's Greaves",
    },

    PRIEST = {
        HELM = "Blind Oath's Winged Crest",
        SHOULDERS = "Blind Oath's Seraphguards",
        CHEST = "Blind Oath's Raiment",
        GLOVES = "Blind Oath's Touch",
        LEGS = "Blind Oath's Leggings",
    },

    ROGUE = {
        HELM = "Masquerade of the Grim Jest",
        SHOULDERS = "Venom Casks of the Grim Jest",
        CHEST = "Fantastic Finery of the Grim Jest",
        GLOVES = "Sleight of Hand of the Grim Jest",
        LEGS = "Blade Holsters of the Grim Jest",
    },

    SHAMAN = {
        HELM = "Locus of the Primal Core",
        SHOULDERS = "Tempests of the Primal Core",
        CHEST = "Embrace of the Primal Core",
        GLOVES = "Earthgrips of the Primal Core",
        LEGS = "Leggings of the Primal Core",
    },

    WARLOCK = {
        HELM = "Abyssal Immolator's Smoldering Flames",
        SHOULDERS = "Abyssal Immolator's Fury",
        CHEST = "Abyssal Immolator's Dreadrobe",
        GLOVES = "Abyssal Immolator's Grasps",
        LEGS = "Abyssal Immolator's Pillars",
    },

    WARRIOR = {
        HELM = "Night Ender's Tusks",
        SHOULDERS = "Night Ender's Pauldrons",
        CHEST = "Night Ender's Breastplate",
        GLOVES = "Night Ender's Fists",
        LEGS = "Night Ender's Chausses",
    },
}

local CLASS_SLOT = {
    Fanatical = "HELM",
    Hungering = "GLOVES",
    Unraveled = "SHOULDERS",
    Corrupted = "LEGS",
}

local TOKEN_SUFFIX = {
    -- You fill these with actual token itemIDs
    [249355]  = "Fanatical",
    [249351]  = "Hungering",
    [249363]  = "Unraveled",
    [249359]  = "Corrupted",

    [249357]   = "Fanatical",
    [249353]   = "Hungering",
    [249365]   = "Unraveled",
    [249361]   = "Corrupted",

    [249358] = "Fanatical",
    [249354] = "Hungering",
    [249366] = "Unraveled",
    [249362] = "Corrupted",

    [249356]  = "Fanatical",
    [249352]  = "Hungering",
    [249364]  = "Unraveled",
    [249360]  = "Corrupted",
}

function ResolveTokenForMyClass(tokenID)
    local suffix = TOKEN_SUFFIX[tokenID]
    if not suffix then return nil end

    local slot = CLASS_SLOT[suffix]
    if not slot then return nil end

    local _, class = UnitClass("player")
    local tier = MIDNIGHT_TIER_IDS[class]
    if not tier then return nil end

    return tier[slot]
end

local SLOT_FROM_SUFFIX = {
    Fanatical = "HELM",
    Hungering = "GLOVES",
    Unraveled = "SHOULDERS",
    Corrupted = "LEGS",
}

function AddonTable.ResolveTokenNameForMyClass(tokenName)
    if not tokenName then return nil end

    -- Extract the suffix (Fanatical, Hungering, Unraveled, Corrupted)
    local suffix = tokenName:match("(%w+)%s+Nullcore$")
    if not suffix then return nil end

    local slot = SLOT_FROM_SUFFIX[suffix]
    if not slot then return nil end

    -- Get your class
    local _, class = UnitClass("player")
    local tier = MIDNIGHT_TIER_NAMES[class]
    if not tier then return nil end

    return tier[slot]
end


AddonTable.bis = {
    ["PALADIN"] = {
        ["Holy"] = {
            ["O"] = {
                ["Spellboon Saber"] = true, -- Mainhand Weapon
                ["Viryx's Indomitable Bulwark"] = true, -- Shield
                ["Luminant Verdict's Unwavering Gaze"] = true, -- Helm
                ["Amulet of the Abyssal Hymn"] = true, -- Neck
                ["Luminant Verdict's Providence Watch"] = true, -- Shoulder
                ["Adherent's Silken Shroud"] = true, -- Cloak
                ["Luminant Verdict's Divine Warplate"] = true, -- Chest
                ["Spellbreaker's Bracers"] = true, -- Bracers
                ["Luminant Verdict's Gauntlets"] = true, -- Gloves
                ["Ezzorak's Gloombind"] = true, -- Belt
                ["Extinction Guards"] = true, -- Legs
                ["Parasite Stompers"] = true, -- Boots
                ["Sin'dorei Band of Hope"] = true, -- Ring #1
                ["Eye of Midnight"] = true, -- Ring #2
                ["Vaelgor's Final Stare"] = true, -- Trinket #1
                ["Gaze of the Alnseer"] = true, -- Trinket #2
            },
            ["M+"] = {
                ["Spellboon Saber"] = true, -- Mainhand Weapon
                ["Viryx's Indomitable Bulwark"] = true, -- Shield
                ["Luminant Verdict's Unwavering Gaze"] = true, -- Helm
                ["Barbed Ymirheim Choker"] = true, -- Neck
                ["Luminant Verdict's Providence Watch"] = true, -- Shoulder
                ["Adherent's Silken Shroud"] = true, -- Cloak
                ["Luminant Verdict's Divine Warplate"] = true, -- Chest
                ["Spellbreaker's Bracers"] = true, -- Bracers
                ["Luminant Verdict's Gauntlets"] = true, -- Gloves
                ["Girdle of the Shadowguard"] = true, -- Belt
                ["Legplates of Lingering Dusk"] = true, -- Legs
                ["Oathsworn Stompers"] = true, -- Boots
                ["Bifurcation Band"] = true, -- Ring #1
                ["Omission of Light"] = true, -- Ring #2
                ["Heart of Wind"] = true, -- Trinket #1
                ["Emberwing Feather"] = true, -- Trinket #2
            },
            ["R"] = {
                ["Blade of the Blind Verdict"] = true, -- Mainhand Weapon
                ["Thalassian Dawnguard"] = true, -- Shield
                ["Luminant Verdict's Unwavering Gaze"] = true, -- Helm
                ["Amulet of the Abyssal Hymn"] = true, -- Neck
                ["Luminant Verdict's Providence Watch"] = true, -- Shoulder
                ["Adherent's Silken Shroud"] = true, -- Cloak
                ["Luminant Verdict's Divine Warplate"] = true, -- Chest
                ["Spellbreaker's Bracers"] = true, -- Bracers
                ["Luminant Verdict's Gauntlets"] = true, -- Gloves
                ["Ezzorak's Gloombind"] = true, -- Belt
                ["Extinction Guards"] = true, -- Legs
                ["Parasite Stompers"] = true, -- Boots
                ["Sin'dorei Band of Hope"] = true, -- Ring #1
                ["Eye of Midnight"] = true, -- Ring #2
                ["Vaelgor's Final Stare"] = true, -- Trinket #1
                ["Gaze of the Alnseer"] = true, -- Trinket #2
            },
        },
        ["Protection"] = {
            ["O"] = {
                ["Turalyon's False Echo"] = true, -- Mainhand Weapon
                ["Bulwark of Noble Resolve"] = true, -- Shield
                ["Luminant Verdict's Unwavering Gaze"] = true, -- Helm
                ["Pendant of Aching Grief"] = true, -- Neck
                ["Luminant Verdict's Providence Watch"] = true, -- Shoulder
                ["Imperator's Banner"] = true, -- Cloak
                ["Luminant Verdict's Divine Warplate"] = true, -- Chest
                ["Spellbreaker's Bracers"] = true, -- Bracers
                ["Voidclaw Gauntlets"] = true, -- Gloves
                ["Ezzorak's Gloombind"] = true, -- Belt
                ["Luminant Verdict's Greaves"] = true, -- Legs
                ["Parasite Stompers"] = true, -- Boots
                ["Occlusion of Void"] = true, -- Ring #1
                ["Loa Worshiper's Band"] = true, -- Ring #2
                ["Umbral Plume"] = true, -- Trinket #1
                ["Algeth'ar Puzzle Box"] = true, -- Trinket #2
            },
            ["M+"] = {
                ["Spellbane Cutlass"] = true, -- Mainhand Weapon
                ["Ward of the Spellbreaker"] = true, -- Shield
                ["Luminant Verdict's Unwavering Gaze"] = true, -- Helm
                ["Pendant of Aching Grief"] = true, -- Neck
                ["Luminant Verdict's Providence Watch"] = true, -- Shoulder
                ["Cloak of the Fallen Cardinal"] = true, -- Cloak
                ["Luminant Verdict's Divine Warplate"] = true, -- Chest
                ["Spellbreaker's Bracers"] = true, -- Bracers
                ["Voidclaw Gauntlets"] = true, -- Gloves
                ["Shadowsplit Girdle"] = true, -- Belt
                ["Luminant Verdict's Greaves"] = true, -- Legs
                ["Footwraps of Ill-Fate"] = true, -- Boots
                ["Occlusion of Void"] = true, -- Ring #1
                ["Loa Worshiper's Band"] = true, -- Ring #2
                ["Solarflare Prism"] = true, -- Trinket #1
                ["Algeth'ar Puzzle Box"] = true, -- Trinket #2
            },
            ["R"] = {
                ["Turalyon's False Echo"] = true, -- Mainhand Weapon
                ["Bulwark of Noble Resolve"] = true, -- Shield
                ["Luminant Verdict's Unwavering Gaze"] = true, -- Helm
                [" Ribbon of Coiled Malice"] = true, -- Neck
                ["Luminant Verdict's Providence Watch"] = true, -- Shoulder
                ["Imperator's Banner"] = true, -- Cloak
                ["Sunbound Breastplate"] = true, -- Chest
                ["Spellbreaker's Bracers"] = true, -- Bracers
                ["Luminant Verdict's Gauntlets"] = true, -- Gloves
                ["Ezzorak's Gloombind"] = true, -- Belt
                ["Luminant Verdict's Greaves"] = true, -- Legs
                ["Parasite Stompers"] = true, -- Boots
                ["Eye of Midnight"] = true, -- Ring #1
                ["Loa Worshiper's Band"] = true, -- Ring #2
                ["Umbral Plume"] = true, -- Trinket #1
                ["Gaze of the Alnseer"] = true, -- Trinket #2
            },
        },
        ["Retribution"] = {
            ["O"] = {
                ["Bellamy's Final Judgement"] = true, -- Mainhand Weapon
                ["Luminant Verdict's Unwavering Gaze"] = true, -- Helm
                ["Amulet of the Abyssal Hymn"] = true, -- Neck
                ["Luminant Verdict's Providence Watch"] = true, -- Shoulder
                ["Adherent's Silken Shroud"] = true, -- Cloak
                ["Luminant Verdict's Divine Warplate"] = true, -- Chest
                ["Spellbreaker's Bracers"] = true, -- Bracers
                ["Voidclaw Gauntlets"] = true, -- Gloves
                ["Hate-Tied Waistchain"] = true, -- Belt
                ["Luminant Verdict's Greaves"] = true, -- Legs
                ["Greaves of the Unformed"] = true, -- Boots
                ["Eye of Midnight"] = true, -- Ring #1
                ["Sin'dorei Band of Hope"] = true, -- Ring #2
                ["Gaze of the Alnseer"] = true, -- Trinket #1
                ["Radiant Plume"] = true, -- Trinket #2
            },
            ["M+"] = {
                ["Spellboon Saber"] = true, -- Mainhand Weapon
                ["Luminant Verdict's Unwavering Gaze"] = true, -- Helm
                ["Barbed Ymirheim Choker"] = true, -- Neck
                ["Luminant Verdict's Providence Watch"] = true, -- Shoulder
                ["Adherent's Silken Shroud"] = true, -- Cloak
                ["Luminant Verdict's Divine Warplate"] = true, -- Chest
                ["Spellbreaker's Bracers"] = true, -- Bracers
                ["Luminant Verdict's Gauntlets"] = true, -- Gloves
                ["Girdle of the Shadowguard"] = true, -- Belt
                ["Legplates of Lingering Dusk"] = true, -- Legs
                ["Oathsworn Stompers"] = true, -- Boots
                ["Bifurcation Band"] = true, -- Ring #1
                ["Omission of Light"] = true, -- Ring #2
                ["Heart of Wind"] = true, -- Trinket #1
                ["Emberwing Feather"] = true, -- Trinket #2
            },
            ["R"] = {
                ["Blade of the Blind Verdict"] = true, -- Mainhand Weapon
                ["Luminant Verdict's Unwavering Gaze"] = true, -- Helm
                ["Amulet of the Abyssal Hymn"] = true, -- Neck
                ["Luminant Verdict's Providence Watch"] = true, -- Shoulder
                ["Adherent's Silken Shroud"] = true, -- Cloak
                ["Luminant Verdict's Divine Warplate"] = true, -- Chest
                ["Spellbreaker's Bracers"] = true, -- Bracers
                ["Luminant Verdict's Gauntlets"] = true, -- Gloves
                ["Ezzorak's Gloombind"] = true, -- Belt
                ["Extinction Guards"] = true, -- Legs
                ["Parasite Stompers"] = true, -- Boots
                ["Sin'dorei Band of Hope"] = true, -- Ring #1
                ["Eye of Midnight"] = true, -- Ring #2
                ["Vaelgor's Final Stare"] = true, -- Trinket #1
                ["Gaze of the Alnseer"] = true, -- Trinket #2
            },
        },
    }
}