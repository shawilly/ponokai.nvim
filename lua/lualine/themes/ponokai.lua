local palette = require("ponokai.palette")

local function set_current_theme(mode_color)
	return {
		a = { bg = mode_color, fg = palette.bg0_hex, gui = "bold" },
		b = { bg = palette.bg2_hex, fg = mode_color },
		c = { bg = palette.bg4_hex, fg = palette.grey_hex },
	}
end

return {
	normal = set_current_theme(palette.blue_hex),
	insert = set_current_theme(palette.green_hex),
	visual = set_current_theme(palette.yellow_hex),
	replace = set_current_theme(palette.purple_hex),
	command = set_current_theme(palette.orange_hex),
	inactive = set_current_theme(palette.red_hex),
}
