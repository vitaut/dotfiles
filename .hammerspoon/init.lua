spaces = require("hs._asm.undocumented.spaces")

local chrome = "Google Chrome"

-- TODO: create a grid layout: Atom to the left, console to the right when
--       external monitor is connected
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "P", function()
    local outlook = "Microsoft Outlook"
    for _, app in pairs({chrome, outlook}) do
        hs.application.launchOrFocus(app)
    end
    local dellMonitor = "DELL U3014"
    local windowLayout = {
        {outlook, nil, dellMonitor, hs.layout.left50,  nil, nil},
        {chrome,  nil, dellMonitor, hs.layout.right50, nil, nil},
    }
    hs.layout.apply(windowLayout)
end)

-- Automatically reload config when the config file changes.
function reloadConfig(files)
    doReload = false
    for _, file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end
local myWatcher = hs.pathwatcher.new(
    os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")

-- Override paste blocking
hs.hotkey.bind({"cmd", "alt"}, "V",
    function() hs.eventtap.keyStrokes(hs.pasteboard.getContents()) end)

-- Facebook bunny search
hs.hotkey.bind({"cmd"}, "I", function()
    hs.application.launchOrFocus(chrome)
    hs.eventtap.keyStroke({"cmd"}, "L")
    hs.eventtap.keyStrokes("b ")
end)
