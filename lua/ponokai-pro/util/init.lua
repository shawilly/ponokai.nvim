---@class Util
---@field class ponokai-pro.util.class
---@field devicons ponokai-pro.util.devicons
---@field extra ponokai-pro.util.extra
---@field theme ponokai-pro.util.theme
---@field ui ponokai-pro.util.ui
local M = {}

setmetatable(M, {
  __index = function(_, k)
    local mod = require("ponokai-pro.util." .. k)
    return mod
  end,
})

--- A logging function
--- @param msg string
--- @param level "debug"|"info"|"warn"|"error"
--- @param opts table|nil
function M.log(msg, level, opts)
  opts = opts or {}
  local log_level = vim.log.levels[level:upper()]
  if type(msg) == "table" then
    msg = table.concat(msg, "\n")
  end
  local nopts = { title = "Ponokai-pro" }
  if opts.once then
    return vim.schedule(function()
      vim.notify_once(msg, log_level, nopts)
    end)
  end
  vim.schedule(function()
    vim.notify(msg, log_level, nopts)
  end)
end

return M
