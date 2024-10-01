local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Script by Swordik | ⚡Tower Defense Simulator", HidePremium = false, IntroText = "Script by Swordik for TDS", SaveConfig = true, IntroEnabled = true, ConfigFolder = "Scripts"})

local Humanoid = game.Players.LocalPlayer.Character.Humanoid
local HumanoidRootPart = game.Players.LocalPlayer.Character.HumanoidRootPart

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

function AutoCommander()
    while _G.AutoCommander == true do
        game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunction"):InvokeServer(unpack(Commander))
        wait(10.5)
    end
end

function WalkSpeed()
	while _G.WalkSpeed do game:GetService("RunService").RenderStepped:wait()
	    Humanoid.WalkSpeed = _G.WalkSpeed
    end
end

function JumpPower()
	while _G.JumpPower do game:GetService("RunService").RenderStepped:wait()
	    Humanoid.JumpPower = _G.JumpPower
    end
end

local Tab = Window:MakeTab({
	Name = "Misc",
	Icon = "rbxassetid://4483362748",
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

Tab:AddToggle({
	Name = "AutoCommander",
	Default = false,
	Callback = function(Value)
		
	end    
})

Tab:AddTextbox({
	Name = "WalkSpeed",
	Default = "",
	TextDisappear = false,
	Callback = function(Value)
		_G.WalkSpeed = Value
		WalkSpeed()
	end
})

Tab:AddTextbox({
	Name = "JumpPower",
	Default = "",
	TextDisappear = false,
	Callback = function(Value)
		_G.JumpPower = Value
		JumpPower()
	end
})

Tab:AddToggle({
	Name = "Anti-AFK",
	Default = false,
	Callback = function(Value)
		if Value == true then
			while not game:IsLoaded() do wait() end
			repeat wait() until game.Players.LocalPlayer.Character
			Players = game:GetService("Players")
			local GC = getconnections or get_signal_cons
			if GC then
				for i,v in pairs(GC(Players.LocalPlayer.Idled)) do
					if v["Disable"] then v["Disable"](v)
					elseif v["Disconnect"] then v["Disconnect"](v)
					end
				end
			else
			Players.LocalPlayer.Idled:Connect(function()
				VirtualUser:CaptureController()
				VirtualUser:ClickButton2(Vector2.new())
  				end)
			end
		end
	end
})
