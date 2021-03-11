local awful = require("awful")
local gears = require("gears")

require("bindings.shared")

local keys = gears.table.join(
    awful.key({ modkey, }, "Left",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),
    awful.key({ modkey, }, "Right",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),
    awful.key({ modkey, }, "Tab", awful.tag.history.restore,
              {description = "go back", group = "tag"}),

    awful.key({ modkey, }, "h",
        function ()
            awful.client.focus.byidx(1)
        end,
        {description = "focus next by index", group = "client"}
    ),
    awful.key({ modkey, }, "t",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),

    -- Layout manipulation
    awful.key({ modkey, "Shift" }, "h", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),
    awful.key({ modkey, "Shift" }, "t", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),
    awful.key({ modkey, "Control" }, "h", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({ modkey, "Control" }, "t", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),

    -- Standard program
    awful.key({ modkey, "Shift" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, "Shift"   }, "e", awesome.quit,
              {description = "quit awesome", group = "awesome"}),
    awful.key({ }, "Print", function () awful.spawn("scrot -q 100") end,
              {description = "take a screenshot", group = "launcher"}),
    awful.key({ modkey, }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ modkey, }, "b", function () awful.spawn(browser) end,
              {description = "surf the web", group = "launcher"}),
    awful.key({ modkey, "Shift" }, "s", function () awful.spawn("slock") end,
              {description = "lock screen", group = "launcher"}),
    awful.key({ modkey, }, "z", function () awful.spawn(reader) end,
              {description = "view pdf files", group = "launcher"}),
    awful.key({ modkey, }, "space", function ()
		local s = awful.screen.focused()
   		for _, t in pairs(s.tags) do
    		for _, c in ipairs(t:clients()) do
				awful.titlebar.toggle(c, "left")
			end
		end
    	awful.layout.inc(1)
    end),

    awful.key({ modkey, "Shift" }, "space", function ()
    	for _, c in ipairs(awful.screen.focused().selected_tag:clients()) do
			awful.titlebar.toggle(c, "left")
		end
	end),

    -- Prompt
    awful.key({ modkey, }, "r", function () awful.screen.focused().promptbox:run() end,
              {description = "run prompt", group = "launcher"})
)

return keys
