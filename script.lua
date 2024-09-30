local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Script by Swordik | ⚡Tower Defense Simulator", HidePremium = false, IntroText = "Script by Swordik for TDS", SaveConfig = true, IntroEnabled = true, ConfigFolder = "Scripts"})

local Skip = {
    [1] = "Voting",
    [2] = "Skip"
}

function AutoSkip()
while _G.AutoSkip == true do
game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunction"):InvokeServer(unpack(Skip))
wait(0.1)
end
end

local Tab = Window:MakeTab({
	Name = "Misc",
	Icon = "",
	PremiumOnly = false
})

Tab:AddToggle({
	Name = "Auto Skip",
	Default = false,
	Callback = function(Value)
		_G.AutoSkip = Value
		AutoSkip()
	end    
})
