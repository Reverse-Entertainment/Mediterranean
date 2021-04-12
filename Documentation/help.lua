-- Extract ENUMs as an optimization:

-- Abstract file structure:
-- PlayerGui
-- -> ScreenGui
-- -> -> MainFrame
-- -> -> -> DisclaimerText
-- -> -> -> DisclaimerIcon
-- -> -> BackgroundFrame

-- local PlayerGui = game.Players.LocalPlayer.PlayerGui;

-- local ScreenGui = "x"(PlayerGui.ScreenGui, "MainWorker");

-- local Connection = ScreenGui.CloseButton:Hide():OnClick({
--     ACTION = Enums.ACTIONS.Disable;
--     SUBJECT = Enums.SUBJECTS.Connection;
-- }, {
--     ACTION = Enums.ANIMATIONS.Press;
--     DIRECTION = Enums.DIRECTIONS.In;
--     SUBJECT = Enums.SUBJECTS.Self;
-- }, {
--     ACTION = Enums.ANIMATIONS.Press;
--     DIRECTION = Enums.DIRECTIONS.Out;
--     SUBJECT = Enums.SUBJECTS.Self;
-- }, {
--     ACTION = Enums.TOGGLES.Enabled;
--     SUBJECT = "MainWorker";
-- }, {
--     ACTION = Enums.ACTIONS.Enable;
--     SUBJECT = Enums.SUBJECTS.Connection;
-- });

-- ScreenGui.CloseButton:RunActions({
--     ACTION = Enums.ACTIONS.Show;
-- }, {
--     ACTION = Enums.ANIMATIONS.Fade;
--     SETTINGS = {
--         frames = 20
--     };
-- });

-- ScreenGui.bakeSetup(0);

return "this is a documentation file what are you doing?!";