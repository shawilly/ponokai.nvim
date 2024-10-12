local config = require("ponokai-pro.config")
local util = require("ponokai-pro.util")
local theme = require("ponokai-pro.theme")
local command = require("ponokai-pro.command")

---@class PonokaiPro
local M = {}

M.load = function()
  util.theme.load(theme.setup())
end

--- @param filter "pro" | "kitty"
M._load = function(filter)
  config.extend({ filter = filter })
  M.load()
end

M.setup = function(options)
  config.setup(options)
  command.create_filter_command()
end

return M
