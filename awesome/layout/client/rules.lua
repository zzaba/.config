local awful = require("awful")
local beautiful = require("beautiful")

awful.rules.rules = {
	-- All clients will match this rule.
	{ rule = { },
		properties = { border_width = beautiful.border_width,
		             border_color = beautiful.border_normal,
		             buttons = require("bindings.client.buttons"),
		             focus = awful.client.focus.filter,
		             keys = require("bindings.client.keys"),
		             placement = awful.placement.no_overlap+awful.placement.no_offscreen,
		             raise = true,
		             screen = awful.screen.preferred,
		             size_hints_honor = false,
		             titlebars_enabled = false,
		           },
	}
}
