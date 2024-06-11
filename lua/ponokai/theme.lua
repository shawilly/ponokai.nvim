local lush = require("lush")

---@type table<string, table>
local c = require("ponokai.palette")

local function tame(colour)
	return colour.darken(10).desaturate(40)
end

---@diagnostic disable
local theme = lush(function(injected_functions)
	local sym = injected_functions.sym
	return {

		--
		-- Preset
		--
		TabBorder({ fg = c.bg }), -- tab.border, border to separate tabs from each other
		FloatBorder({ fg = c.bg }),
		SelectionHighlightBackground({ bg = c.bg_700, gui = "italic bold" }),
		LightBulb({ fg = c.yellow_700 }), -- lightbulb.foreground
		CodeLens({ fg = c.grey }), -- editorCodeLens.foreground
		GutterGitAdded({ fg = c.text_added }),
		GutterGitDeleted({ fg = c.text_deleted }),
		GutterGitModified({ fg = c.modified }),
		Breadcrumb({ fg = c.bg_300, bg = c.bg }),
		ScrollbarSlider({ bg = c.bg_500 }),
		PeekViewBorder({ fg = c.blue }),
		PeekViewNormal({ bg = c.green }),
		PeekViewTitle({ fg = c.fg }), -- peekViewTitleLabel.foreground
		PeekViewCursorLine({ bg = c.bg_700 }),
		PeekViewMatchHighlight({ bg = c.bg_100 }), -- peekViewEditor.matchHighlightBackground
		GhostText({ fg = c.bg_100 }),
		Icon({ fg = c.grey }), -- icon.foreground
		Description({ fg = c.bg_100 }), -- descriptionForeground
		ProgressBar({ fg = c.blue_500 }), -- progressBar.background
		MatchedCharacters({ fg = c.red_900 }), -- editorSuggestWidget.highlightForeground
		Hint({ MatchedCharacters }), -- for the hint letter in options, e.g., the q in [q]uickfix
		-- For the unused code, use Identifier's fg (9cdcfe) as the base color,
		-- editorUnnecessaryCode.opacity is 000000aa (the alpha value is aa),
		-- so the color will be 9cdcfeaa. Converting hexa to hex gets 729db4.
		UnnecessaryCode({ fg = c.blue_700 }),
		-- Git diff
		DiffTextAdded({ bg = c.text_added }),
		DiffTextDeleted({ bg = c.text_deleted }),
		DiffTextChanged({ bg = c.text_changed }),
		DiffLineAdded({ bg = c.line_added }),
		DiffLineDeleted({ bg = c.line_deleted }),
		DiffLineChanged({ bg = c.line_changed }),
		-- Quickfix list (can be used to define qf syntax, e.g.,
		-- ~/.config/nvim/syntax/qf.vim)
		QfFileName({ fg = c.grey }),
		QfSelection({ bg = c.bg_500 }), -- terminal.inactiveSelectionBackground
		QfText({ fg = c.grey }), -- normal text in quickfix list
		-- Inline hints
		InlayHint({ fg = c.bg_500, bg = c.bg }), -- editorInlayHint.foreground/background
		InlayHintType({ InlayHint }), -- editorInlayHint.typeBackground/typeForeground

		--
		-- Editor
		--
		CursorLine({ bg = tame(c.bg) }),
		CursorColumn({ bg = c.bg_500 }),
		ColorColumn({ bg = c.bg_500 }),
		Conceal({ fg = c.green }),
		Cursor({ bg = c.bg_500 }),
		-- lCursor { },
		-- CursorIM { },
		Directory({ fg = c.orange }),
		DiffAdd({ DiffLineAdded }),
		DiffDelete({ DiffLineDeleted }),
		DiffChange({ DiffLineChanged }),
		DiffText({ DiffTextChanged }),
		EndOfBuffer({ fg = c.bg }),
		-- TermCursor { },
		-- TermCursorNC { },
		ErrorMsg({ fg = c.error, bg = c.error_bg }),
		WinSeparator({ fg = "#444444" }), -- editorGroup.border
		VirtSplit({ WinSeparator }), -- deprecated and use WinSeparator instead
		LineNr({ fg = c.bg_100 }),
		CursorLineNr({ fg = "#c6c6c6" }),
		Folded({ bg = c.bg_500 }),
		CursorLineFold({ CursorLineNr }),
		FoldColumn({ LineNr }), -- #c5c5c5 in VSCode (editorGutter.foldingControlForeground) and it's too bright
		SignColumn({ bg = c.bg }),
		IncSearch({ bg = "#515c6a" }),
		-- Substitute { },
		MatchParen({ bg = c.grey, gui = "bold, underline" }),
		ModeMsg({ fg = c.fg }),
		MsgArea({ fg = c.fg }),
		-- MsgSeparator { },
		MoreMsg({ fg = c.fg }),
		NonText({ fg = c.bg_100 }),
		Normal({ fg = c.fg, bg = c.bg }),
		-- NormalNC { },
		Pmenu({ fg = c.fg, bg = c.bg_500 }),
		PmenuSel({ fg = c.fg, bg = c.bg_500 }),
		PmenuSbar({ bg = c.bg_500 }),
		PmenuThumb({ bg = "#474747" }),
		NormalFloat({ Pmenu }),
		Question({ fg = c.blue }),
		QuickFixLine({ QfSelection }),
		Search({ bg = c.brown }),
		SpecialKey({ NonText }),
		SpellBad({ gui = "undercurl", sp = c.red_700 }),
		SpellCap({ gui = "undercurl", sp = c.yellow_700 }),
		SpellLocal({ gui = "undercurl", sp = c.red }),
		SpellRare({ gui = "undercurl", sp = c.red }),
		StatusLine({ bg = c.bg_500 }),
		StatusLineNC({ fg = c.grey, bg = c.bg_500 }),
		TabLine({ fg = c.bg_100, bg = c.black }),
		TabLineFill({ fg = "NONE", bg = c.bg_500 }),
		TabLineSel({ fg = c.fg, bg = c.bg }),
		Title({ fg = c.blue, gui = "bold" }),
		Visual({ gui = "bold", bg = c.bg_700 }),
		-- VisualNOS { },
		WarningMsg({ fg = c.yellow_700 }),
		Whitespace({ fg = c.bg_500 }),
		WildMenu({ PmenuSel }),
		Winbar({ Breadcrumb }),
		WinbarNC({ Breadcrumb }),

		--
		-- Syntax
		--
		Comment({ fg = c.grey }),

		Constant({ fg = c.fg, gui = "bold" }),
		Character({ Constant }),
		String({ fg = c.yellow }),
		Number({ fg = c.purple, gui = "italic" }),
		Boolean({ fg = c.blue }),
		Float({ Number }),

		Identifier({ fg = c.red }),
		Function({ fg = c.green }),

		Statement({ fg = c.pink_500 }),
		Conditional({ Statement }),
		Repeat({ Statement }),
		Label({ Statement }),
		Operator({ fg = c.red_500 }),
		Keyword({ fg = c.red_500 }),
		Exception({ Statement }),

		PreProc({ fg = c.pink_500 }),
		Include({ PreProc }),
		Define({ PreProc }),
		Macro({ PreProc }),
		PreCondit({ PreProc }),

		Type({ fg = c.blue, gui = "italic" }),
		StorageClass({ Type }),
		Structure({ Type }),
		Typedef({ Type }),

		Special({ fg = c.orange }),
		SpecialChar({ Special }),
		Tag({ Special }),
		Delimiter({ Special }),
		SpecialComment({ Special }),
		Debug({ Special }),

		Underlined({ gui = "underline" }),
		-- Ignore { },
		Error({ fg = c.red_700 }),
		Todo({ fg = c.bg, bg = c.blue, gui = "bold" }),

		--
		-- diff
		--
		-- VSCode doesn't have foreground for git added/removed/changed, so here I
		-- use the corresponding c for gutter instead.
		diffAdded({ GutterGitAdded }),
		diffRemoved({ GutterGitDeleted }),
		diffChanged({ GutterGitModified }),

		--
		-- LSP
		--
		LspReferenceText({ SelectionHighlightBackground }),
		LspReferenceRead({ SelectionHighlightBackground }),
		LspReferenceWrite({ SelectionHighlightBackground }),
		LspCodeLens({ CodeLens }),
		-- LspCodeLensSeparator { }, -- Used to color the separator between two or more code lens.
		LspSignatureActiveParameter({ MatchedCharacters }),
		LspInlayHint({ InlayHint }),

		--
		-- Diagnostics
		--
		DiagnosticError({ fg = c.error }),
		DiagnosticWarn({ fg = c.warn }),
		DiagnosticInfo({ fg = c.info }),
		DiagnosticHint({ DiagnosticWarn }),
		DiagnosticOk({ fg = c.ok }),
		DiagnosticVirtualTextError({ DiagnosticError, bg = c.error_bg }),
		DiagnosticVirtualTextWarn({ DiagnosticWarn, bg = c.warn_bg }),
		DiagnosticVirtualTextInfo({ DiagnosticInfo, bg = c.info_bg }),
		DiagnosticVirtualTextHint({ DiagnosticVirtualTextWarn, gui = "italic" }),
		DiagnosticVirtualTextOk({ DiagnosticOk, bg = "#233323" }),
		DiagnosticUnderlineError({ gui = "undercurl", sp = c.red_700 }),
		DiagnosticUnderlineWarn({ gui = "undercurl", sp = c.yellow_700 }),
		DiagnosticUnderlineInfo({ gui = "undercurl", sp = c.blue_700 }),
		DiagnosticUnderlineHint({ gui = "undercurl" }),
		DiagnosticUnderlineOk({ gui = "undercurl", sp = c.green_700 }),
		DiagnosticFloatingError({ DiagnosticError }),
		DiagnosticFloatingWarn({ DiagnosticWarn }),
		DiagnosticFloatingInfo({ DiagnosticInfo }),
		DiagnosticFloatingHint({ DiagnosticHint }),
		DiagnosticFloatingOk({ DiagnosticOk }),
		DiagnosticSignError({ DiagnosticError }),
		DiagnosticSignWarn({ DiagnosticWarn }),
		DiagnosticSignInfo({ DiagnosticInfo }),
		DiagnosticSignHint({ DiagnosticHint }),
		DiagnosticSignOk({ DiagnosticOk }),
		DiagnosticUnnecessary({ UnnecessaryCode, gui = "underdashed" }),
		DiagnosticDeprecated({ fg = c.bg_300, gui = "strikethrough" }),

		--
		-- Treesitter
		--
		-- Use the capture names directly as the highlight groups.
		-- To find all the capture names, see https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md#highlights)

		-- Identifiers
		sym("@variable")({ fg = c.fg }), -- various variable names
		sym("@variable.builtin")({ fg = c.purple_100, gui = "italic" }), -- built-in variable names (e.g. `this`)
		sym("@variable.parameter")({ fg = c.orange }), -- parameters of a function, use a conspicuous color (VSCode uses the common c.blue_100)
		sym("@variable.parameter.builtin")({ sym("@variable.parameter") }), -- special parameters (e.g. `_`, `it`)
		sym("@variable.member")({ fg = c.orange }), -- object and struct fields

		sym("@constant")({ Constant }), -- constant identifiers
		sym("@constant.builtin")({ Constant }), -- built-in constant values
		sym("@constant.macro")({ Constant }), -- constants defined by the preprocessor

		sym("@module")({ fg = c.pink }), -- modules or namespaces
		sym("@module.builtin")({ sym("@module") }), -- built-in modules or namespaces
		sym("@label")({ fg = c.fg }), -- GOTO and other labels (e.g. `label:` in C), including heredoc labels

		-- Literals
		sym("@string")({ String }), -- string literals
		sym("@string.documentation")({ fg = c.brown }), -- string documenting code (e.g. Python docstrings)
		sym("@string.regexp")({ fg = c.pink }), -- regular expressions
		sym("@string.escape")({ fg = c.orange }), -- escape sequences
		sym("@string.special")({ SpecialChar }), -- other special strings (e.g. dates)
		sym("@string.special.symbol")({ sym("@string.special") }), -- symbols or atoms
		sym("@string.special.url")({ fg = c.blue_500, gui = "underline" }), -- URIs (e.g. hyperlinks), it's url outside markup
		sym("@string.special.path")({ sym("@string.special") }), -- filenames

		sym("@character")({ Character }), -- character literals
		sym("@character.special")({ SpecialChar }), -- special characters (e.g. wildcards)

		sym("@boolean")({ Boolean }), -- boolean literals
		sym("@number")({ Number }), -- numeric literals
		sym("@number.float")({ Float }), -- floating-point number literals

		-- Types
		sym("@type")({ fg = c.green }), -- type or class definitions and annotations
		sym("@type.builtin")({ fg = c.blue, gui = "italic" }), -- built-in types
		sym("@type.definition")({ fg = c.red }), -- identifiers in type definitions (e.g. `typedef <type> <identifier>` in C)

		sym("@attribute")({ fg = c.pink }), -- attribute annotations (e.g. Python decorators)
		sym("@attribute.builtin")({ sym("@attribute") }), -- builtin annotations (e.g. `@property` in Python)
		sym("@property")({ sym("@variable.member") }), -- the key in key/value pairs

		-- Function
		sym("@function")({ Function }), -- function definitions
		sym("@function.builtin")({ Function }), -- built-in functions
		sym("@function.call")({ Function }), -- function calls
		sym("@function.macro")({ Function }), -- preprocessor macros

		sym("@function.method")({ sym("@function") }), -- method definitions
		sym("@function.method.call")({ sym("@function.call") }), -- method calls

		sym("@constructor")({ fg = c.purple_100 }), -- constructor calls and definitions
		sym("@operator")({ Operator }), -- symbolic operators (e.g. `+` / `*`)

		-- Keyword
		sym("@keyword")({ Keyword }), -- keywords not fitting into specific categories
		sym("@keyword.coroutine")({ fg = c.red_500 }), -- keywords related to coroutines (e.g. `go` in Go, `async/await` in Python)
		sym("@keyword.function")({ fg = c.red_700 }), -- keywords that define a function (e.g. `func` in Go, `def` in Python)
		sym("@keyword.operator")({ sym("@operator") }), -- operators that are English words (e.g. `and` / `or`)
		sym("@keyword.import")({ Include }), -- keywords for including modules (e.g. `import` / `from` in Python)
		sym("@keyword.type")({ fg = c.red }), -- keywords describing composite types (e.g. `struct`, `enum`)
		sym("@keyword.modifier")({ fg = c.red }), -- keywords modifying other constructs (e.g. `const`, `static`, `public`)
		sym("@keyword.repeat")({ Repeat }), -- keywords related to loops (e.g. `for` / `while`)
		sym("@keyword.return")({ fg = c.red }), --  keywords like `return` and `yield`
		sym("@keyword.debug")({ Debug }), -- keywords related to debugging
		sym("@keyword.exception")({ Exception }), -- keywords related to exceptions (e.g. `throw` / `catch`)

		sym("@keyword.conditional")({ Conditional }), -- keywords related to conditionals (e.g. `if` / `else`)
		sym("@keyword.conditional.ternary")({ sym("@operator") }), -- ternary operator (e.g. `?` / `:`)

		sym("@keyword.directive")({ PreProc }), -- various preprocessor directives & shebangs
		sym("@keyword.directive.define")({ sym("@keyword.directive") }), -- preprocessor definition directives

		-- Punctuation
		sym("@punctuation.delimiter")({ fg = c.fg }), -- delimiters (e.g. `;` / `.` / `,`)
		sym("@punctuation.bracket")({ fg = c.fg }), -- brackets (e.g. `()` / `{}` / `[]`)
		sym("@punctuation.special")({ fg = c.purple }), -- special symbols (e.g. `{}` in string interpolation)

		-- Comments
		sym("@comment")({ Comment }), -- line and block comments
		sym("@comment.documentation")({ sym("@comment") }), -- comments documenting code

		sym("@comment.error")({ fg = c.error }), -- error-type comments (e.g., `DEPRECATED:`)
		sym("@comment.warning")({ fg = c.warn }), -- warning-type comments (e.g., `WARNING:`, `FIX:`)
		sym("@comment.hint")({ fg = c.hint }), -- note-type comments (e.g., `NOTE:`)
		sym("@comment.info")({ fg = c.info }), -- info-type comments
		sym("@comment.todo")({ Todo }), -- todo-type comments (e.g-, `TODO:`, `WIP:`)

		-- Markup
		sym("@markup.strong")({ fg = c.fg, gui = "bold" }), -- bold text
		sym("@markup.italic")({ fg = c.fg, gui = "italic" }), -- text with emphasis
		sym("@markup.strikethrough")({ fg = c.fg, gui = "strikethrough" }), -- strikethrough text
		sym("@markup.underline")({ fg = c.fg, gui = "underline" }), -- underlined text (only for literal underline markup!)

		sym("@markup.heading")({ Title }), -- headings, titles (including markers)
		sym("@markup.heading.1")({ sym("@markup.heading") }),
		sym("@markup.heading.2")({ sym("@markup.heading") }),
		sym("@markup.heading.3")({ sym("@markup.heading") }),
		sym("@markup.heading.4")({ sym("@markup.heading") }),
		sym("@markup.heading.5")({ sym("@markup.heading") }),
		sym("@markup.heading.6")({ sym("@markup.heading") }),

		sym("@markup.quote")({ fg = c.grey }), -- block quotes
		sym("@markup.math")({ fg = c.pink }), -- math environments (e.g. `$ ... $` in LaTeX)

		sym("@markup.link")({ fg = c.brown }), -- text references, footnotes, citations, etc.
		sym("@markup.link.label")({ sym("@markup.link") }), -- non-url links
		sym("@markup.link.url")({ sym("@markup.link") }), -- url links in markup

		sym("@markup.raw")({ fg = c.brown }), -- literal or verbatim text (e.g., inline code)
		sym("@markup.raw.block")({ fg = c.fg }), -- literal or verbatim text as a stand-alone block

		sym("@markup.list")({ fg = c.blue_500 }), -- list markers
		-- sym("@markup.list.checked") { }, -- checked todo-style list markers
		-- sym("@markup.list.unchecked") { }, -- unchecked todo-style list markers

		sym("@diff.plus")({ DiffTextAdded }), -- added text (for diff files)
		sym("@diff.minus")({ DiffTextDeleted }), -- deleted text (for diff files)
		sym("@diff.delta")({ DiffTextChanged }), -- changed text (for diff files)

		sym("@tag")({ fg = c.blue_900 }), -- XML tag names
		sym("@tag.builtin")({ sym("@tag") }), -- builtin tag names (e.g. HTML5 tags)
		sym("@tag.attribute")({ fg = c.fg }), -- XML tag attributes
		sym("@tag.delimiter")({ fg = c.bg_300 }), -- XML tag delimiters

		-- Language specific
		-- Lua
		sym("@variable.member.lua")({ fg = c.orange }),

		--
		-- LSP semantic tokens
		--
		-- The help page :h lsp-semantic-highlight
		-- A short guide: https://gist.github.com/swarn/fb37d9eefe1bc616c2a7e476c0bc0316
		-- Token types and modifiers are described here: https://code.visualstudio.com/api/language-extensions/semantic-highlight-guide
		sym("@lsp.type.namespace")({ sym("@module") }),
		sym("@lsp.type.type")({ sym("@type") }),
		sym("@lsp.type.class")({ sym("@type") }),
		sym("@lsp.type.enum")({ sym("@keyword.type") }),
		sym("@lsp.type.interface")({ sym("@type") }),
		sym("@lsp.type.struct")({ sym("@type") }),
		sym("@lsp.type.typeParameter")({ sym("@type.definition") }),
		sym("@lsp.type.parameter")({ sym("@variable.parameter") }),
		sym("@lsp.type.variable")({ sym("@variable") }),
		sym("@lsp.type.property")({ sym("@property") }),
		sym("@lsp.type.enumMember")({ fg = c.orange }),
		sym("@lsp.type.event")({ sym("@type") }),
		sym("@lsp.type.function")({ sym("@function") }),
		sym("@lsp.type.method")({ sym("@function") }),
		sym("@lsp.type.macro")({ sym("@constant.macro") }),
		sym("@lsp.type.keyword")({ sym("@keyword") }),
		sym("@lsp.type.comment")({ sym("@comment") }),
		sym("@lsp.type.string")({ sym("@string") }),
		sym("@lsp.type.number")({ sym("@number") }),
		sym("@lsp.type.regexp")({ sym("@string.regexp") }),
		sym("@lsp.type.operator")({ sym("@operator") }),
		sym("@lsp.type.decorator")({ sym("@attribute") }),
		sym("@lsp.type.escapeSequence")({ sym("@string.escape") }),
		sym("@lsp.type.formatSpecifier")({ fg = c.blue_100 }),
		sym("@lsp.type.builtinType")({ sym("@type.builtin") }),
		sym("@lsp.type.typeAlias")({ sym("@type.definition") }),
		sym("@lsp.type.unresolvedReference")({ gui = "undercurl", sp = c.red_700 }),
		sym("@lsp.type.lifetime")({ sym("@keyword.modifier") }),
		sym("@lsp.type.generic")({ sym("@variable") }),
		sym("@lsp.type.selfKeyword")({ sym("@variable.builtin") }),
		sym("@lsp.type.selfTypeKeyword")({ sym("@variable.builtin") }),
		sym("@lsp.type.deriveHelper")({ sym("@attribute") }),
		sym("@lsp.type.modifier")({ sym("@keyword.modifier") }),
		sym("@lsp.typemod.type.defaultLibrary")({ sym("@type.builtin") }),
		sym("@lsp.typemod.typeAlias.defaultLibrary")({ sym("@type.builtin") }),
		sym("@lsp.typemod.class.defaultLibrary")({ sym("@type.builtin") }),
		sym("@lsp.typemod.variable.defaultLibrary")({ sym("@variable.builtin") }),
		sym("@lsp.typemod.function.defaultLibrary")({ sym("@function.builtin") }),
		sym("@lsp.typemod.method.defaultLibrary")({ sym("@function.builtin") }),
		sym("@lsp.typemod.macro.defaultLibrary")({ sym("@function.builtin") }),
		sym("@lsp.typemod.struct.defaultLibrary")({ sym("@type.builtin") }),
		sym("@lsp.typemod.enum.defaultLibrary")({ sym("@type.builtin") }),
		sym("@lsp.typemod.enumMember.defaultLibrary")({ sym("@constant.builtin") }),
		sym("@lsp.typemod.variable.readonly")({ fg = c.blue }),
		sym("@lsp.typemod.variable.callable")({ sym("@function") }),
		sym("@lsp.typemod.variable.static")({ sym("@constant") }),
		sym("@lsp.typemod.property.readonly")({ fg = c.blue }),
		sym("@lsp.typemod.keyword.async")({ sym("@keyword.coroutine") }),
		sym("@lsp.typemod.keyword.injected")({ sym("@keyword") }),
		-- Set injected highlights. Mainly for Rust doc comments and also works for
		-- other lsps that inject tokens in comments.
		-- Ref: https://github.com/folke/tokyonight.nvim/pull/340
		sym("@lsp.typemod.operator.injected")({ sym("@operator") }),
		sym("@lsp.typemod.string.injected")({ sym("@string") }),
		sym("@lsp.typemod.variable.injected")({ sym("@variable") }),

		-- Language specific
		-- Lua
		sym("@lsp.type.property.lua")({ sym("@variable.member.lua") }),

		--
		-- nvim-lspconfig
		--
		-- LspInfoTitle { },
		-- LspInfoList { },
		-- LspInfoFiletype { },
		-- LspInfoTip { },
		LspInfoBorder({ FloatBorder }),

		--
		-- nvim-cmp
		--
		CmpItemAbbrDeprecated({ fg = c.bg_300, bg = "NONE", gui = "strikethrough" }),
		CmpItemAbbrMatch({ MatchedCharacters, bg = "NONE" }),
		CmpItemAbbrMatchFuzzy({ CmpItemAbbrMatch }),
		CmpItemMenu({ Description }),
		CmpItemKindText({ fg = "#cccccc", bg = "NONE" }),
		CmpItemKindMethod({ fg = "#b180d7", bg = "NONE" }),
		CmpItemKindFunction({ CmpItemKindMethod }),
		CmpItemKindConstructor({ CmpItemKindFunction }),
		CmpItemKindField({ fg = "#75beff", bg = "NONE" }),
		CmpItemKindVariable({ CmpItemKindField }),
		CmpItemKindClass({ fg = "#ee9d28", bg = "NONE" }),
		CmpItemKindInterface({ CmpItemKindField }),
		CmpItemKindModule({ CmpItemKindText }),
		CmpItemKindProperty({ CmpItemKindText }),
		CmpItemKindUnit({ CmpItemKindText }),
		CmpItemKindValue({ CmpItemKindText }),
		CmpItemKindEnum({ CmpItemKindClass }),
		CmpItemKindKeyword({ CmpItemKindText }),
		CmpItemKindSnippet({ CmpItemKindText }),
		CmpItemKindColor({ CmpItemKindText }),
		CmpItemKindFile({ CmpItemKindText }),
		CmpItemKindReference({ CmpItemKindText }),
		CmpItemKindFolder({ CmpItemKindText }),
		CmpItemKindEnumMember({ CmpItemKindField }),
		CmpItemKindConstant({ CmpItemKindText }),
		CmpItemKindStruct({ CmpItemKindText }),
		CmpItemKindEvent({ CmpItemKindClass }),
		CmpItemKindOperator({ CmpItemKindText }),
		CmpItemKindTypeParameter({ CmpItemKindText }),
		-- Predefined for the winhighlight config of cmp float window
		SuggestWidgetBorder({ FloatBorder }),
		SuggestWidgetSelect({ bg = c.bg_500 }),

		--
		-- Aerial
		--
		AerialTextIcon({ CmpItemKindText }),
		AerialMethodIcon({ CmpItemKindMethod }),
		AerialFunctionIcon({ CmpItemKindFunction }),
		AerialConstructorIcon({ CmpItemKindConstructor }),
		AerialFieldIcon({ CmpItemKindField }),
		AerialVariableIcon({ CmpItemKindVariable }),
		AerialClassIcon({ CmpItemKindClass }),
		AerialInterfaceIcon({ CmpItemKindInterface }),
		AerialModuleIcon({ CmpItemKindModule }),
		AerialPropertyIcon({ CmpItemKindProperty }),
		AerialUnitIcon({ CmpItemKindUnit }),
		AerialValueIcon({ CmpItemKindValue }),
		AerialEnumIcon({ CmpItemKindEnum }),
		AerialKeywordIcon({ CmpItemKindKeyword }),
		AerialSnippetIcon({ CmpItemKindSnippet }),
		AerialColorIcon({ CmpItemKindColor }),
		AerialFileIcon({ CmpItemKindFile }),
		AerialReferenceIcon({ CmpItemKindReference }),
		AerialFolderIcon({ CmpItemKindFolder }),
		AerialEnumMemberIcon({ CmpItemKindEnumMember }),
		AerialConstantIcon({ CmpItemKindConstant }),
		AerialStructIcon({ CmpItemKindStruct }),
		AerialEventIcon({ CmpItemKindEvent }),
		AerialOperatorIcon({ CmpItemKindOperator }),
		AerialTypeParameterIcon({ CmpItemKindTypeParameter }),

		--
		-- nvim-navic
		--
		NavicText({ Winbar }),
		NavicIconsFile({ CmpItemKindFile }),
		NavicIconsModule({ CmpItemKindModule }),
		NavicIconsNamespace({ NavicText }),
		NavicIconsPackage({ NavicText }),
		NavicIconsClass({ CmpItemKindClass }),
		NavicIconsMethod({ CmpItemKindMethod }),
		NavicIconsProperty({ CmpItemKindProperty }),
		NavicIconsField({ CmpItemKindField }),
		NavicIconsConstructor({ CmpItemKindConstructor }),
		NavicIconsEnum({ CmpItemKindEnum }),
		NavicIconsInterface({ CmpItemKindInterface }),
		NavicIconsFunction({ CmpItemKindFunction }),
		NavicIconsVariable({ CmpItemKindVariable }),
		NavicIconsConstant({ CmpItemKindConstant }),
		NavicIconsString({ NavicText }),
		NavicIconsNumber({ NavicText }),
		NavicIconsBoolean({ NavicText }),
		NavicIconsArray({ NavicText }),
		NavicIconsObject({ NavicText }),
		NavicIconsKey({ NavicText }),
		NavicIconsNull({ NavicText }),
		NavicIconsEnumMember({ CmpItemKindEnumMember }),
		NavicIconsStruct({ CmpItemKindStruct }),
		NavicIconsEvent({ CmpItemKindEvent }),
		NavicIconsOperator({ CmpItemKindOperator }),
		NavicIconsTypeParameter({ CmpItemKindTypeParameter }),
		NavicSeparator({ NavicText }),

		--
		-- Gitsigns
		--
		GitSignsAdd({ GutterGitAdded }),
		GitSignsChange({ GutterGitModified }),
		GitSignsDelete({ GutterGitDeleted }),
		GitSignsAddNr({ GitSignsAdd }),
		GitSignsChangeNr({ GitSignsChange }),
		GitSignsDeleteNr({ GitSignsDelete }),
		GitSignsAddLn({ DiffAdd }),
		GitSignsChangeLn({ DiffChange }),
		GitSignsDeleteLn({ DiffDelete }),
		GitSignsAddInline({ DiffTextAdded }),
		GitSignsChangeInline({ DiffTextChanged }),
		GitSignsDeleteInline({ DiffTextDeleted }),

		--
		-- vim-illuminate
		--
		IlluminatedWordText({ SelectionHighlightBackground }),
		IlluminatedWordRead({ SelectionHighlightBackground }),
		IlluminatedWordWrite({ SelectionHighlightBackground }),

		--
		-- Telescope
		--
		TelescopeBorder({ FloatBorder }),
		TelescopePromptBorder({ TelescopeBorder }),
		TelescopeResultsBorder({ TelescopePromptBorder }),
		TelescopePreviewBorder({ TelescopePromptBorder }),
		TelescopeSelection({ PmenuSel }),
		TelescopeSelectionCaret({ TelescopeSelection }),
		TelescopeMultiIcon({ fg = c.pink }),
		TelescopeMatching({ CmpItemAbbrMatch }),
		TelescopeNormal({ Normal }),
		TelescopePromptPrefix({ Icon }),

		--
		-- Harpoon
		--
		HarpoonBorder({ TelescopeBorder }),
		HarpoonWindow({ TelescopeNormal }),

		--
		-- fFHighlight
		--
		fFHintWords({ gui = "underline", sp = "yellow" }),
		fFHintCurrentWord({ gui = "undercurl", sp = "yellow" }),

		--
		-- indent-blankline
		--
		IblIndent({ fg = c.bg_100 }),
		IblScope({ fg = c.grey }),

		--
		-- hlslens
		--
		HlSearchNear({ IncSearch }),
		HlSearchLens({ Description }),
		HlSearchLensNear({ HlSearchLens }),

		--
		-- nvim-ufo
		--
		UfoPreviewBorder({ PeekViewBorder }),
		UfoPreviewNormal({ PeekViewNormal }),
		UfoPreviewCursorLine({ PeekViewCursorLine }),
		UfoFoldedFg({ fg = c.fg }),
		UfoFoldedBg({ bg = c.blue_500 }),
		UfoCursorFoldedLine({ bg = "#2F3C48", gui = "bold, italic" }),
		UfoPreviewSbar({ PeekViewNormal }),
		UfoPreviewThumb({ bg = "#394a4b" }),
		UfoFoldedEllipsis({ fg = "#989ca0" }),

		--
		-- nvim-bqf
		--
		BqfPreviewFloat({ PeekViewNormal }),
		BqfPreviewBorder({ PeekViewBorder }),
		BqfPreviewTitle({ PeekViewTitle }),
		BqfPreviewSbar({ PmenuSbar }),
		BqfPreviewThumb({ PmenuThumb }),
		BqfPreviewCursor({ Cursor }),
		BqfPreviewCursorLine({ PeekViewCursorLine }),
		BqfPreviewRange({ PeekViewMatchHighlight }),
		BqfPreviewBufLabel({ Description }),
		BqfSign({ fg = c.pink }),

		--
		-- mg979/tabline.nvim
		--
		TSelect({ TabLineSel }),
		TVisible({ TabLine }),
		THidden({ TabLine }),
		TExtra({ TabLine }),
		TSpecial({ TabLine }),
		TFill({ TabLineFill }),
		TCorner({ fg = c.fg, bg = c.bg_500 }),
		TNumSel({ TSelect }),
		TNum({ TabLine }),
		TSelectMod({ TSelect }),
		TVisibleMod({ TVisible }),
		THiddenMod({ THidden }),
		TExtraMod({ TExtra }),
		TSpecialMod({ TSpecial }),
		TSelectDim({ TSelect }),
		TVisibleDim({ TVisible }),
		THiddenDim({ THidden }),
		TExtraDim({ TExtra }),
		TSpecialDim({ TSpecial }),
		TSelectSep({ TabBorder }),
		TVisibleSep({ TabBorder }),
		THiddenSep({ TabBorder }),
		TExtraSep({ TabBorder }),
		TSpecialSep({ TabBorder }),

		--
		-- git-messenger.vim
		--
		gitmessengerHeader({ fg = c.blue_900 }), -- textLink.activeForeground
		gitmessengerPopupNormal({ NormalFloat }),
		gitmessengerHash({ NormalFloat }),
		gitmessengerHistory({ NormalFloat }),
		gitmessengerEmail({ NormalFloat }),

		--
		-- nvim-treesitter-context
		--
		TreesitterContext({ bg = c.bg_700 }),
		TreesitterContextLineNumber({ fg = c.bg_100 }), -- 30% darker based on LineNr
		TreesitterContextBottom({ gui = "underline", sp = FloatBorder.fg }),

		--
		-- nvim-scrollview
		--
		ScrollView({ ScrollbarSlider }),
		ScrollViewRestricted({ ScrollView }),
		ScrollViewConflictsTop({ DiffAdd }),
		ScrollViewConflictsMiddle({ DiffAdd }),
		ScrollViewConflictsBottom({ DiffAdd }),
		ScrollViewCursor({ CursorLineNr }),
		ScrollViewDiagnosticsError({ DiagnosticError }),
		ScrollViewDiagnosticsWarn({ DiagnosticWarn }),
		ScrollViewDiagnosticsHint({ DiagnosticHint }),
		ScrollViewDiagnosticsInfo({ DiagnosticInfo }),
		ScrollViewSearch({ fg = c.yellow_900 }),

		--
		-- vim-floaterm
		--
		Floaterm({ Normal }),
		FloatermBorder({ FloatBorder }),

		--
		-- quick-scope
		--
		QuickScopePrimary({ fg = c.pink_100, gui = "underline", sp = c.pink_100 }),
		QuickScopeSecondary({ fg = c.purple, gui = "underline", sp = c.purple }),
	}
end)
---@diagnostic enable

return theme
