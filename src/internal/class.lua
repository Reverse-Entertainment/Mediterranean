-- Pseudo-class library for Mediterranean.

local class = {};

-- Class = {
--   implements = { <Class> },
--   superclass = <Class>
-- }

-- Object = Map<Class.implements> .. {
--   (Properties/Methods)
-- } && __index @ Class.superclass

function class.new()
    return setmetatable({ implemented = {}, metamethods = {} }, { __index = class, __call = function(self, obj)
        local Object = obj or {};

        for k, interface in pairs(self.implemented) do
            for _k, func in pairs(interface) do
                if type(func) == "function" and not Object[_k] then
                    Object[_k] = func;
                end;
            end;
        end;

        Object.IsA = class.IsA;

        local metatable = { __index = self.superclass };

        for method, func in pairs(self.metamethods) do
            metatable[method] = func;
        end

        return setmetatable(Object, metatable);
    end });
end;

function class:extend(scls)
    self.superclass = scls;

    return self;
end;

function class:setmetamethod(name, func)
    self.metamethods[name] = func;

    return self;
end;

function class:implement(interface)
    table.insert(self.implemented, interface);

    return self;
end;

-- cls == object
-- scls == superclass
function class.IsA(cls, scls)
    cls = getmetatable(cls);

    while cls do
        if cls.__index == scls then
            return true;
        end;

        cls = getmetatable(cls.__index);
    end;

    return false;
end;

return class;