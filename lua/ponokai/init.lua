-- NOTE: Run Lushify in ponokai/theme to work on the theme.
---@diagnostic disable
local theme = require("ponokai.theme")

local function setup()
	return theme
end

return { setup = setup }
