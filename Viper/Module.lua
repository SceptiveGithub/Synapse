local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
_G.Viper = {}

local Id = 1

local function Format(Bytes)
    local Symbol = "B"
    
    if Bytes >= 2^20 then
	    Bytes = math.round(Bytes/2^20*100)/100
	    Symbol = "MB"
	elseif Bytes >= 2^10 then
	    Bytes = math.round(Bytes/2^10*100)/100
	    Symbol = "KB"
	end
	
	return Bytes .. " " .. Symbol
end

function _G.Viper.open()
    local ConsoleHistory = {}
    
    rconsoleclear()
    rconsolename("Viper")
    
    while true do
        rconsoleprint("> ")
        table.insert(ConsoleHistory,"> ")
        
        Command = rconsoleinput()
        table.insert(ConsoleHistory,Command .. "\n")
        Commands = string.split(Command," ")
        
        if Commands[1] == "vip" then
            if Commands[2] == "install" then
                if Commands[3] == "viperbackend" then
                    rconsoleprint("Collecting viperbackend")
                    table.insert(ConsoleHistory,"Collecting viperbackend")
                    
                    local Package = game:HttpGet("https://raw.githubusercontent.com/SceptiveGithub/Synapse/master/Viper/viperbackend.txt",true)
                	local Downloaded = 0
                	
                	rconsoleprint("\n   Downloading viperbackend.txt (" .. Format(#Package) .. ")")
                	table.insert(ConsoleHistory,"\n   Downloading viperbackend.txt (" .. Format(#Package) .. ")")
                	rconsoleprint("\n       |                                 | 0 B 0 B/s\n")
                	
                	if not isfolder("Viper") then
                	    makefolder("Viper")
                	end
                	
                	writefile("Viper/viperbackend.txt","")
                	
                	local Speed
                	local LastFrame = os.clock()
                	while Downloaded < #Package do
                	    RunService.RenderStepped:Wait()
                	    
                	    Speed = (math.clamp(math.noise(os.clock()/100),-1,1) + 1) / 2 * 5000 + 3000
                	    
                	    if Downloaded + Speed > #Package then
                	        Speed = #Package - Downloaded
                	    end
                	    
                	    Downloaded += Speed
                	    
                	    appendfile("Viper/viperbackend.txt",string.sub(Package,Downloaded - Speed + 1, Downloaded))
                	    
                	    local BarLength = math.floor((Downloaded/#Package) * 32)
                	    local Bar = string.rep("#",BarLength)
                	    local Space = string.rep(" ",32 - BarLength)
                	    
                	    rconsoleclear()
                	    for i,Line in ipairs(ConsoleHistory) do
                	        rconsoleprint(Line)
                	    end
                	    rconsoleprint("\n       |" .. Bar .. "" .. Space .."| ".. Format(Downloaded) .. " " .. Format(Speed) .. "/s eta " .. math.abs(math.round((#Package - Downloaded) / (Speed / (os.clock() - LastFrame)))) .. "s\n")
                	    
                	    LastFrame = os.clock()
                	end
                	
                    local BarLength = math.floor((Downloaded/#Package) * 32)
            	    local Bar = string.rep("#",BarLength)
            	    local Space = string.rep(" ",32 - BarLength)
                	
                	rconsoleclear()
                	for i,Line in ipairs(ConsoleHistory) do
            	        rconsoleprint(Line)
            	    end
                	rconsoleprint("\n       |" .. Bar .. "" .. Space .."| ".. Format(Downloaded) .. " " .. Format(Speed) .. "/s\nSuccessfully installed viperbackend\n")
                	table.insert(ConsoleHistory,"\n       |" .. Bar .. "" .. Space .."| ".. Format(Downloaded) .. " " .. Format(Speed) .. "/s\nSuccessfully installed viperbackend\n")
                else
                    rconsoleprint("Package " .. Commands[3] .. " not recognized\n")
                    table.insert(ConsoleHistory,"Package " .. Commands[3] .. " not recognized\n")
                end
            else
                rconsoleprint("Command " .. Commands[2] .. " not recognized\n")
                table.insert(ConsoleHistory,"Command " .. Commands[2] .. " not recognized\n")
            end
        else
            rconsoleprint("Command " .. Commands[1] .. " not recognized\n")
            table.insert(ConsoleHistory,"Command " .. Commands[1] .. " not recognized\n")
        end
    end
end

function _G.Viper.execute(Code,Debug)
    if type(Code) == "string" then
        if not isfolder("Viper") then
            makefolder("Viper")
        end
        
        Connections = readfile("Viper/connection.json")
        Parsed = HttpService:JSONDecode(Connections)
        
        local RequestId = Id
        Id += 1
        
        table.insert(Parsed.Viper,{
            ["Code"] = Code,
            ["Debug"] = Debug,
            ["Id"] = RequestId
        })
        
        writefile("Viper/connection.json",HttpService:JSONEncode(Parsed))
        
        if Debug then
            while RunService.RenderStepped:Wait() do
                Connections = readfile("Viper/connection.json")
                if #Connections > 0 then
                    Parsed = HttpService:JSONDecode(Connections)
                    local Result = Parsed.Python[tostring(RequestId)]
                
                    if Result then
                        Parsed.Python[tostring(RequestId)] = nil
                        writefile("Viper/connection.json",HttpService:JSONEncode(Parsed))
                        
                        return Result
                    end
                end
            end
        end
    else
        error("Code must be a string")
    end
end
