-- File System adapter for the Mediterranean wrapper.

local fs = {};

function fs.fromInstance(instance)
    if not instance or not instance.IsA then return error("No instance provided for File System construction.") end;

    return setmetatable({ instance }, { __index = fs });
end;

function fs:FindFirstChildOfClass(class)
    for _, instance in pairs(self.instance:GetChildren()) do
        if instance:IsA(class) then
            return instance;
        end;
    end;

    return nil;
end;

function fs:FindFirstChild(childName)
    local child = self.instance:FindFirstChild(childName);
    return child and fs.Mediterranean.wrapper.wrap(child) or nil;
end;

function fs:WaitForChild(childName)
    local child = self.instance:WaitForChild(childName);
    return child and fs.Mediterranean.wrapper.wrap(child) or nil;
end;

function fs:GetChildrenOfClass(class)
    local children = {};
    for _, instance in pairs(self.instance:GetChildren()) do
        if instance:IsA(class) then
            table.insert(children, instance);
        end;
    end;

    -- Return nil if no children to facilitate if statements.
    if #children > 0 then
        return children;
    end;
end;

return fs;