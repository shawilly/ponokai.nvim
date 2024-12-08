local M = {}

--- @param c Colorscheme The color palette
function M.get(c, _, _)
  return {
    NavicIconsArray = { fg = c.base.red },
    NavicIconsBoolean = { fg = c.base.red },
    NavicIconsClass = { fg = c.base.cyan },
    NavicIconsColor = { fg = c.base.magenta },
    NavicIconsConstant = { fg = c.base.magenta },
    NavicIconsConstructor = { fg = c.base.green },
    NavicIconsEnum = { fg = c.base.orange },
    NavicIconsEnumMember = { fg = c.base.orange },
    NavicIconsEvent = { fg = c.base.orange },
    NavicIconsField = { fg = c.base.orange },
    NavicIconsFile = { fg = c.editorLineNumber.activeForeground },
    NavicIconsFolder = { fg = c.editorLineNumber.activeForeground },
    NavicIconsFunction = { fg = c.base.green },
    NavicIconsInterface = { fg = c.base.cyan },
    NavicIconsKey = { fg = c.base.orange },
    NavicIconsKeyword = { fg = c.base.red },
    NavicIconsMethod = { fg = c.base.green },
    NavicIconsModule = { fg = c.base.cyan },
    NavicIconsNamespace = { fg = c.base.cyan },
    NavicIconsNull = { fg = c.base.magenta },
    NavicIconsNumber = { fg = c.base.magenta },
    NavicIconsObject = { fg = c.base.cyan },
    NavicIconsOperator = { fg = c.base.red },
    NavicIconsPackage = { fg = c.base.magenta },
    NavicIconsProperty = { fg = c.base.orange },
    NavicIconsReference = { fg = c.base.magenta },
    NavicIconsSnippet = { fg = c.base.green },
    NavicIconsString = { fg = c.base.yellow },
    NavicIconsStruct = { fg = c.base.red },
    NavicIconsText = { fg = c.base.yellow },
    NavicIconsTypeParameter = { fg = c.base.orange },
    NavicIconsUnit = { fg = c.base.magenta },
    NavicIconsVariable = { fg = c.base.cyan },
  }
end

return M
