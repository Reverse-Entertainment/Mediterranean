local interpreter = {};

function interpreter.getSubject(queueElement, metadata)
    local subject = queueElement.Subject or metadata.Subject;

    if typeof(subject) == "string" then
        if subject == "SELF" then
            return metadata.Subject;
        elseif subject == "PLAYER" then
            return game.Players.LocalPlayer or error("No Player Found. No Subject Found.");
        end;
    else
        return subject;
    end;
end;

function interpreter.interpret(parent, queueElement, metadata)
    assert(queueElement.Action ~= nil, "No Action Found.");
    assert(not metadata.Subject and not queueElement.Subject, "No Subject Found.");

    local func = parent[queueElement.Action][queueElement.Direction or "execute"];
    local async = queueElement.Yield ~= nil and queueElement.Yield or true;
    local params = {};

    -- Cleanse of common operators.
    queueElement.Yield = nil;
    queueElement.Action = nil;
    queueElement.Direction = nil;
    
    params[1] = interpreter.getSubject(queueElement, metadata);
end;

return interpreter;