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
    time = tonumber(readfile("Python/Latest.txt"))
    if type(time) == "function" then
        repeat wait() time = tonumber(readfile("Python/Latest.txt")) until type(time) == "number"
    end
    if os.time()-.1 < time and os.time()+1 > time then
        return true
    else
        return false
    end
end
function Python.Version(Compare,Comparison)
    if Compare then
        loadfile("Python/Installation.txt")()
        local Current = Version
        local pos1,pos2 = 0,0
        repeat
            local pos = string.find(Current,".",pos1)
            num1 = string.sub(Current,pos1,pos)
            pos1 = pos+1
            local pos = string.find(Comparison,".",pos2)
            num2 = string.sub(Comparison,pos2,pos)
            pos2 = pos+1
            wait()
        until num1 ~= num2 or not string.find(Current,".",pos1)
        if num1 > num2 then
            return true
        elseif num1 < num2 then
            return false
        else
            return true
        end
    end
end
function Python.Run(code,expectreturn)
    writefile("Python/Medium.txt","#\n"..code)
    if expectreturn then
        repeat wait() until readfile("Python/Medium.txt") ~= code
        return readfile("Python/Medium.txt")
    end
end
