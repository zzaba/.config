local beautiful = require("beautiful")

require("services.error_handling")

beautiful.init(require("themes.nord"))

require("layout")

root.buttons(require("bindings.global.buttons"))
root.keys(require("bindings.global.keys"))
