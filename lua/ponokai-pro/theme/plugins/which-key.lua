local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
function M.get(c, config, _)
  local isBackgroundClear = vim.tbl_contains(config.background_clear, "which-key")
  local whichkey_bg = c.editorSuggestWidget.background
  local transparent_bg = c.editor.background
  local transparent_bg_border = c.base.dimmed2
  return {
    WhichKey = { fg = c.base.orange },
    WhichKeySeperator = { fg = c.base.red },
    WhichKeyGroup = { fg = c.base.magenta },
    WhichKeyDesc = { fg = c.base.yellow },
    WhichKeyNormal = { bg = isBackgroundClear and transparent_bg or whichkey_bg },
    WhichKeyBorder = isBackgroundClear and {
      bg = transparent_bg,
      fg = transparent_bg_border,
    } or {
      bg = whichkey_bg,
      fg = whichkey_bg,
    },
  }
end

return M
