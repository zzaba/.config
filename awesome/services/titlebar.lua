local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

local function bar(c)
	return awful.titlebar(c, { position = "left" }) : setup {
        { -- Left
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.minimizebutton (c),
            awful.titlebar.widget.closebutton    (c),
            layout  = wibox.layout.fixed.vertical
        },
        { -- Middle
			buttons = gears.table.join(
				awful.button({ }, 1, function()
					c:emit_signal("request::activate", "titlebar", {raise = true})
					awful.mouse.client.move(c)
				end)
			),
            layout  = wibox.layout.flex.vertical
        },
        { -- Right
            awful.titlebar.widget.floatingbutton(c),
            layout  = wibox.layout.flex.vertical
        },
        layout = wibox.layout.align.vertical
    }
end

return function (c)
	if c.floating then
		if c.titlebar == nil then
			c:emit_signal("request::titlebars", "rules", {})
		end
		awful.titlebar.show(c)
	else
		awful.titlebar.hide(c)
	end
end
