local util = require("ponokai-pro.util")
local config = require("ponokai-pro.config")

local M = {}

M.create_filter_command = function()
  local cmd = vim.api.nvim_create_user_command

  cmd("PonokaiProSelect", function()
    local menu = util.ui.create_menu("Set ponokai filter", {
      "pro",
      "kitty",
    }, function(item)
      local filter = item.value
      config.extend({ filter = filter })
      vim.cmd([[colorscheme ponokai-pro]])
    end)
    assert(menu, "Error: Fail to create menu")
    menu:mount()
  end, { nargs = 0 })

  cmd("PonokaiPro", function(opts)
    local filter = opts.args
    config.extend({ filter = filter })
    vim.cmd([[colorscheme ponokai-pro]])
  end, {
    nargs = 1,
    complete = function()
      return {
        "pro",
        "kitty",
      }
    end,
  })
end

return M
