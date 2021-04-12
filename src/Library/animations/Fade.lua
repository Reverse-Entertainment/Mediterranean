local Fade = {};

local RunService = game:GetService("RunService")

function GetTransparencyProperty(instance)
    if instance:IsA("TextLabel") or instance:IsA("TextButton") then
        return "TextTransparency";
    elseif instance:IsA("ImageLabel") or instance:IsA("ImageButton") then
        return "ImageTransparency";
    elseif instance:IsA("Frame") then
        return "BackgroundTransparency";
    else
        return "Transparency";
    end;
end;

function Fade.In(instance, settings)
    instance = instance.instance;
    if not instance then return error("You somehow magically forgot an instance, this is an issue and it should be reported on the github.") end;

    local easing = settings and settings.easing;

    local t = GetTransparencyProperty(instance);

    for i = 0, 1, (1 / (settings.frames or 30)) do
        instance[t] = 1 - (easing and easing(i) or i);

        RunService.RenderStepped:Wait();
    end;
end;

function Fade.Out(instance, settings)
    instance = instance.instance;
    if not instance then return error("You somehow magically forgot an instance, this is an issue and it should be reported on the github.") end;

    local easing = settings and settings.easing;

    local t = GetTransparencyProperty(instance);

    for i = 0, 1, (1 / (settings.frames or 30)) do
        instance[t] = easing and easing(i) or i;

        RunService.RenderStepped:Wait();
    end;
end;

return Fade;