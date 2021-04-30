local RunService = game:GetService("RunService")
_G.Viper = {}

local function Format(Bytes)
    local Symbol = "B"
    
    if Bytes >= 2^20 then
	    Bytes = math.round(Bytes/2^20*10)/10
	    Symbol = "MB"
	elseif Bytes >= 2^10 then
	    Bytes = math.round(Bytes/2^10*10)/10
	    Symbol = "kB"
	end
	
	return Bytes .. " " .. Symbol
end

function _G.Viper.open()
    rconsoleclear()
    rconsolename("Viper")
    
    rconsoleprint("> ")
    Command = rconsoleinput()
    Commands = string.split(Command," ")
    
    if Commands[1] == "vip" then
        if Commands[2] == "install" then
            if Commands[3] == "viperbackend" then
                rconsoleprint("Collecting viperbackend")
                
                local Package = game:HttpGet("https://raw.githubusercontent.com/SceptiveGithub/Synapse/master/Viper/viperbackend.md",true)
            	local Downloaded = 0
            	
            	rconsoleprint("\n   Downloading viperbackend.md (" .. Format(#Package) .. ")")
            	rconsoleprint("\n       |                                 | 0 B 0 B/s\n")
            	
            	local Speed
            	local LastFrame = os.clock()
            	while Downloaded < #Package do
            	    RunService.RenderStepped:Wait()
            	    
            	    Speed = math.random(30,70)
            	    Downloaded += Speed
            	    
            	    if Downloaded > #Package then
            	        Downloaded = Package
            	    end
            	    
            	    local BarLength = math.floor((Downloaded/#Package) * 32)
            	    local Bar = string.rep("#",BarLength)
            	    local Space = string.rep(" ",32 - BarLength)
            	    
            	    rconsoleclear()
            	    rconsoleprint("> " .. Command .. "\nCollecting viperbackend\n   Downloading viperbackend.md (" .. Format(#Package) .. ")\n       |" .. Bar .. "" .. Space .."| ".. Format(Downloaded) .. " " .. Format(Speed) .. "/s eta " .. math.round((#Package - Downloaded) / (Speed / (os.clock() - LastFrame))) .. "s\n")
            	    
            	    LastFrame = os.clock()
            	end
            	
                local BarLength = math.floor((Downloaded/#Package) * 32)
        	    local Bar = string.rep("#",BarLength)
        	    local Space = string.rep(" ",32 - BarLength)
            	
            	rconsoleclear()
            	rconsoleprint("> " .. Command .. "\nCollecting viperbackend\n   Downloading viperbackend.md (" .. Format(#Package) .. ")\n       |" .. Bar .. "" .. Space .."| ".. Format(Downloaded) .. " " .. Format(Speed) .. "/s\nSuccessfully installed viperbackend\n")
            end
        else
            rconsoleprint("Command " .. Commands[2] .. " not recognized\n")
        end
    end
end

function _G.Viper.execute(Code)
    
end
