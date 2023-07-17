
----------------------------------------------------------------------------
---- Path Watcher that restarts every time there is a save to this file ----
hammerWatch = hs.pathwatcher.new(os.getenv('HOME') .. '/.hammerspoon/', hs.reload):start()

--hs.application.enableSpotlightForNameSearches(true)

function getNumberOfScreens()
    local count = 0
    for i in pairs(hs.screen.allScreens()) do
      count = count + 1
    end

    return count
end

-- Change array pos to get screen names
--hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
--    hs.alert.show(hs.screen.allScreens()[3]:name())
--end)

hs.grid.setGrid('8x8').setMargins('0x0')
hs.grid.ui.textSize = 100

hs.hotkey.bind({'ctrl'}, 'm', function()
  hs.grid.show()
  --hs.grid.snap(hs.window.focusedWindow())
end)


------------------------------------------------------------------------------------------------------------------------
---- Zach's layout for all basic apps 
------------------------------------------------------------------------------------------------------------------------
hs.hotkey.bind({"alt", "ctrl"}, "0", function()
    local laptopScreen = "Built-in Retina Display"
    local centerScreen = "LEN P27h-10 (2)"
    local rightScreen = "LEN P27h-10 (1)" 
    local apps = {"Spotify", "Franz", "Google Chrome", "Obsidian"}
    --for a=1, 4 do
    for k,v in pairs(apps) do
        hs.application.open(v)
    end
    local windowLayout = {
        {"Spotify",  nil, laptopScreen, {0, 0.35, 0.5, 0.5}, nil, nil},
        {"Franz",  nil,   laptopScreen, hs.layout.right70, nil, nil},
        {"Google Chrome", nil, centerScreen, hs.layout.left50, nil, nil},
        --{"Code", nil, centerScreen, hs.layout.right50, nil, nil},
        --{"iTerm2", nil, rightScreen, hs.layout.left30, nil, nil},
        {"Obsidian", nil, rightScreen, {0.25, 0.25, 0.5, 0.5}, nil, nil}
    }
    hs.layout.apply(windowLayout)
end)

------------------------------------------------------------------------------------------------------------------------
---- Application Window Resizing Macros - All dealing with the current window
------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------
-- 1/2 screen on left side --
--hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Left", function()
hs.hotkey.bind({"alt", "ctrl"}, "1", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()
    f.x = max.x
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end)
  
------------------------------------------------------------
-- 1/3 screen on left side --
hs.hotkey.bind({"alt", "ctrl"}, "2", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()
    f.x = max.x
    f.y = max.y
    f.w = max.w / 3
    f.h = max.h
    win:setFrame(f)
end)

--------------------------------------------------------------
-- 1/3 screen on middle side --
hs.hotkey.bind({"alt", "ctrl"}, "3", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()
    f.x = max.x + (max.w / 3)
    f.y = max.y
    f.w = max.w / 3
    f.h = max.h
    win:setFrame(f)
end)

-------------------------------------------------------------
-- 1/3 screen on right side --
hs.hotkey.bind({"alt", "ctrl"}, "4", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()
    f.x = max.x + (2 * (max.w / 3))
    f.y = max.y
    f.w = max.w / 3
    f.h = max.h
    win:setFrame(f)
end)

-------------------------------------------------------------
-- 1/2 screen on right side --
--hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Right", function()
hs.hotkey.bind({"alt", "ctrl"}, "5", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()
    f.x = max.x + (max.w / 2)
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end)

--------------------------------------------------
-- full screen --
hs.hotkey.bind({"alt", "ctrl"}, "6", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()
    f.x = max.x 
    f.y = max.y
    f.w = max.w 
    f.h = max.h
    win:setFrame(f)
end)
