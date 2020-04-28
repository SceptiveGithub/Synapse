if game.Workspace:FindFirstChild("1948899364") then
    game.Workspace:FindFirstChild("1948899364"):Destroy()
end
if game.Players.LocalPlayer.PlayerScripts.ChatScript.ChatMain:FindFirstChild("ObjectPool") then
    Python = game.Players.LocalPlayer.PlayerScripts.ChatScript.ChatMain:FindFirstChild("ObjectPool"):Clone()
    Python.Name,Python.Parent = "1948899364",workspace
else
    warn("Couldn't grab core module")
end
pcall(function()
    Module = require(Module)
    local Player = game.Players.LocalPlayer
    function Python.Ping()
        local Ping = tick()
        writefile("Python/Medium.txt","Ping")
        repeat wait() until readfile("Python/Medium.txt") == "Pong"
        local Pong = tick()
        return Pong-Ping
    end
    function UIL.firebutton(object)
        local Visible = object.Visible
        local mX,mY = Mouse.X,Mouse.Y
        object.Visible = true
        mousemoveabs(object.AbsolutePosition.X+object.AbsoluteSize.X/2,object.AbsolutePosition.Y+object.AbsoluteSize.Y/2)
        object.Visible = Visible
        mousemoveabs(mX,mY)
    end
end)
