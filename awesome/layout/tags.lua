local awful = require("awful")

awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.floating,
    awful.layout.suit.max,
}

awful.screen.connect_for_each_screen(function(s)
    awful.tag({ "  ", "  ", "  ", "  ", "  ", "  ", "  " }, s, awful.layout.layouts[1])
end)
