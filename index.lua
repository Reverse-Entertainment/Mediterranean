local Mediterranean = setmetatable({}, { __call = function(self, instance)
    return self.wrapper.wrap(instance);
end });

local Source = script.Parent.src;

local rDep = require(script.Parent.Packages.rdep.index);
rDep.configure(script.Parent);
Mediterranean.dependencies = rDep;

for _, module in pairs(script.Parent:GetDescendants()) do
    if module ~= script and module:IsA("ModuleScript") then
        local mod = require(module);

        if typeof(mod) == "table" then
            mod.Mediterranean = Mediterranean;
        end;
    end;
end;

Mediterranean.animator = rDep.load('src/Library/animations/index');
Mediterranean.wrapper = rDep.load('src/wrapper/index');

Mediterranean.internal = rDep.load({
    class = 'src/internal/class';
    queue = 'src/internal/queue/handler';
    library = 'src/Library';
});

-- Perform necessary initializations:
Mediterranean.animator:Map(); -- Map the animations to internal storage.

return Mediterranean;