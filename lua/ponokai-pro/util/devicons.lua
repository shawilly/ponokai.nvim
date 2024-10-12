local Util = require("ponokai-pro.util")

---@class ponokai-pro.util.devicons
local M = {}

--- Get the web-devicon
---@param extension string example: "txt", "lua", "python"
---@return PonokaiProIcon?
function M.get(filename, extension)
  local icon_ok, webDevicons = pcall(require, "nvim-web-devicons")
  if not icon_ok then
    return
  end
  local _, icon_hl_name = webDevicons.get_icon(filename, extension, { default = true })
  local _, icon_color = webDevicons.get_icon_color(filename, extension, { default = true })

  return {
    hl_name = icon_hl_name,
    color = icon_color,
  }
end

return M
