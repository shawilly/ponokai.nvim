local M = {}

--- @param c Colorscheme The color palette
--- @param config Config
function M.get(c, config)
  local inputValidation = c.inputValidation
  local isBackgroundClear = vim.tbl_contains(config.background_clear, "notify")

  local notify_groups = {
    NotifyERRORBorder = { fg = inputValidation.errorBorder },
    NotifyWARNBorder = { fg = inputValidation.warningBorder },
    NotifyINFOBorder = { fg = inputValidation.infoBorder },
    NotifyDEBUGBorder = { fg = inputValidation.debugBorder },
    NotifyTRACEBorder = { fg = inputValidation.traceBorder },
    NotifyERRORIcon = { fg = inputValidation.errorForeground },
    NotifyWARNIcon = { fg = inputValidation.warningForeground },
    NotifyINFOIcon = { fg = inputValidation.infoForeground },
    NotifyDEBUGIcon = { fg = inputValidation.debugForeground },
    NotifyTRACEIcon = { fg = inputValidation.traceForeground },
    NotifyERRORTitle = { link = "NotifyERRORIcon" },
    NotifyWARNTitle = { link = "NotifyWARNIcon" },
    NotifyINFOTitle = { link = "NotifyINFOIcon" },
    NotifyDEBUGTitle = { fg = inputValidation.debugForeground },
    NotifyTRACETitle = { fg = inputValidation.traceForeground },
    NotifyERRORBody = { link = "Normal" },
    NotifyWARNBody = { link = "Normal" },
    NotifyINFOBody = { link = "Normal" },
    NotifyDEBUGBody = { link = "Normal" },
    NotifyTRACEBody = { link = "Normal" },
    NotifyBackground = { link = "Normal" },
  }

  if not isBackgroundClear then
    local BORDER = "Border"
    local ICON = "Icon"
    local TITLE = "Title"
    local BODY = "Body"
    for group, hlValue in pairs(notify_groups) do
      if string.match(group, BORDER) then
        notify_groups[group] = {
          bg = c.notifications.background,
          fg = c.notifications.border,
        }
      end
      if string.match(group, ICON) or string.match(group, TITLE) then
        notify_groups[group] = vim.tbl_deep_extend("force", hlValue or {}, {
          bg = c.notifications.background,
        })
      end
      if string.match(group, BODY) or group == "NotifyBackground" then
        notify_groups[group] = {
          bg = c.notifications.background,
          fg = c.notifications.foreground,
        }
      end
    end
  end
  return notify_groups
end

return M
