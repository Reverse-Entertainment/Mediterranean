local Typewriter = {};

local RunService = game:GetService("RunService")

function Typewriter.In(instance, settings)
    instance = instance.instance;
    if not instance then return error("You somehow magically forgot an instance, this is an issue and it should be reported on the github.") end;

    local easing = settings and settings.easing;

    local graphemes = 0;

    local text = settings.Text or instance.Text;
    instance.Text = text;
    instance.MaxVisibleGraphemes = 0;

    for _ in utf8.graphemes(text) do
        graphemes += 1;
    end;

    for i = 0, 1, (1 / (settings.frames or 30)) do
        instance.MaxVisibleGraphemes = math.ceil((1 - (easing and easing(i) or i)) * graphemes);

        RunService.RenderStepped:Wait();
    end;
end;

function Typewriter.Out(instance, settings)
    instance = instance.instance;
    if not instance then return error("You somehow magically forgot an instance, this is an issue and it should be reported on the github.") end;

    local easing = settings and settings.easing;

    local graphemes = 0;

    instance.MaxVisibleGraphemes = -1; -- To be safe.

    for _ in utf8.graphemes(instance.Text) do
        graphemes += 1;
    end;

    for i = 0, 1, (1 / (settings.frames or 30)) do
        instance.MaxVisibleGraphemes = math.ceil((easing and easing(i) or i) * graphemes);

        RunService.RenderStepped:Wait();
    end;
end;

return Typewriter;