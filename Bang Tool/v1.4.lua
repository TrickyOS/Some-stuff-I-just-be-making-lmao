--[[

	--->>> Credits: @Camp_Hero on Roblox / @dredimon on Discord | getRoot, Torso functions ripped from Infinite Yield
	|||
	-->>> Up and Coming: UI Soon or whatever, gonna try to make it available for all devices and genuinely fits lmao
	|||
	--->>> Version: v1.4
	|||
	--->>> Release: July 19th, 2026 / 07/19/26
	|||
	--->>> If u can't understand the code then it's okay just vibecode or re-format it cuz it's in my programming style xd
	|||
	--->>> NO I DIDN'T USE AI
	|||
	--->>> Chat Commands (soon being removed): .changeuser <Player_Name: string> | .prefix <newPrefix: string>

--]]
local CurrentPlayer = nil
local bangOffset = CFrame.new(0, -0.8, 1.1)
local prefix = "."
local function GetPlayers():() --Gets the players (unused for right now)
	for _, Player in game.Players:GetPlayers() do
		if Player ~= game.Players.LocalPlayer then
			return Player end end
end
function getRoot(Character: Model) --Gets the rootpart of a char
	if Character and Character:FindFirstChildOfClass("Humanoid") then
		return Character:FindFirstChildOfClass("Humanoid").RootPart else return nil end
end
function getTorso(x: Model): Part
	x = x or game.Players.LocalPlayer.Character; return x:FindFirstChild("Torso") or x:FindFirstChild("UpperTorso") or x:FindFirstChild("LowerTorso") or x:FindFirstChild("HumanoidRootPart")
end
local function Create_Instance(className: string, ...: Instance): Instance --Creates a new instance
	local newInstance = Instance.new(className, ...)
	return function(propertyTable: {[string]: any})
		if(propertyTable) then
			for property, Value in pairs(propertyTable) do
				newInstance[property] = Value
			end; return newInstance
		else return newInstance end end
end
local BangTool: Tool = Create_Instance("Tool", game.Players.LocalPlayer.Backpack){
	["ToolTip"] = "Wanna bang ur friends!? Do it wit dis xD!",
	["Name"] = "Bang Tool",
	["TextureId"] = game:GetService("Players"):GetUserThumbnailAsync(game.Players.LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420),
	["RequiresHandle"] = false}
local BangAnimation: Animation = Create_Instance("Animation", nil){
	["Name"] = "Bang Animation",
	["AnimationId"] = "rbxassetid://86745448648267"}
local AnimationTrack = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):FindFirstChildOfClass("Animator"):LoadAnimation(BangAnimation); AnimationTrack.Priority = Enum.AnimationPriority.Idle; AnimationTrack.Looped = true; game.Players.LocalPlayer.Chatted:Connect(function(Message)
	local split = string.split(Message, " ")
	if(split[1] == prefix .. "ChangeUser" or split[1] == prefix .. "changeuser") then
		CurrentPlayer = split[2]; game.StarterGui:SetCore("SendNotification", {
			["Title"] = "Player Changed!",
			["Text"] = "Current Player was set to " .. CurrentPlayer .. "!",
			["Duration"] = 5})
	elseif(split[1] == prefix .. "prefix") then
		prefix = split[2]; game.StarterGui:SetCore("SendNotification", {
			["Title"] = "prefix Changed!",
			["Text"] = "prefix was set to " .. prefix .. "!",
			["Duration"] = 5})
	end
end)
BangTool.Equipped:Connect(function()
	for _, anim in game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):FindFirstChildOfClass("Animator"):GetPlayingAnimationTracks() do
		anim:Stop()
	end
	game.Players.LocalPlayer.Character:FindFirstChild("Animate").Disabled = true
	AnimationTrack:Play(0, 100, 20)
	bangLoop = game.RunService.Heartbeat:Connect(function()
		pcall(function()
			local otherRoot = getTorso(game.Players[CurrentPlayer].Character)
			getRoot(game.Players.LocalPlayer.Character).CFrame = otherRoot.CFrame * bangOffset
		end)
	end)
end); BangTool.Unequipped:Connect(function()
	AnimationTrack:Stop(); bangLoop:Disconnect(); bangLoop = nil; game.Players.LocalPlayer.Character:FindFirstChild("Animate").Disabled = false
end)
