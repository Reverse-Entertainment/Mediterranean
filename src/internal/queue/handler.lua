local QueueHandler = {};

local QueueInterpreter;

function QueueHandler.run(map, metadata, ...)
    if not QueueInterpreter then
        QueueInterpreter = QueueHandler.Mediterranean.dependencies.load('src/internal/queue/interpreter');
    end;

    if not metadata then error("Mediterranean Encountered an Internal Problem, please re-join.") end;

    local actions = {...};

    for i, action in pairs(actions) do
        local func, async, params = QueueInterpreter.interpret(map, action, metadata);

        if func then
            if async then func(table.unpack(params)) else spawn(function() func(table.unpack(params)); end) end;
        end;
    end;
end;

return QueueHandler;