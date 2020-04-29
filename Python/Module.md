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
function Python.Running()
    last = tonumber(readfile("Python/Latest.txt"))
    time = tick()+(tick()-os.time()+1800)-(tick()-os.time()+1800)%3600
    if time-.1 < last and time+.1 > last then
        return true
    else
        return false
    end
end
function Python.Run(code,expectreturn)
    writefile("Python/Medium.txt","#\n"..code)
    if expectreturn then
        repeat wait() until readfile("Python/Medium.txt") ~= code
        return readfile("Python/Medium.txt")
    end
end
