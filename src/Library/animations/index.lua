local Animator = {};

local mappedAnimations = {};

function Animator:Animate(TYPE, DIRECTION, settings)
    local Animation = mappedAnimations[TYPE];

    if Animation then
        if settings.yield then
            Animation[DIRECTION](self, settings);
        else
            spawn(function() Animation[DIRECTION](self, settings); end);
        end;
    else
        error("No animation found for the name "..TYPE);
    end;
end;

function Animator.Map()
    for _, v in pairs(script.Parent:GetChildren()) do
        if v.Name == "index" then continue end;
        if not v:IsA("ModuleScript") then continue end;

        mappedAnimations[v.Name] = require(v);
    end;
end;

return Animator;