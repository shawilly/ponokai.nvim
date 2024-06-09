local lush = require("lush")
local hsl = lush.hsl

-- Define the color palette using HSL
local palette = {
	black = hsl("#181a1c"),
	bg_dim = hsl("#252630"),
	bg0 = hsl("#2b2d3a"),
	bg1 = hsl("#333648"),
	bg2 = hsl("#363a4e"),
	bg3 = hsl("#393e53"),
	bg4 = hsl("#3f445b"),
	bg_red = hsl("#ffb3bd"),
	diff_red = hsl("#a67f82"),
	bg_green = hsl("#cbecb0"),
	diff_green = hsl("#818f80"),
	bg_blue = hsl("#b3e7f9"),
	diff_blue = hsl("#808d9f"),
	diff_yellow = hsl("#9c937a"),
	fg = hsl("#f2f2f3"),
	red = hsl("#ff8c9a"),
	orange = hsl("#f3bb9a"),
	yellow = hsl("#f8e7b0"),
	green = hsl("#b4e49a"),
	blue = hsl("#98d4e7"),
	purple = hsl("#bdb2ff"),
	grey = hsl("#c4c6cf"),
	grey_dim = hsl("#9da1af"),
	none = "NONE",
}

---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
	local sym = injected_functions.sym

	return {
		ColorColumn({ bg = palette.bg1 }), -- Columns set with 'colorcolumn'
		Conceal({ fg = palette.grey }), -- Placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor({ bg = palette.fg, fg = palette.black }), -- Character under the cursor
		CurSearch({ bg = palette.yellow, fg = palette.black }), -- Highlighting a search pattern under the cursor (see 'hlsearch')
		lCursor({ bg = palette.fg, fg = palette.black }), -- Character under the cursor when |language-mapping| is used (see 'guicursor')
		CursorIM({ bg = palette.fg, fg = palette.black }), -- Like Cursor, but used when in IME mode |CursorIM|
		CursorColumn({ bg = palette.bg1 }), -- Screen-column at the cursor, when 'cursorcolumn' is set.
		CursorLine({ bg = palette.bg0 }), -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
		Directory({ fg = palette.blue }), -- Directory names (and other special names in listings)
		DiffAdd({ bg = palette.diff_green }), -- Diff mode: Added line |diff.txt|
		DiffChange({ bg = palette.diff_yellow }), -- Diff mode: Changed line |diff.txt|
		DiffDelete({ bg = palette.diff_red }), -- Diff mode: Deleted line |diff.txt|
		DiffText({ bg = palette.diff_blue }), -- Diff mode: Changed text within a changed line |diff.txt|
		EndOfBuffer({ fg = palette.bg_dim }), -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
		TermCursor({ bg = palette.fg, fg = palette.black }), -- Cursor in a focused terminal
		TermCursorNC({ bg = palette.grey }), -- Cursor in an unfocused terminal
		ErrorMsg({ fg = palette.red }), -- Error messages on the command line
		VertSplit({ fg = palette.bg4 }), -- Column separating vertically split windows
		Folded({ bg = palette.bg_dim, fg = palette.grey_dim }), -- Line used for closed folds
		FoldColumn({ bg = palette.bg_dim, fg = palette.grey_dim }), -- 'foldcolumn'
		SignColumn({ bg = palette.bg_dim }), -- Column where |signs| are displayed
		IncSearch({ bg = palette.orange, fg = palette.black }), -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		Substitute({ bg = palette.orange, fg = palette.black }), -- |:substitute| replacement text highlighting
		LineNr({ fg = palette.grey_dim }), -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		LineNrAbove({ fg = palette.grey_dim }), -- Line number for when the 'relativenumber' option is set, above the cursor line
		LineNrBelow({ fg = palette.grey_dim }), -- Line number for when the 'relativenumber' option is set, below the cursor line
		CursorLineNr({ fg = palette.yellow }), -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		CursorLineFold({ bg = palette.bg0, fg = palette.grey_dim }), -- Like FoldColumn when 'cursorline' is set for the cursor line
		CursorLineSign({ bg = palette.bg0, fg = palette.grey_dim }), -- Like SignColumn when 'cursorline' is set for the cursor line
		MatchParen({ fg = palette.yellow, gui = "bold" }), -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		ModeMsg({ fg = palette.fg }), -- 'showmode' message (e.g., "-- INSERT -- ")
		MsgArea({ fg = palette.fg }), -- Area for messages and cmdline
		MsgSeparator({ bg = palette.bg4, fg = palette.grey }), -- Separator for scrolled messages, `msgsep` flag of 'display'
		MoreMsg({ fg = palette.green }), -- |more-prompt|
		NonText({ fg = palette.bg_dim }), -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		Normal({ bg = palette.bg_dim, fg = palette.fg }), -- Normal text
		NormalFloat({ bg = palette.bg1, fg = palette.fg }), -- Normal text in floating windows.
		FloatBorder({ fg = palette.bg4 }), -- Border of floating windows.
		FloatTitle({ fg = palette.blue }), -- Title of floating windows.
		NormalNC({ bg = palette.bg_dim, fg = palette.grey_dim }), -- normal text in non-current windows
		Pmenu({ bg = palette.bg1, fg = palette.fg }), -- Popup menu: Normal item.
		PmenuSel({ bg = palette.bg3, fg = palette.fg }), -- Popup menu: Selected item.
		PmenuKind({ bg = palette.bg1, fg = palette.green }), -- Popup menu: Normal item "kind"
		PmenuKindSel({ bg = palette.bg3, fg = palette.green }), -- Popup menu: Selected item "kind"
		PmenuExtra({ bg = palette.bg1, fg = palette.purple }), -- Popup menu: Normal item "extra text"
		PmenuExtraSel({ bg = palette.bg3, fg = palette.purple }), -- Popup menu: Selected item "extra text"
		PmenuSbar({ bg = palette.bg2 }), -- Popup menu: Scrollbar.
		PmenuThumb({ bg = palette.grey }), -- Popup menu: Thumb of the scrollbar.
		Question({ fg = palette.yellow }), -- |hit-enter| prompt and yes/no questions
		QuickFixLine({ bg = palette.bg3, fg = palette.fg }), -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		Search({ bg = palette.bg_blue, fg = palette.black }), -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
		SpecialKey({ fg = palette.grey }), -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
		SpellBad({ fg = palette.red, gui = "undercurl" }), -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		SpellCap({ fg = palette.orange, gui = "undercurl" }), -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		SpellLocal({ fg = palette.blue, gui = "undercurl" }), -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		SpellRare({ fg = palette.purple, gui = "undercurl" }), -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
		StatusLine({ bg = palette.bg1, fg = palette.fg }), -- Status line of current window
		StatusLineNC({ bg = palette.bg1, fg = palette.grey_dim }), -- Status lines of not-current windows Note: If this is equal to "StatusLine", the status line of the current window will be invisible.
		TabLine({ bg = palette.bg3, fg = palette.grey_dim }), -- Tab pages line, not active tab page label
		TabLineFill({ bg = palette.bg2 }), -- Tab pages line, where there are no labels
		TabLineSel({ bg = palette.bg4, fg = palette.fg }), -- Tab pages line, active tab page label
		Title({ fg = palette.green }), -- Titles for output from ":set all", ":autocmd" etc.
		Visual({ bg = palette.bg3 }), -- Visual mode selection
		VisualNOS({ bg = palette.bg3 }), -- Visual mode selection when vim is "Not Owning the Selection".
		WarningMsg({ fg = palette.orange }), -- Warning messages
		Whitespace({ fg = palette.bg4 }), -- "nbsp", "space", "tab" and "trail" in 'listchars'
		WildMenu({ bg = palette.bg1, fg = palette.blue }), -- Current match in 'wildmenu' completion
		Constant({ fg = palette.orange }), -- Any constant
		String({ fg = palette.green }), -- String values, see |String|
		Character({ fg = palette.green }), -- Character constant: 'c', '\n'
		Number({ fg = palette.orange }), -- Number constant: 234, 0xff
		Boolean({ fg = palette.orange }), -- Boolean constant: TRUE, false
		Float({ fg = palette.orange }), -- Floating point constant: 2.3e10
		Identifier({ fg = palette.blue }), -- Any variable name
		Function({ fg = palette.yellow }), -- Function name (also: methods for classes)
		Statement({ fg = palette.red }), -- Any statement
		Conditional({ fg = palette.purple }), -- if, then, else, endif, switch, etc.
		Repeat({ fg = palette.purple }), -- for, do, while, etc.
		Label({ fg = palette.purple }), -- case, default, etc.
		Operator({ fg = palette.purple }), -- "sizeof", "+", "*", etc.
		Keyword({ fg = palette.purple }), -- any other keyword
		Exception({ fg = palette.red }), -- try, catch, throw
		PreProc({ fg = palette.blue }), -- Generic Preprocessor
		Include({ fg = palette.blue }), -- Preprocessor #include
		Define({ fg = palette.blue }), -- Preprocessor #define
		Macro({ fg = palette.blue }), -- Same as Define
		PreCondit({ fg = palette.blue }), -- Preprocessor #if, #else, #endif, etc.
		Type({ fg = palette.yellow }), -- int, long, char, etc.
		StorageClass({ fg = palette.yellow }), -- static, register, volatile, etc.
		Structure({ fg = palette.yellow }), -- struct, union, enum, etc.
		Typedef({ fg = palette.yellow }), -- A typedef
		Special({ fg = palette.purple }), -- Any special symbol
		SpecialChar({ fg = palette.purple }), -- Special character in a constant
		Tag({ fg = palette.blue }), -- You can use CTRL-] on this
		Delimiter({ fg = palette.fg }), -- Character that needs attention
		SpecialComment({ fg = palette.grey_dim }), -- Special things inside a comment
		Debug({ fg = palette.red }), -- Debugging statements
		Underlined({ gui = "underline" }), -- Text that stands out, HTML links
		Bold({ gui = "bold" }),
		Italic({ gui = "italic" }),
		Ignore({ fg = palette.none }), -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
		Error({ fg = palette.red, gui = "bold" }), -- Any erroneous construct
		Todo({ bg = palette.yellow, fg = palette.black }), -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX
	}
end)

return theme
