local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local wibox = require("wibox")

local bottombar = require("layout.bottombar")
local topbar = require("layout.topbar")

awful.screen.connect_for_each_screen(function(s)
	s.bottombar = bottombar(s)
	s.topbar = topbar(s)

	-- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end)
