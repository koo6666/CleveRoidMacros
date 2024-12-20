--[[
	Author: Dennis Werner Garske (DWG) / brian / Mewtiny
	License: MIT License
]]
local _G = _G or getfenv(0)
local CleveRoids = _G.CleveRoids or {}

CleveRoids.mouseoverUnit = CleveRoids.mouseoverUnit or nil

local Extension = CleveRoids.RegisterExtension("pfUI")
Extension.RegisterEvent("PLAYER_ENTERING_WORLD", "PLAYER_ENTERING_WORLD")

function Extension.OnLoad()
end

function Extension.RegisterPlayerScripts()
    if not pfUI.uf.player then
        return
    end
    local onEnterFunc = pfUI.uf.player:GetScript("OnEnter")
    local onLeaveFunc = pfUI.uf.player:GetScript("OnLeave")

    pfUI.uf.player:SetScript("OnEnter", function()
        CleveRoids.mouseoverUnit = "player"
        if onEnterFunc then
            onEnterFunc()
        end
    end)

    pfUI.uf.player:SetScript("OnLeave", function()
        CleveRoids.mouseoverUnit = nil
        if onLeaveFunc then
            onLeaveFunc()
        end
    end)
end

function Extension.RegisterTargetScripts()
    if not pfUI.uf.target then
        return
    end
    local onEnterFunc = pfUI.uf.target:GetScript("OnEnter")
    local onLeaveFunc = pfUI.uf.target:GetScript("OnLeave")

    pfUI.uf.target:SetScript("OnEnter", function()
        CleveRoids.mouseoverUnit = "target"
        if onEnterFunc then
            onEnterFunc()
        end
    end)

    pfUI.uf.target:SetScript("OnLeave", function()
        CleveRoids.mouseoverUnit = nil
        if onLeaveFunc then
            onLeaveFunc()
        end
    end)
end

function Extension.RegisterTargetTargetScripts()
    if not pfUI.uf.targettarget then
        return
    end
    local onEnterFunc = pfUI.uf.targettarget:GetScript("OnEnter")
    local onLeaveFunc = pfUI.uf.targettarget:GetScript("OnLeave")

    pfUI.uf.targettarget:SetScript("OnEnter", function()
        CleveRoids.mouseoverUnit = "targettarget"
        if onEnterFunc then
            onEnterFunc()
        end
    end)

    pfUI.uf.targettarget:SetScript("OnLeave", function()
        CleveRoids.mouseoverUnit = nil
        if onLeaveFunc then
            onLeaveFunc()
        end
    end)
end

function Extension.PLAYER_ENTERING_WORLD()
    if not pfUI or not pfUI.uf then
        return
    end
    Extension.RegisterPlayerScripts()
    Extension.RegisterTargetScripts()
    Extension.RegisterTargetTargetScripts()
end
