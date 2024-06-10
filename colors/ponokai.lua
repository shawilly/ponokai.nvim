vim.opt.background = "dark"
vim.g.colors_name = "ponokai"
---@type nil
package.loaded["ponokai"] = nil
---@type nil
package.loaded["ponokai.init"] = nil
---@type nil
package.loaded["ponokai.theme"] = nil
require("lush")(require("ponokai.init").setup())
