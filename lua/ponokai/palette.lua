local lush = require("lush")
local hsl = lush.hsl

local palette = {
	-- Base colors
	black = hsl(226, 14, 10),
	bg = hsl(213, 14, 20),
	bg_700 = hsl(215, 18, 30),
	bg_500 = hsl(216, 18, 40),
	bg_300 = hsl(214, 18, 50),
	bg_100 = hsl(218, 18, 60),
	grey = hsl(219, 18, 80),
	fg = hsl(220, 18, 100),

	-- Red shades
	red = hsl(348, 100, 75),
	red_900 = hsl(348, 60, 50),
	red_700 = hsl(348, 75, 60),
	red_500 = hsl(348, 85, 70),
	red_300 = hsl(348, 85, 75),
	red_100 = hsl(348, 100, 88),

	-- Orange shades
	orange = hsl(22, 78, 79),
	orange_900 = hsl(22, 60, 50),
	orange_700 = hsl(22, 75, 60),
	orange_500 = hsl(22, 85, 70),
	orange_300 = hsl(22, 85, 75),
	orange_100 = hsl(22, 100, 88),

	-- Brown
	brown = hsl(30, 50, 50),

	-- Yellow shades
	yellow = hsl(45, 81, 82),
	yellow_900 = hsl(45, 60, 50),
	yellow_700 = hsl(45, 75, 60),
	yellow_500 = hsl(45, 85, 70),
	yellow_300 = hsl(45, 85, 75),
	yellow_100 = hsl(45, 100, 88),

	-- Green shades
	green = hsl(104, 61, 75),
	green_900 = hsl(104, 30, 35),
	green_700 = hsl(104, 35, 45),
	green_500 = hsl(104, 55, 65),
	green_300 = hsl(104, 65, 75),
	green_100 = hsl(104, 90, 90),

	-- Blue shades
	blue = hsl(196, 68, 77),
	blue_900 = hsl(196, 60, 50),
	blue_700 = hsl(196, 75, 60),
	blue_500 = hsl(196, 85, 70),
	blue_300 = hsl(196, 85, 75),
	blue_100 = hsl(196, 100, 88),

	-- Purple shades
	purple = hsl(243, 60, 70),
	purple_900 = hsl(243, 35, 40),
	purple_700 = hsl(243, 45, 50),
	purple_500 = hsl(243, 55, 60),
	purple_300 = hsl(243, 65, 65),
	purple_100 = hsl(243, 75, 75),

	-- Pink shades
	pink = hsl(330, 55, 70),
	pink_900 = hsl(330, 40, 45),
	pink_700 = hsl(330, 45, 50),
	pink_500 = hsl(330, 55, 60),
	pink_300 = hsl(330, 65, 65),
	pink_100 = hsl(330, 75, 75),

	-- Diagnostics
	error = hsl(348, 70, 60),
	error_bg = hsl(0, 19, 17),
	warn = hsl(45, 75, 60),
	warn_bg = hsl(51, 27, 15),
	info = hsl(196, 75, 65),
	info_bg = hsl(213, 23, 17),
	ok = hsl(104, 55, 65),
	ok_bg = hsl(120, 19, 17),

	-- Git
	modified = hsl(196, 85, 75),
	text_added = hsl(104, 55, 65),
	text_changed = hsl(196, 75, 60),
	text_deleted = hsl(348, 60, 50),
	line_added = hsl(104, 65, 75),
	line_changed = hsl(196, 85, 70),
	line_deleted = hsl(348, 75, 60),

	-- Lualine, has to be in hex
	bg0_hex = "#2b2d3a",
	bg1_hex = "#333648",
	bg2_hex = "#363a4e",
	bg3_hex = "#393e53",
	bg4_hex = "#3f445b",
	fg_hex = "#f2f2f3",
	red_hex = "#ff8c9a",
	orange_hex = "#f3bb9a",
	yellow_hex = "#f8e7b0",
	green_hex = "#b4e49a",
	blue_hex = "#98d4e7",
	purple_hex = "#bdb2ff",
	grey_hex = "#c4c6cf",
}

return palette
