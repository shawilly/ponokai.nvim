local Util = require("ponokai-pro.util")
local Config = require("ponokai-pro.config")

---@class ColorschemeOptions
local cs = {}

---@class Colorscheme: ColorschemeOptions
local M = setmetatable({
  filter = Config.filter,
}, {
  __index = function(m, k)
    local color = rawget(cs or {}, k)
    if color == nil then
      cs = m()
    end
    return rawget(cs or {}, k)
  end,
  __call = function(t, ...)
    return t.get(...)
  end,
})

local hp = require("ponokai-pro.color_helper")

---@param filter Filter
---@return ColorschemeOptions
M.get = function(filter)
  local filters = { "pro", "kitty" }

  if not vim.tbl_contains(filters, filter) then
    local msg = 'Invalid filter, expected "pro", or "kitty"'
    local level = "info"
    filter = "pro"
    Util.log(msg, level)
  end

  M.filter = filter

  ---@module "ponokai-pro.colorscheme.palette.pro"
  local ponokai_palette = require("ponokai-pro.colorscheme.palette." .. M.filter)
  local colors =
    vim.tbl_deep_extend("force", ponokai_palette, Config.overridePalette and Config.overridePalette(filter) or {})

  cs.editor = {
    background = Config.transparent_background and "NONE" or colors.background,
    foreground = colors.text,
    lineHighlightBackground = hp.blend(colors.text, 0.05, colors.background),
    selectionBackground = hp.blend(colors.dimmed1, 0.15, colors.background),
    findMatchBackground = hp.blend(colors.text, 0.15, colors.background),
    findMatchBorder = colors.yellow,
    findMatchHighlightBackground = hp.blend(colors.text, 0.15, colors.background),
    foldBackground = hp.blend(colors.text, 0.1, colors.background),
    wordHighlightBackground = hp.blend(colors.text, 0.15, colors.background),
    selectionHighlightBackground = hp.blend(colors.text, 0.15, colors.background),
    wordHighlightStrongBackground = hp.blend(colors.text, 0.15, colors.background),
  }

  cs.editorLineNumber = {
    foreground = colors.dimmed3,
    activeForeground = colors.orange,
  }

  cs.editorHoverWidget = {
    background = colors.dimmed5,
    border = colors.background,
  }

  cs.editorSuggestWidget = {
    background = colors.dimmed5,
    border = colors.dimmed5,
    foreground = colors.dimmed1,
    highlightForeground = colors.text,
    selectedBackground = colors.dimmed3,
  }

  cs.editorIndentGuide = {
    background = colors.dimmed5,
    activeBackground = colors.dimmed3,
  }

  cs.editorInlayHint = {
    background = hp.blend(colors.yellow, 0.1, colors.background),
    foreground = hp.lighten(colors.dimmed2, 3),
  }

  cs.editorGutter = {
    addedBackground = colors.green,
    deletedBackground = colors.red,
    modifiedBackground = colors.orange,
  }

  cs.sideBar = {
    background = colors.dark1,
    foreground = colors.dimmed2,
  }

  cs.sideBarTitle = {
    foreground = colors.dimmed4,
  }

  cs.list = {
    activeSelectionBackground = hp.blend(colors.text, 0.11, cs.sideBar.background),
  }

  cs.sideBarSectionHeader = {
    background = colors.dark1,
    foreground = colors.dimmed1,
  }

  cs.breadcrumb = {
    foreground = colors.dimmed2,
  }

  cs.button = {
    background = colors.dimmed5,
    foreground = colors.dimmed1,
    hoverBackground = colors.dimmed4,
    separator = colors.background,
  }

  cs.scrollbarSlider = {
    hoverBackground = hp.blend(colors.dimmed1, 0.15, colors.background),
  }

  cs.gitDecoration = {
    addedResourceForeground = colors.git.line_added,
    conflictingResourceForeground = colors.git.modified,
    deletedResourceForeground = colors.git.line_deleted,
    ignoredResourceForeground = colors.dimmed4,
    modifiedResourceForeground = colors.yellow,
    stageDeletedResourceForeground = colors.red,
    stageModifiedResourceForeground = colors.yellow,
    untrackedResourceForeground = colors.dimmed2,
  }

  cs.inputValidation = colors.diagnostics

  cs.errorLens = {
    errorBackground = hp.blend(colors.red, 0.1),
    errorForeground = colors.red,
    warningBackground = hp.blend(colors.orange, 0.1),
    warningForeground = colors.orange,
    infoBackground = hp.blend(colors.blue, 0.1),
    infoForeground = colors.blue,
    hintBackground = hp.blend(colors.blue, 0.1),
    hintForeground = colors.blue,
  }

  cs.terminal = {
    background = colors.dimmed5,
    foreground = colors.text,
  }

  cs.terminalCursor = {
    background = "#ffffff",
    foreground = colors.text,
  }

  cs.editorGroupHeader = {
    tabsBackground = colors.dark1,
    tabsBorder = colors.dark1,
  }

  cs.tab = {
    activeBackground = Config.transparent_background and "NONE" or colors.background,
    activeBorder = colors.yellow,
    activeForeground = colors.yellow,
    inactiveBackground = hp.lighten(colors.background, 15),
    inactiveForeground = colors.dimmed2,
    unfocusedActiveBackground = colors.background,
    unfocusedActiveBorder = colors.dimmed2,
    unfocusedActiveForeground = colors.dimmed1,
  }

  cs.statusBar = {
    background = colors.dark2,
    foreground = colors.dimmed3,
    activeForeground = colors.dimmed1,
  }

  cs.diffEditor = {
    insertedLineBackground = hp.blend(colors.green, 0.1, colors.dark1),
    removedLineBackground = hp.blend(colors.red, 0.1, colors.dark1),
    modifiedLineBackground = hp.blend(colors.orange, 0.1, colors.dark1),
  }

  cs.diffEditorOverview = {
    insertedForeground = hp.blend(colors.green, 0.65, cs.diffEditor.insertedLineBackground),
    removedForeground = hp.blend(colors.red, 0.65, cs.diffEditor.removedLineBackground),
    modifiedForeground = hp.blend(colors.orange, 0.65, cs.diffEditor.modifiedLineBackground),
  }

  cs.notifications = {
    background = colors.dimmed5,
    border = colors.dimmed5,
    foreground = colors.dimmed1,
  }
  cs.notificationsErrorIcon = {
    foreground = colors.diagnostics.errorForeground,
    background = colors.diagnostics.errorBackground,
    border = colors.diagnostics.errorBorder,
  }
  cs.notificationsInfoIcon = {
    foreground = colors.diagnostics.infoForeground,
    background = colors.diagnostics.infoBackground,
    border = colors.diagnostics.infoForeground,
  }
  cs.notificationsWarningIcon = {
    foreground = colors.diagnostics.warningForeground,
    background = colors.diagnostics.warningBackground,
    border = colors.diagnostics.warningBorder,
  }

  cs.base = {
    dark = colors.dark2,
    black = colors.dark1,
    red = colors.red,
    green = colors.green,
    yellow = colors.yellow,
    blue = colors.orange,
    magenta = colors.purple,
    cyan = colors.blue,
    white = colors.text,
    dimmed1 = colors.dimmed1,
    dimmed2 = colors.dimmed2,
    dimmed3 = colors.dimmed3,
    dimmed4 = colors.dimmed4,
    dimmed5 = colors.dimmed5,
  }

  cs = vim.tbl_deep_extend("force", cs, Config.overrideScheme and Config.overrideScheme(cs, colors, Config, hp) or {})

  return cs
end

return M
