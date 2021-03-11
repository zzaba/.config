local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local naughty = require("naughty")
local wibox = require("wibox")

local battery = {}

battery.watch_active = false
battery.created_widgets = {}
battery.cantent = {
	battery_detected = true,
	alert = false,
	percentage = 0,
	charging = false,
	battery_name = ""
}



return battery
