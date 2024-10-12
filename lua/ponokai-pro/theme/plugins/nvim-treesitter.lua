local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
function M.get(c, config, _)
  local styles = config.styles
  local spec = {
    ---typescript
    ["@annotation"] = { fg = c.base.cyan, italic = styles.annotation.italic },
    -- ["@attribute"] = { fg = c.base.cyan },
    ["@boolean"] = { fg = c.base.magenta },
    ["@constant.builtin"] = { fg = c.base.magenta },
    ["@constructor"] = { fg = c.base.red },
    ["@conditional"] = { fg = c.base.red },
    ["@field"] = { fg = c.base.red },
    ["@function"] = { fg = c.base.green },
    ["@function.method.call"] = { fg = c.base.green }, -- Can be `green` or `white`. `green` is better.
    ["@include"] = { fg = c.base.red },
    ["@keyword"] = { fg = c.base.red, italic = styles.keyword.italic }, -- `export`, `class`, `implements`, `const`
    ["@keyword.function"] = { fg = c.base.cyan, bold = true, italic = styles.keyword.italic },
    ["@keyword.import"] = { fg = c.base.red }, -- `import`
    ["@keyword.operator"] = { fg = c.base.red },
    ["@keyword.return"] = { fg = c.base.red },
    ["@method.call"] = { fg = c.base.green },
    ["@number"] = { fg = c.base.magenta },
    ["@operator"] = { fg = c.base.red }, -- `=`, `=>`
    ["@parameter"] = { fg = c.base.blue, italic = styles.parameter.italic },
    ["@property"] = { fg = c.base.white },
    ["@punctuation.bracket"] = { fg = c.base.red }, -- `(`
    ["@punctuation.delimiter"] = { fg = c.base.dimmed2 }, -- `;`
    ["@punctuation.special"] = { fg = c.base.red }, -- `?` (e.g. {name?: string})
    ["@repeat"] = { fg = c.base.red },
    ["@string.documentation"] = { fg = c.base.dimmed3 },
    ["@string.escape"] = { fg = c.base.magenta },
    ["@tag"] = { fg = c.base.red },
    ["@tag.attribute"] = { fg = c.base.cyan, italic = styles.tag_attribute.italic },
    ["@tag.delimiter"] = { fg = c.base.dimmed2 }, -- `<`, `>` in `<div>`
    ["@type"] = { fg = c.base.cyan }, -- All types, interfaces, class names
    ["@type.builtin"] = { fg = c.base.cyan, italic = styles.type.italic },
    ["@type.qualifier"] = { fg = c.base.red, italic = styles.type.italic },
    ["@variable"] = { fg = c.base.white },
    ["@variable.builtin"] = { fg = c.base.dimmed1, italic = true },
    ["@variable.member"] = { fg = c.base.magenta }, -- class members
    ["@variable.parameter"] = { fg = c.base.blue, italic = true },
    ["@_isinstance"] = { fg = c.base.green },
    -- scss
    ["@keyword.scss"] = { fg = c.base.red },
    ["@function.scss"] = { fg = c.base.cyan },
    ["@property.scss"] = { fg = c.base.green },
    ["@string.scss"] = { fg = c.base.blue, italic = true },
    ["@number.scss"] = { fg = c.base.magenta },
    ["@type.scss"] = { fg = c.base.cyan },
    -- cpp
    ["@keyword.cpp"] = { fg = c.base.cyan, italic = styles.keyword.italic },
    ["@namespace.cpp"] = { fg = c.base.green },
    ["@operator.cpp"] = { fg = c.base.red },
    ["@type.cpp"] = { fg = c.base.blue, italic = styles.type.italic },
    ["@variable.cpp"] = { fg = c.base.white },
    ["@constant.cpp"] = { fg = c.base.cyan },
    ["@constant.macro.cpp"] = { fg = c.base.red },
    ["@punctuation.delimiter.cpp"] = { fg = c.sideBar.foreground },
    -- python
    ["@type.python"] = { fg = c.base.white }, -- Class name, bool, str, ...
    ["@keyword.coroutine.python"] = { fg = c.base.cyan },
    ["@keyword.exception.python"] = { fg = c.base.red, italic = false },
    ["@keyword.python"] = { fg = c.base.red, italic = styles.keyword.italic },
    ["@keyword.function.python"] = { fg = c.base.cyan, italic = styles.keyword.italic },
    ["@keyword.import.python"] = { fg = c.base.red },
    ["@keyword.type.python"] = { fg = c.base.cyan, italic = true },
    ["@attribute.python"] = { fg = c.base.green },
    ["@variable.builtin.python"] = { fg = c.editorSuggestWidget.foreground, italic = true },
    ["@variable.python"] = { fg = c.base.white },
    ["@variable.parameter.python"] = { fg = c.base.blue, italic = true },
    ["@variable.member.python"] = { fg = c.base.cyan }, -- Python attributes, self.__class__.__name__
    ["@field.python"] = { fg = c.base.white },
    ["@varibale.builtin.python"] = { fg = c.base.blue, italic = true },
    ["@constructor.python"] = { fg = c.base.green },
    ["@method.python"] = { fg = c.base.green },
    ["@function.builtin.python"] = { fg = c.base.cyan, italic = true },
    ["@exception.python"] = { fg = c.base.red, italic = true },
    ["@constant.python"] = { fg = c.base.magenta },
    ["@operator.python"] = { fg = c.base.red },
    ["@parameter.python"] = { fg = c.base.blue, italic = true },
    ["@string.escape.python"] = { fg = c.base.magenta },
    -- lua
    ["@variable.lua"] = { fg = c.base.white },
    ["@function.builtin.lua"] = { fg = c.base.green },
    ["@field.lua"] = { fg = c.base.white },
    ["@keyword.lua"] = { fg = c.base.red, italic = styles.keyword.italic },
    ["@keyword.function.lua"] = { fg = c.base.red },
    ["@conditional.lua"] = { fg = c.base.red },
    ["@namespace.lua"] = { fg = c.base.red },
    ["@comment.documentation.lua"] = { fg = c.base.cyan },
    ["@parameter.lua"] = { fg = c.base.blue, italic = true },
    -- latex
    ["@text.environment.latex"] = { fg = c.base.green },
    ["@text.environment.name.latex"] = { fg = c.base.blue, italic = true },
    ["@punctuation.special.latex"] = { fg = c.base.red },
    ["@text.math.latex"] = { fg = c.base.magenta },
    ["@text.strong.latex"] = { bold = true },
    ["@text.emphasis.latex"] = { italic = true },
    ["@string.latex"] = { fg = c.base.cyan },
    ["@function.macro.latex"] = { fg = c.base.green },
    -- Dockerfile
    ["@keyword.dockerfile"] = { fg = c.base.red },
    ["@lsp.type.class.dockerfile"] = { fg = c.base.cyan },
    ["@function.call.bash"] = { fg = c.base.green },
    ["@parameter.bash"] = { fg = c.base.white },
    -- Markdown
    ["@text.literal.block.markdown"] = { bg = c.editor.background },
    ["@text.strong.markdown_inline"] = { fg = c.base.white, bold = true },
    ["@text.emphasis.markdown_inline"] = { fg = c.base.white, italic = true },
    ["@text.literal.markdown_inline"] = { bg = c.base.dimmed4, fg = c.base.white },
    ["@text.quote.markdown"] = { bg = c.base.dimmed5, fg = c.base.white },
    ["@none.markdown"] = { bg = c.base.black },
    ["@text.uri.markdown_inline"] = { fg = c.base.green, sp = c.base.green, underline = true },
    ["@text.reference.markdown_inline"] = { fg = c.base.red },
    ["@punctuation.special.markdown"] = { fg = c.base.dimmed2 },
    ["@conceal.markdown"] = { bg = c.base.black },
    ["@markup.raw.delimiter.markdown"] = { bg = c.base.black, fg = c.base.dimmed2 },
    ["@markup.raw.block.markdown"] = { bg = c.base.black },
    ["@markup.link.label.markdown_inline"] = { fg = c.base.red },
    ["@markup.link.url.markdown_inline"] = { fg = c.base.green, underline = true },
    ["@markup.strong.markdown_inline"] = { bold = true },
    ["@markup.italic.markdown_inline"] = { italic = true },
    ["@markup.raw.markdown_inline"] = { bg = c.base.dimmed4, fg = c.base.white },
    -- Golang
    ["@keyword.function.go"] = { fg = c.base.red },
    ["@module.go"] = { fg = c.base.white },
    ["@string.escape.go"] = { fg = c.base.magenta },
    -- Yaml
    ["@property.yaml"] = { fg = c.base.red },
    ["@string.yaml"] = { fg = c.base.yellow },
    ["@number.yaml"] = { fg = c.base.magenta },
    ["@punctuation.special.yaml"] = { fg = c.base.white },
  }
  for i = 1, 9 do
    spec["@markup.heading." .. i .. ".markdown"] = { fg = c.base.yellow }
    spec["@markup.heading." .. i .. ".marker.markdown"] = { fg = c.base.dimmed2 }
  end
  return spec
end

return M
