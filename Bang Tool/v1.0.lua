local function Create_Instance(className: string, ...: Instance)
	local newInstance = Instance.new(className, ...)
	return function(propertyTable: {[string]: any})
		if(propertyTable) then
			for property, Value in pairs(propertyTable) do
				newInstance[property] = Value
			end; return newInstance
		else return newInstance end
	end
end
local BangTool: Tool = Create_Instance("Tool", game.Players.LocalPlayer.Backpack){
	["ToolTip"] = "Wanna bang ur friends!? Do it wit dis xD!",
	["Name"] = "Bang Tool",
	["TextureId"] = game:GetService("Players"):GetUserThumbnailAsync(game.Players.LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420),
	["RequiresHandle"] = false}
local BangAnimation: Animation = Create_Instance("Animation", nil){
	["Name"] = "Bang Animation",
	["AnimationId"] = "rbxassetid://86745448648267"}
local AnimationTrack = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):FindFirstChildOfClass("Animator"):LoadAnimation(BangAnimation)
AnimationTrack.Priority = Enum.AnimationPriority.Idle
AnimationTrack.Looped = true; BangTool.Equipped:Connect(function()
	for _, anim in game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):FindFirstChildOfClass("Animator"):GetPlayingAnimationTracks() do
		anim:Stop()
	end
	game.Players.LocalPlayer.Character:FindFirstChild("Animate").Disabled = true
	AnimationTrack:Play(0, 100, 20)
end); BangTool.Unequipped:Connect(function()
	AnimationTrack:Stop()
	game.Players.LocalPlayer.Character:FindFirstChild("Animate").Disabled = false
end)
