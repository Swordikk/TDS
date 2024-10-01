local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Script by Swordik | ⚡Tower Defense Simulator", HidePremium = false, IntroText = "Script by Swordik for TDS", SaveConfig = true, IntroEnabled = true, ConfigFolder = "Scripts"})

local Humanoid = game.Players.LocalPlayer.Character.Humanoid
local HumanoidRootPart = game.Players.LocalPlayer.Character.HumanoidRootPart

local Commander = {
    [1] = "Troops",
    [2] = "Abilities",
    [3] = "Activate",
    [4] = {
        ["Troop"] = workspace:WaitForChild("Towers"):WaitForChild("Victorian"),
        ["Name"] = "Call Of Arms",
        ["Data"] = {}
    }
}

function AutoCommander()
    while _G.AutoCommander == true do
        game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunction"):InvokeServer(unpack(Commander))
        wait(10.5)
    end
end

local Tab = Window:MakeTab({
	Name = "Misc",
	Icon = "rbxassetid://4483362748",
	PremiumOnly = false
})

Tab:AddToggle({
	Name = "AutoCommander (turn on when 3 commanders)",
	Default = false,
	Callback = function(Value)
		_G.AutoCommander = Value
		AutoCommander()
	end    
})
