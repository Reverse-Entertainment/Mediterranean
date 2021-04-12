local Executor = {};

local mappedActions = {};

function Executor:RunActions(...)
    Executor.Mediterranean.queue.run(mappedActions, ...);
end;

function Executor.Map()
    for _, v in pairs(script.Parent:GetChildren()) do
        if v.Name == "index" then continue end;
        if not v:IsA("ModuleScript") then continue end;

        mappedActions[v.Name] = require(v);
    end;
end;

return Executor;