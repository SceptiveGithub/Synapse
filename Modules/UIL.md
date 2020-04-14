if game.Workspace:FindFirstChild("Synapse Modules") then
    game.Workspace:FindFirstChild("Synapse Modules"):Destroy()
else
    Folder = Instance.new("Folder")
    Folder.Name = "Synapse Modules"
    Folder.Parent = game.Workspace
end
UIL = Instance.new("ModuleScript")
UIL.Parent = Folder

UIL.goto() = function(element)
    print("went to"..element)
end
