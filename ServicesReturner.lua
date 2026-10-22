return{
	["Players"] = game:GetService("Players");
	["Lighting"] = game:GetService("Lighting");
	["MaterialService"] = game:GetService("MaterialService");
	["NetworkClient"] = game:GetService("NetworkClient");
	["ReplicatedStorage"] = game:GetService("ReplicatedStorage");
	["ReplicatedFirst"] = game:GetService("ReplicatedFirst");
	["ServerScriptService"] = (function(): ServerScriptService | string
		if(game:GetService("RunService"):IsStudio() or game:GetService("RunService"):IsServer()) then
			return game:GetService("ServerScriptService") :: ServerScriptService
		elseif(game:GetService("RunService"):IsClient()) then
			return "ServerScriptService" :: string end end)();
	["ServerStorage"] = (function(): ServerStorage | string
		if(game:GetService("RunService"):IsStudio() or game:GetService("RunService"):IsServer()) then
			return game:GetService("ServerStorage") :: ServerScriptService
		elseif(game:GetService("RunService"):IsClient()) then
			return "ServerStorage" :: string end end)();
	["StarterGui"] = game:GetService("StarterGui");
	["StarterPack"] = game:GetService("StarterPack");
	["StarterPlayer"] = {
		["__self"] = game:GetService("StarterPlayer");
		["StarterCharacterScripts"] = game:GetService("StarterPlayer"):WaitForChild("StarterCharacterScripts");
		["StarterPlayerScripts"] = game:GetService("StarterPlayer"):WaitForChild("StarterPlayerScripts");};
	["SoundService"] = game:GetService("SoundService");
	["TextChatService"] = game:GetService("TextChatService");
	["VoiceChatService"] = (function(Needed: boolean): VoiceChatService | nil
		if Needed == true then
			return game:GetService("VoiceChatService")
		elseif Needed == false then
			return "VoiceChatService" end end)();
	["RunService"] = game:GetService("RunService");
	["UserInputService"] = game:GetService("UserInputService");
	["UserService"] = game:GetService("UserService");
	["MessagingService"] = game:GetService("MessagingService");
	["DataStoreService"] = game:GetService("DataStoreService");
	["TweenService"] = game:GetService("TweenService");
	["Debris"] = game:GetService("Debris");}
