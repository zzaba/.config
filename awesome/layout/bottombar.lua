local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

local function build(screen)
	bar = awful.wibar({ position = "bottom", screen = screen, height = 20, visible = false })

	bar:setup {
		layout = wibox.layout.flex.horizontal,
		awful.widget.tasklist {
		    screen   = screen,
		    style    = { align = "center", font = "JetBrains Mono Bold 10", tasklist_disable_icon = true },
		    filter   = awful.widget.tasklist.filter.currenttags,
		    buttons  = gears.table.join(
		    	awful.button({ }, 1, function (c)
		    		if c == client.focus then
		    			c.minimized = true
		    		else
		    			c:emit_signal("request::activate", "tasklist", {raise = true })
		    		end
		    	end)
		    ),
		},
	}

	return bar
end

return build
