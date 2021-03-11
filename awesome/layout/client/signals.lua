local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local wibox = require("wibox")

local titlebar = require("services.titlebar")

client.connect_signal("manage", function (c)
    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end

	-- c.shape = gears.shape.rounded_rect
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

client.connect_signal("request::titlebars", function(c)
	awful.titlebar(c, { position = "left" }) : setup {
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
end)

-- client.connect_signal("property::layouts", function(c) awful.titlebar.toggle(c, "left") end)

--[[

local create_click_events = function(c)
	-- Titlebar button/click events
	local buttons = gears.table.join(
		awful.button(
			{},
			1,
			function()
				double_click_event_handler(function()
					if c.floating then
						c.floating = false
						return
					end
					c.maximized = not c.maximized
					c:raise()
					return
				end)
				c:activate {context = 'titlebar', action = 'mouse_move'}
			end
		),
		awful.button(
			{},
			3,
			function()
				c:activate {context = 'titlebar', action = 'mouse_resize'}
			end
		)
	)
	return buttons
end


local function setTitlebar(client, s)
    if s then
        if client.titlebar == nil then
            client:emit_signal("request::titlebars", "rules", {})
        end
        awful.titlebar.show(client)
    else 
        awful.titlebar.hide(client)
    end
end

--Toggle titlebar on floating status change
client.connect_signal("property::floating", function(c)
    setTitlebar(c, c.floating)
end)

-- Hook called when a client spawns
client.connect_signal("manage", function(c) 
    setTitlebar(c, c.floating or c.first_tag.layout == awful.layout.suit.floating)
end)

-- Show titlebars on tags with the floating layout
tag.connect_signal("property::layout", function(t)
    -- New to Lua ? 
    -- pairs iterates on the table and return a key value pair
    -- I don't need the key here, so I put _ to ignore it
    for _, c in pairs(t:clients()) do
        if t.layout == awful.layout.suit.floating then
            setTitlebar(c, true)
        else
            setTitlebar(c, false)
        end
    end
end)

local bottom_bar = require("widgets.bottombar")
awful.screen.connect_for_each_screen(function(s)
    if s.index == 1 then
        s.bottom_bar = bottom_bar(s, true)
    else
        s.bottom_bar = bottom_bar(s, false)
    end
end)
]]
