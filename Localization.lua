--[[
	Author  : Dennis Werner Garske (DWG) / brian / Mewtiny
	License : MIT License
]]
local _G                   = _G or getfenv(0)
local CleveRoids           = _G.CleveRoids or {}
CleveRoids.Locale    = GetLocale()
CleveRoids.Localized = {}

if CleveRoids.Locale == "enUS" or CleveRoids.Locale == "enGB" then
    CleveRoids.Localized.Shield     = "Shields"
    CleveRoids.Localized.Bow        = "Bows"
    CleveRoids.Localized.Crossbow   = "Crossbows"
    CleveRoids.Localized.Gun        = "Guns"
    CleveRoids.Localized.Thrown     = "Thrown"
    CleveRoids.Localized.Wand       = "Wands"
    CleveRoids.Localized.Sword      = "Swords"
    CleveRoids.Localized.Staff      = "Staves"
    CleveRoids.Localized.Polearm    = "Polearms"
    CleveRoids.Localized.Mace       = "Maces"
    CleveRoids.Localized.FistWeapon = "Fist Weapons"
    CleveRoids.Localized.Dagger     = "Daggers"
    CleveRoids.Localized.Axe        = "Axes"

    CleveRoids.Localized.Attack    = "Attack"
    CleveRoids.Localized.AutoShot  = "Auto Shot"
    CleveRoids.Localized.Shoot     = "Shoot"
    CleveRoids.Localized.SpellRank = "%(Rank %d+%)"

    CleveRoids.Localized.CreatureTypes = {
        ["Beast"]         = "Beast",
        ["Critter"]       = "Critter",
        ["Demon"]         = "Demon",
        ["Dragonkin"]     = "Dragonkin",
        ["Elemental"]     = "Elemental",
        ["Giant"]         = "Giant",
        ["Humanoid"]      = "Humanoid",
        ["Mechanical"]    = "Mechanical",
        ["Not specified"] = "Not_Specified",
        ["Totem"]         = "Totem",
        ["Undead"]        = "Undead",
    }

    CleveRoids.Localized.Spells = {
        ["Shadow Form"] = "Shadow Form",
        ["Stealth"]     = "Stealth",
        ["Prowl"]       = "Prowl",
    }
elseif CleveRoids.Locale == "deDE" then
    CleveRoids.Localized.Shield     = "Shields"
    CleveRoids.Localized.Bow        = "Bows"
    CleveRoids.Localized.Crossbow   = "Crossbows"
    CleveRoids.Localized.Gun        = "Guns"
    CleveRoids.Localized.Thrown     = "Thrown"
    CleveRoids.Localized.Wand       = "Wands"
    CleveRoids.Localized.Sword      = "Swords"
    CleveRoids.Localized.Staff      = "Staves"
    CleveRoids.Localized.Polearm    = "Polearms"
    CleveRoids.Localized.Mace       = "Maces"
    CleveRoids.Localized.FistWeapon = "Fist Weapons"
    CleveRoids.Localized.Dagger     = "Daggers"

    CleveRoids.Localized.Axe       = "Axes"
    CleveRoids.Localized.Attack    = "Attack"
    CleveRoids.Localized.AutoShot  = "Auto Shot"
    CleveRoids.Localized.Shoot     = "Shoot"
    CleveRoids.Localized.SpellRank = "%(Rank %d+%)"

    CleveRoids.Localized.CreatureTypes = {
        ["Wildtier"]           = "Beast",
        ["Kleintier"]          = "Critter",
        ["Dämon"]              = "Demon",
        ["Drachkin"]           = "Dragonkin",
        ["Elementar"]          = "Elemental",
        ["Riese"]              = "Giant",
        ["Humanoid"]           = "Humanoid",
        ["Mechanisch"]         = "Mechanical",
        ["Nicht spezifiziert"] = "Not_Specified",
        ["Totem"]              = "Totem",
        ["Untoter"]            = "Undead",
    }

    CleveRoids.Localized.Spells = {
        ["Shadow Form"] = "Schattengestalt",
        ["Stealth"]     = "Verstohlenheit",
        ["Prowl"]       = "Schleichen",
    }
elseif CleveRoids.Locale == "frFR" then
    CleveRoids.Localized.Shield     = "Shields"
    CleveRoids.Localized.Bow        = "Bows"
    CleveRoids.Localized.Crossbow   = "Crossbows"
    CleveRoids.Localized.Gun        = "Guns"
    CleveRoids.Localized.Thrown     = "Thrown"
    CleveRoids.Localized.Wand       = "Wands"
    CleveRoids.Localized.Sword      = "Swords"
    CleveRoids.Localized.Staff      = "Staves"
    CleveRoids.Localized.Polearm    = "Polearms"
    CleveRoids.Localized.Mace       = "Maces"
    CleveRoids.Localized.FistWeapon = "Fist Weapons"
    CleveRoids.Localized.Dagger     = "Daggers"
    CleveRoids.Localized.Axe        = "Axes"

    CleveRoids.Localized.Attack    = "Attack"
    CleveRoids.Localized.AutoShot  = "Auto Shot"
    CleveRoids.Localized.Shoot     = "Shoot"
    CleveRoids.Localized.SpellRank = "%(Rank %d+%)"

    CleveRoids.Localized.CreatureTypes = {
        ["Bête"]         = "Beast",
        ["Bestiole"]     = "Critter",
        ["Démon"]        = "Demon",
        ["Draconien"]    = "Dragonkin",
        ["Elémentaire"]  = "Elemental",
        ["Géant"]        = "Giant",
        ["Humanoïde"]    = "Humanoid",
        ["Machine"]      = "Mechanical",
        ["Non spécifié"] = "Not_Specified",
        ["Totem"]        = "Totem",
        ["Mort-vivant"]  = "Undead",
    }

    CleveRoids.Localized.Spells = {
        ["Shadow Form"] = "Forme d'Ombre",
        ["Stealth"]     = "Camouflage",
        ["Prowl"]       = "Rôder",
    }
elseif CleveRoids.Locale == "koKR" then
    CleveRoids.Localized.Shield     = "Shields"
    CleveRoids.Localized.Bow        = "Bows"
    CleveRoids.Localized.Crossbow   = "Crossbows"
    CleveRoids.Localized.Gun        = "Guns"
    CleveRoids.Localized.Thrown     = "Thrown"
    CleveRoids.Localized.Wand       = "Wands"
    CleveRoids.Localized.Sword      = "Swords"
    CleveRoids.Localized.Staff      = "Staves"
    CleveRoids.Localized.Polearm    = "Polearms"
    CleveRoids.Localized.Mace       = "Maces"
    CleveRoids.Localized.FistWeapon = "Fist Weapons"
    CleveRoids.Localized.Dagger     = "Daggers"
    CleveRoids.Localized.Axe        = "Axes"

    CleveRoids.Localized.Attack    = "Attack"
    CleveRoids.Localized.AutoShot  = "Auto Shot"
    CleveRoids.Localized.Shoot     = "Shoot"
    CleveRoids.Localized.SpellRank = "%(Rank %d+%)"

    CleveRoids.Localized.CreatureTypes = {
        ["야수"]  = "Beast",
        ["동물"]  = "Critter",
        ["악마"]  = "Demon",
        ["용족"]  = "Dragonkin",
        ["정령"]  = "Elemental",
        ["거인"]  = "Giant",
        ["인간형"] = "Humanoid",
        ["기계"]  = "Mechanical",
        ["기타"]  = "Not_Specified",
        ["토템"]  = "Totem",
        ["언데드"] = "Undead",
    }
    CleveRoids.Localized.Spells = {
        ["Shadow Form"] = "어둠의 형상",
        ["Stealth"]     = "은신",
        ["Prowl"]       = "숨기",
    }
elseif CleveRoids.Locale == "zhCN" then
    CleveRoids.Localized.Shield     = "Shields"
    CleveRoids.Localized.Bow        = "Bows"
    CleveRoids.Localized.Crossbow   = "Crossbows"
    CleveRoids.Localized.Gun        = "Guns"
    CleveRoids.Localized.Thrown     = "Thrown"
    CleveRoids.Localized.Wand       = "Wands"
    CleveRoids.Localized.Sword      = "Swords"
    CleveRoids.Localized.Staff      = "Staves"
    CleveRoids.Localized.Polearm    = "Polearms"
    CleveRoids.Localized.Mace       = "Maces"
    CleveRoids.Localized.FistWeapon = "Fist Weapons"
    CleveRoids.Localized.Dagger     = "Daggers"
    CleveRoids.Localized.Axe        = "Axes"

    CleveRoids.Localized.Attack    = "Attack"
    CleveRoids.Localized.AutoShot  = "Auto Shot"
    CleveRoids.Localized.Shoot     = "Shoot"
    CleveRoids.Localized.SpellRank = "%(Rank %d+%)"

    CleveRoids.Localized.CreatureTypes = {
        ["野兽"]   = "Beast",
        ["小动物"]  = "Critter",
        ["恶魔"]   = "Demon",
        ["龙类"]   = "Dragonkin",
        ["元素生物"] = "Elemental",
        ["巨人"]   = "Giant",
        ["人型生物"] = "Humanoid",
        ["机械"]   = "Mechanical",
        ["未指定"]  = "Not_Specified",
        ["图腾"]   = "Totem",
        ["亡灵"]   = "Undead",
    }

    CleveRoids.Localized.Spells = {
        ["Shadow Form"] = "暗影形态",
        ["Stealth"]     = "潜行",
        ["Prowl"]       = "潜行",
    }
elseif CleveRoids.Locale == "zhTW" then
    CleveRoids.Localized.Shield     = "Shields"
    CleveRoids.Localized.Bow        = "Bows"
    CleveRoids.Localized.Crossbow   = "Crossbows"
    CleveRoids.Localized.Gun        = "Guns"
    CleveRoids.Localized.Thrown     = "Thrown"
    CleveRoids.Localized.Wand       = "Wands"
    CleveRoids.Localized.Sword      = "Swords"
    CleveRoids.Localized.Staff      = "Staves"
    CleveRoids.Localized.Polearm    = "Polearms"
    CleveRoids.Localized.Mace       = "Maces"
    CleveRoids.Localized.FistWeapon = "Fist Weapons"
    CleveRoids.Localized.Dagger     = "Daggers"
    CleveRoids.Localized.Axe        = "Axes"

    CleveRoids.Localized.Attack    = "Attack"
    CleveRoids.Localized.AutoShot  = "Auto Shot"
    CleveRoids.Localized.Shoot     = "Shoot"
    CleveRoids.Localized.SpellRank = "%(Rank %d+%)"

    CleveRoids.Localized.CreatureTypes = {
        ["野獸"]   = "Beast",
        ["小動物"]  = "Critter",
        ["惡魔"]   = "Demon",
        ["龍類"]   = "Dragonkin",
        ["元素生物"] = "Elemental",
        ["巨人"]   = "Giant",
        ["人型生物"] = "Humanoid",
        ["機械"]   = "Mechanical",
        ["不明"]   = "Not_Specified",
        ["圖騰"]   = "Totem",
        ["不死族"]  = "Undead",
    }

    CleveRoids.Localized.Spells = {
        ["Shadow Form"] = "暗影形態",
        ["Stealth"]     = "隱形",
        ["Prowl"]       = "徘徊",
    }
elseif CleveRoids.Locale == "ruRU" then
    CleveRoids.Localized.Shield     = "Shields"
    CleveRoids.Localized.Bow        = "Bows"
    CleveRoids.Localized.Crossbow   = "Crossbows"
    CleveRoids.Localized.Gun        = "Guns"
    CleveRoids.Localized.Thrown     = "Thrown"
    CleveRoids.Localized.Wand       = "Wands"
    CleveRoids.Localized.Sword      = "Swords"
    CleveRoids.Localized.Staff      = "Staves"
    CleveRoids.Localized.Polearm    = "Polearms"
    CleveRoids.Localized.Mace       = "Maces"
    CleveRoids.Localized.FistWeapon = "Fist Weapons"
    CleveRoids.Localized.Dagger     = "Daggers"
    CleveRoids.Localized.Axe        = "Axes"

    CleveRoids.Localized.Attack    = "Attack"
    CleveRoids.Localized.AutoShot  = "Auto Shot"
    CleveRoids.Localized.Shoot     = "Shoot"
    CleveRoids.Localized.SpellRank = "%(Rank %d+%)"

    CleveRoids.Localized.CreatureTypes = {
        ["Животное"]   = "Beast",
        ["Существо"]   = "Critter",
        ["Демон"]      = "Demon",
        ["Дракон"]     = "Dragonkin",
        ["Элементаль"] = "Elemental",
        ["Великан"]    = "Giant",
        ["Гуманоид"]   = "Humanoid",
        ["Механизм"]   = "Mechanical",
        ["Не указано"] = "Not_Specified",
        ["Тотем"]      = "Totem",
        ["Нежить"]     = "Undead",
    }

    CleveRoids.Localized.Spells = {
        ["Shadow Form"] = "Облик Тени",
        ["Stealth"]     = "Незаметность",
        ["Prowl"]       = "Крадущийся зверь",
    }
elseif CleveRoids.Locale == "esES" then
    CleveRoids.Localized.Shield     = "Shields"
    CleveRoids.Localized.Bow        = "Bows"
    CleveRoids.Localized.Crossbow   = "Crossbows"
    CleveRoids.Localized.Gun        = "Guns"
    CleveRoids.Localized.Thrown     = "Thrown"
    CleveRoids.Localized.Wand       = "Wands"
    CleveRoids.Localized.Sword      = "Swords"
    CleveRoids.Localized.Staff      = "Staves"
    CleveRoids.Localized.Polearm    = "Polearms"
    CleveRoids.Localized.Mace       = "Maces"
    CleveRoids.Localized.FistWeapon = "Fist Weapons"
    CleveRoids.Localized.Dagger     = "Daggers"
    CleveRoids.Localized.Axe        = "Axes"

    CleveRoids.Localized.Attack    = "Attack"
    CleveRoids.Localized.AutoShot  = "Auto Shot"
    CleveRoids.Localized.Shoot     = "Shoot"
    CleveRoids.Localized.SpellRank = "%(Rank %d+%)"

    CleveRoids.Localized.CreatureTypes = {
        ["Bestia"]          = "Beast",
        ["Alma"]            = "Critter",
        ["Demonio"]         = "Demon",
        ["Dragon"]          = "Dragonkin",
        ["Elemental"]       = "Elemental",
        ["Gigante"]         = "Giant",
        ["Humanoide"]       = "Humanoid",
        ["Mecánico"]        = "Mechanical",
        ["No especificado"] = "Not_Specified",
        ["Tótem"]           = "Totem",
        ["No-muerto"]       = "Undead",
    }

    CleveRoids.Localized.Spells = {
        ["Shadow Form"] = "Forma de las Sombras",
        ["Stealth"]     = "Sigilo",
        ["Prowl"]       = "Acechar",
    }
end

_G["CleveRoids"] = CleveRoids