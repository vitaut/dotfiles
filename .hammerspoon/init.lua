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

-- VPN connect/disconnect dialog
local chooser = nil
local vpn = "/opt/cisco/anyconnect/bin/vpn"

function vpn_connected()
  output = hs.execute(vpn .. " status")
  return string.find(output, "state: Connected")
end

local connect = "Connect VPN"
function resetChooser()
  local text = connect
  if vpn_connected() then
    text = "Disconnect VPN"
  end
  chooser:choices({{index=1, text=text}})
  chooser:query("")
end

chooser = hs.chooser.new(function (selection)
  if not selection then
    return
  end
  if selection.text == connect then
    output = hs.execute(
        "echo " .. chooser:query() .. " | " ..
        vpn .. " -s connect \"Americas West\"")
    state = "Connected"
    if not string.find(output, "state: Connected") then
      state = "Connection failed"
    end
    hs.alert.show(state)
  else
    output = hs.execute(vpn .. " disconnect")
    state = "Disconnected"
    if not string.find(output, "state: Disconnected") then
      state = "Disconnection failed"
    end
    hs.alert.show(state)
  end
  resetChooser()
end)
chooser:rows(1)
chooser:queryChangedCallback(function() end)
resetChooser()
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "V", function()
  chooser:show()
end)
