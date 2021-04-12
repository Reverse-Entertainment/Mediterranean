local dependencies = {};

local fake_fs = require(script.Parent.Packages.fake_fs.index);

function dependencies.configure(root)
    dependencies.root = root;
end;

function dependencies.load(tab)
    if typeof(tab) == "table" then
        local tree = {};

        for i, dependency in pairs(tab) do
            if typeof(dependency) == "table" then
                tree[i] = dependencies.load(dependency);
            else
                local found = fake_fs.interpret(dependencies.root or game, dependency);

                if found then
                    tree[i] =
                        found:IsA("ModuleScript") and require(found) or
                        found:IsA("Model") and found:FindFirstChild("index") and
                        require(found.index) or found;
                end;
            end;
        end;

        return tree;
    else
        local found = fake_fs.interpret(dependencies.root or game, tab);

        return found:IsA("ModuleScript") and require(found) or
            found:IsA("Model") and found:FindFirstChild("index") and
            require(found.index) or found;
    end;
end;

return dependencies;