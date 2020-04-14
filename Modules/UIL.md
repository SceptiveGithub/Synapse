if game.Workspace:FindFirstChild("Synapse Modules") then
    game.Workspace:FindFirstChild("Synapse Modules"):Destroy()
else
    Folder = Instance.new("Folder")
    Folder.Name = "Synapse Modules"
    Folder.Parent = game.Workspace
end
UIL = Instance.new("ModuleScript")
UIL.Parent = Folder

function windowsize(xy)
    if game.Workspace:FindFirstChild("Camera") then
        if xy == "x" or xy == "X" then
            return(game.Workspace.Camera.ViewportSize.X)
        elseif xy == "y" or xy == "Y" then
            return(game.Workspace.Camera.ViewportSize.Y)
        else
            return(game.Workspace.Camera.ViewportSize)
        end
    end
end
