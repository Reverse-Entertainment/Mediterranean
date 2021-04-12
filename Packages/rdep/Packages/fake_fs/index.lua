local fake_fs = {};

function fake_fs.interpret(root, path)
    local curr = root;

    local splitPath = path:split("");

    local currentKey = "";
    for _, character in pairs(splitPath) do
        if not curr then return error("Fake_Fs: No Module Found at path.") end;

        if (character == "/" or character == "\\") and _ == 1 then
            curr = game;
        elseif character == "/" or character == "\\" or _ == #splitPath then
            if currentKey == ".." then
                curr = curr.Parent;
            elseif currentKey == "." then
                curr = curr;
            else
                curr = curr:FindFirstChild(currentKey);
            end;

            currentKey = "";
        else
            currentKey ..= character;
        end;
    end;

    return curr;
end;

return fake_fs;