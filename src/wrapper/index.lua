local Src = script:FindFirstAncestor("src");
local class = require(Src.internal.class);

local Library = require(Src.Library.index);
local Components = script.Parent.components;

local fs = require(Components.fs);

local wrappie = {};

local wrapper = class.new()
    :implement(Library.Animator)
    :implement(Library.Executor)
    :implement(fs);

-- Wrap an Instance with the Mediterranean API.
function wrappie.wrap(instance)
    return wrapper:setmetamethod("__index", function(self, k)
        return rawget(self, k) or self:FindFirstChild(k) or instance[k];
    end)({ instance = instance });
end;

return wrappie;