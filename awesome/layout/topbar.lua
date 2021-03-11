local awful = require("awful")
local wibox = require("wibox")

local taglist = require("widgets.taglist")

local function build(screen)
	topbar = awful.wibar({ position = "top", screen = screen, opacity = 0.95 })

	screen.promptbox = awful.widget.prompt()

	topbar:setup {
		layout = wibox.layout.align.horizontal,
		{ -- Left widgets
			layout = wibox.layout.fixed.horizontal,
			taglist(screen),
		},
		screen.promptbox,
		{ -- Right widgets
			layout = wibox.layout.fixed.horizontal,
			wibox.widget.textclock("<span font='JetBrains Mono 13'> %b %-d(%a)  %-H:%M </span>")
		},
	}

	return topbar
end

return build
