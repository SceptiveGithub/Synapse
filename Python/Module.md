if game.Workspace:FindFirstChild("2462459471") then
    game.Workspace:FindFirstChild("2462459471"):Destroy()
end
if game.Players.LocalPlayer.PlayerScripts.ChatScript.ChatMain:FindFirstChild("ObjectPool") then
    Python = game.Players.LocalPlayer.PlayerScripts.ChatScript.ChatMain:FindFirstChild("ObjectPool"):Clone()
    Python.Name,Python.Parent = "2462459471",game.Workspace
else
    warn("Couldn't grab core module")
end

Python = require(Python)
local Player = game.Players.LocalPlayer
function Python.Ping()
    local Ping = tick()
    writefile("Python/Medium.txt","Ping")
    repeat wait() until readfile("Python/Medium.txt") == "Pong"
    local Pong = tick()
    return Pong-Ping
end
function Python.Run(code,expectreturn)
    writefile("Python/Medium.txt",code)
    print(expectreturn)
    if expectreturn then
        repeat 
        wait()
        print(readfile("Python/Medium.txt"),code)
        until readfile("Python/Medium.txt") ~= code
        return readfile("Python/Medium.txt")
    end
end
