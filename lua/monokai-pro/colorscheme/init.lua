local Util = require("monokai-pro.util")
local Config = require("monokai-pro.config")

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

local hp = require("monokai-pro.color_helper")

---@param filter Filter
---@return ColorschemeOptions
M.get = function(filter)
  local filters = { "classic", "machine", "octagon", "pro", "ristretto", "spectrum" }

  if not vim.tbl_contains(filters, filter) then
    local msg = 'Invalid filter, expected "classic", "machine", "octagon", "pro", "ristretto" or "spectrum"'
    local level = "info"
    filter = "pro"
    Util.log(msg, level)
  end

  M.filter = filter

  ---@module "monokai-pro.colorscheme.palette.pro"
  local monokai_palette = require("monokai-pro.colorscheme.palette." .. M.filter)
  local p =
    vim.tbl_deep_extend("force", monokai_palette, Config.overridePalette and Config.overridePalette(filter) or {})

  cs.editor = {
    background = Config.transparent_background and "NONE" or p.background,
    foreground = p.text,
    lineHighlightBackground = hp.blend(p.text, 0.05, p.background),
    selectionBackground = hp.blend(p.dimmed1, 0.15, p.background),
    findMatchBackground = hp.blend(p.text, 0.15, p.background),
    findMatchBorder = p.accent3,
    findMatchHighlightBackground = hp.blend(p.text, 0.15, p.background),
    foldBackground = hp.blend(p.text, 0.1, p.background),
    wordHighlightBackground = hp.blend(p.text, 0.15, p.background),
    selectionHighlightBackground = hp.blend(p.text, 0.15, p.background),
    wordHighlightStrongBackground = hp.blend(p.text, 0.15, p.background),
  }

  cs.editorLineNumber = {
    foreground = p.dimmed4,
    activeForeground = p.dimmed1,
  }

  cs.editorHoverWidget = {
    background = p.dimmed5,
    border = p.background,
  }

  cs.editorSuggestWidget = {
    background = p.dimmed5,
    border = p.dimmed5,
    foreground = p.dimmed1,
    highlightForeground = p.text,
    selectedBackground = p.dimmed3,
  }

  cs.editorIndentGuide = {
    background = p.dimmed5,
    activeBackground = p.dimmed3,
  }

  cs.editorInlayHint = {
    background = hp.blend(p.accent3, 0.1, p.background),
    foreground = hp.lighten(p.dimmed2, 3),
  }

  cs.editorGutter = {
    addedBackground = p.accent4,
    deletedBackground = p.accent1,
    modifiedBackground = p.accent2,
  }

  cs.sideBar = {
    background = p.dark1,
    foreground = p.dimmed2,
  }

  cs.sideBarTitle = {
    foreground = p.dimmed4,
  }

  cs.list = {
    activeSelectionBackground = hp.blend(p.text, 0.11, cs.sideBar.background),
  }

  cs.sideBarSectionHeader = {
    background = p.dark1,
    foreground = p.dimmed1,
  }

  cs.breadcrumb = {
    foreground = p.dimmed2,
  }

  cs.button = {
    background = p.dimmed5,
    foreground = p.dimmed1,
    hoverBackground = p.dimmed4,
    separator = p.background,
  }

  cs.scrollbarSlider = {
    hoverBackground = hp.blend(p.dimmed1, 0.15, p.background),
  }

  cs.gitDecoration = {
    addedResourceForeground = p.line_added,
    conflictingResourceForeground = p.accent2,
    deletedResourceForeground = p.accent1,
    ignoredResourceForeground = p.dimmed4,
    modifiedResourceForeground = p.accent3,
    stageDeletedResourceForeground = p.accent1,
    stageModifiedResourceForeground = p.accent3,
    untrackedResourceForeground = p.dimmed2,
  }

  cs.inputValidation = {
    errorBackground = p.dimmed5,
    errorBorder = p.accent1,
    errorForeground = p.accent1,
    infoBackground = p.dimmed5,
    infoBorder = p.accent5,
    infoForeground = p.accent5,
    warningBackground = p.dimmed5,
    warningBorder = p.accent2,
    warningForeground = p.accent2,
  }

  cs.errorLens = {
    errorBackground = hp.blend(p.accent1, 0.1),
    errorForeground = p.accent1,
    warningBackground = hp.blend(p.accent2, 0.1),
    warningForeground = p.accent2,
    infoBackground = hp.blend(p.accent5, 0.1),
    infoForeground = p.accent5,
    hintBackground = hp.blend(p.accent5, 0.1),
    hintForeground = p.accent5,
  }

  cs.terminal = {
    background = p.dimmed5,
    foreground = p.text,
  }

  cs.terminalCursor = {
    background = "#ffffff",
    foreground = p.text,
  }

  cs.editorGroupHeader = {
    tabsBackground = p.dark1,
    tabsBorder = p.dark1,
  }

  cs.tab = {
    activeBackground = Config.transparent_background and "NONE" or p.background,
    activeBorder = p.accent3,
    activeForeground = p.accent3,
    inactiveBackground = hp.lighten(p.background, 15),
    inactiveForeground = p.dimmed2,
    unfocusedActiveBackground = p.background,
    unfocusedActiveBorder = p.dimmed2,
    unfocusedActiveForeground = p.dimmed1,
  }

  cs.statusBar = {
    background = p.dark2,
    foreground = p.dimmed3,
    activeForeground = p.dimmed1,
  }

  cs.diffEditor = {
    insertedLineBackground = hp.blend(p.accent4, 0.1, p.dark1),
    removedLineBackground = hp.blend(p.accent1, 0.1, p.dark1),
    modifiedLineBackground = hp.blend(p.accent2, 0.1, p.dark1),
  }

  cs.diffEditorOverview = {
    insertedForeground = hp.blend(p.accent4, 0.65, cs.diffEditor.insertedLineBackground),
    removedForeground = hp.blend(p.accent1, 0.65, cs.diffEditor.removedLineBackground),
    modifiedForeground = hp.blend(p.accent2, 0.65, cs.diffEditor.modifiedLineBackground),
  }

  cs.notifications = {
    background = p.dimmed5,
    border = p.dimmed5,
    foreground = p.dimmed1,
  }
  cs.notificationsErrorIcon = {
    foreground = p.accent1,
  }
  cs.notificationsInfoIcon = {
    foreground = p.accent5,
  }
  cs.notificationsWarningIcon = {
    foreground = p.accent2,
  }

  cs.base = {
    dark = p.dark2,
    black = p.dark1,
    red = p.accent1,
    green = p.accent4,
    yellow = p.accent3,
    blue = p.accent2,
    magenta = p.accent6,
    cyan = p.accent5,
    white = p.text,
    dimmed1 = p.dimmed1,
    dimmed2 = p.dimmed2,
    dimmed3 = p.dimmed3,
    dimmed4 = p.dimmed4,
    dimmed5 = p.dimmed5,
  }

  cs = vim.tbl_deep_extend("force", cs, Config.overrideScheme and Config.overrideScheme(cs, p, Config, hp) or {})

  return cs
end

return M
