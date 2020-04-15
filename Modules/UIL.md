if game.Workspace:FindFirstChild("Synapse Modules") then
    game.Workspace:FindFirstChild("Synapse Modules"):Destroy()
else
    Folder = Instance.new("Folder")
    Folder.Name,Folder.Parent = "Synapse Modules",game.Workspace
end
if game.Players.LocalPlayer.PlayerScripts.ChatScript.ChatMain:FindFirstChild("ObjectPool") then
    UIL = game.Players.LocalPlayer.PlayerScripts.ChatScript.ChatMain:FindFirstChild("ObjectPool"):Clone()
    UIL.Name,UIL.Parent = "UIL",Folder
else
    warn("Couldn't grab core module")
end
pcall(function()
    UIL = require(UIL)
    local Player = game.Players.LocalPlayer
    local Mouse = Player:GetMouse()
    function UIL.goto(object)
        mousemoveabs(object.AbsolutePosition.X+object.AbsoluteSize.X/2,object.AbsolutePosition.Y+object.AbsoluteSize.Y/2)
    end
    function UIL.firebutton(object)
        local Visible = object.Visible
        local Position = UDim2.new(Mouse.X,Mouse.Y)
        object.Visible = true
        mousemoveabs(object.AbsolutePosition.X+object.AbsoluteSize.X/2,object.AbsolutePosition.Y+object.AbsoluteSize.Y/2)
        object.Visible = Visible
        mousemoveabs(Position)
    end
end)
