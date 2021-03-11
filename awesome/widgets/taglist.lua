local awful = require("awful")

local function build(screen)
	return awful.widget.taglist {
		buttons = require("bindings.tag.buttons"),
		filter  = awful.widget.taglist.filter.all,
		screen  = screen,
	}
end

return build
