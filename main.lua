assert(hookmetamethod, "Your exploit is not supported.")

local Players = game.Players
local Player = game.Players.LocalPlayer
local KickEnabled = true
local hm = hookmetamethod

local RunService = game.RunService
local Heartbeat = RunService.Heartbeat
local Vec3n = Vector3.new

local Netless = {
    Activated = false
}

local Reanimation = {
    rfunction = nil
}

function Reanimation:Reanimate(callback)
    xpcall(function ()
        Reanimation.rfunction()
    end, function (e)
        callback(e)
    end)
end

function Reanimation:Setup(rfunction)
    Reanimation.rfunction = rfunction
end

function Netless.new(defaultvalue)
    if defaultvalue then
       Netless.Activated = true
    else
        Netless.Activated = false 
    end

    for _, v in pairs(Player.Character:GetDescendants()) do
        if v:isA("BasePart") and v.Name ~= "HumanoidRootPart" then
            Heartbeat:Connect(function ()
                if (Netless.Activated) then
                    v.Velocity = Vec3n(-30, 0, 0)
                end
            end)
        end
    end
end

function Netless:Destroy()
    for _, v in pairs(Player.Character:GetDescendants()) do
        if v:isA("BasePart") and v.Name ~= "HumanoidRootPart" then
            for  _, connection in pairs(getconnections(v)) do
                if connection == "Heartbeat" then
                    connection:Disconnect()
                end
            end
        end
    end
end

local OldMetamethod

OldMetamethod = hm(game, "__namecall", newcclosure(function (self, ...)
    local arguments = {...}

    if self == Player and getnamecallmethod() == "GetConstantCharacter" then
        local Character = Player.Character or Player.CharacterAdded:Wait()

        Player.CharacterAdded:Connect(function (char)
            Character = char
        end)
        
        return Character

    elseif self == Player and getnamecallmethod() == "SetupNetless" then
        Netless.new(arguments[1])
        return nil

    elseif self == Player and getnamecallmethod() == "EnableNetless" then
        Netless.Activated = true
        return nil

    elseif self == Player and getnamecallmethod() == "DisableNetless" then
        Netless.Activated = false
        return nil

    elseif self == Player and getnamecallmethod() == "ResetNetless" then
        Netless:Destroy()
        return nil

    elseif self == Player and getnamecallmethod() == "SetupReanimation" then
        Reanimation:Setup(arguments[1])
        return nil

    elseif self == Player and getnamecallmethod() == "Reanimate" then
        Reanimation:Reanimate(arguments[1])
        return nil

    elseif self == Player and getnamecallmethod() == "DisableKick" then
        KickEnabled = false
        return nil

    elseif self == Player and getnamecallmethod() == "Kick" and not KickEnabled then
        return nil
    end

    return OldMetamethod(self, ...)
end))

print("[+] LocalPlayer++ loaded.")