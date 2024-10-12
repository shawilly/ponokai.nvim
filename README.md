<p align="center">
  <a href="https://github.com/shawilly/ponokai.nvim/stargazers"><img src="https://img.shields.io/github/stars/shawilly/ponokai.nvim?colorA=192330&colorB=f8e7b0&style=for-the-badge"></a>
  <a href="https://github.com/shawilly/ponokai.nvim/issues"><img src="https://img.shields.io/github/issues/shawilly/ponokai.nvim?colorA=192330&colorB=98d4e7&style=for-the-badge"></a>
  <a href="https://github.com/shawilly/ponokai.nvim/contributors"><img src="https://img.shields.io/github/contributors/shawilly/ponokai.nvim?colorA=192330&colorB=b4e49a&style=for-the-badge"></a>
  <a href="https://github.com/shawilly/ponokai.nvim/network/members"><img src="https://img.shields.io/github/forks/shawilly/ponokai.nvim?colorA=192330&colorB=bdb2ff&style=for-the-badge"></a>
</p>

<div align="center">
<h1>still in beta, you can use the vim version of ponokai here
https://github.com/shawilly/ponokai</h1>
 <br>
 <a href="https://github.com/shawilly/ponokai.nvim">
  <img src="logo.svg" width="800" height="400" alt="Click to see the source">
 </a>
 <br>
</div>

Find out more here [ponokai.pro](https://ponokai.pro/)

![ponokai-pro-macbook](https://user-images.githubusercontent.com/80513079/218453999-87c957f1-658d-49a6-bf67-291d3e46fa9a.png)

## ⭐ Pro

![pro](https://user-images.githubusercontent.com/80513079/209659184-ed5a28c3-cb7f-4de7-8f7c-5d206dc11540.png)

## 🐈 Kitty

![kitty](https://user-images.githubusercontent.com/80513079/209659153-9362a05f-2b7f-4b36-acf1-d13bef6a9118.png)

### 🔌 Plugin support

- [alpha-nvim](https://github.com/goolord/alpha-nvim)
- [bufferLine.nvim](https://github.com/akinsho/bufferline.nvim)
- [Cmp](https://github.com/hrsh7th/nvim-cmp)
- [vim-illuminate](https://github.com/RRethy/vim-illuminate)
- [indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim)
- [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)
- [nvim-notify](https://github.com/rcarriga/nvim-notify)
- [renamer.nvim](https://github.com/filipdutescu/renamer.nvim)
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [which-key.nvim](https://github.com/folke/which-key.nvim)
- [breadcrumb.nvim](https://github.com/loctvl842/breadcrumb.nvim)
- [nvim-navic](https://github.com/SmiteshP/nvim-navic)
- [wilder.nvim](https://github.com/gelguy/wilder.nvim)
- [Lightline](https://github.com/itchyny/lightline.vim)
- [barbecue.nvim](https://github.com/utilyre/barbecue.nvim)
- [dashboard-nvim](https://github.com/glepnir/dashboard-nvim)
- [mason.nvim](https://github.com/williamboman/mason.nvim)
- [nvim-ts-rainbow2](https://github.com/HiPhish/nvim-ts-rainbow2)
- [rainbow-delimeters.nvim](https://gitlab.com/HiPhish/rainbow-delimiters.nvim)

## 📦 Installation

[vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'loctvl842/ponokai-pro.nvim'
```

[packer](https://github.com/wbthomason/packer.nvim)

```lua
use {
  "loctvl842/ponokai-pro.nvim",
  config = function()
    require("ponokai-pro").setup()
  end
}
```

## 🔨 Configuration

There are several themes included in this plugin.

- [Pro](#-pro) – Ponokai Pro _(default)_
- [Kitty](#-kitty) – Ponokai Kitty

Example configuration:

```lua
require("ponokai-pro").setup({
  transparent_background = false,
  terminal_colors = true,
  devicons = true, -- highlight the icons of `nvim-web-devicons`
  styles = {
    comment = { italic = true },
    keyword = { italic = true }, -- any other keyword
    type = { italic = true }, -- (preferred) int, long, char, etc
    storageclass = { italic = true }, -- static, register, volatile, etc
    structure = { italic = true }, -- struct, union, enum, etc
    parameter = { italic = true }, -- parameter pass in function
    annotation = { italic = true },
    tag_attribute = { italic = true }, -- attribute of tag in reactjs
  },
  filter = "pro", -- pro | kitty
  -- Enable this will disable filter option
  day_night = {
    enable = false, -- turn off by default
    day_filter = "pro", -- pro | kitty
    night_filter = "kitty", -- pro | kitty
  },
  inc_search = "background", -- underline | background
  background_clear = {
    -- "float_win",
    "toggleterm",
    "telescope",
    -- "which-key",
    "renamer",
    "notify",
    -- "nvim-tree",
    -- "neo-tree",
    -- "bufferline", -- better used if background of `neo-tree` or `nvim-tree` is cleared
  },-- "float_win", "toggleterm", "telescope", "which-key", "renamer", "neo-tree", "nvim-tree", "bufferline"
  plugins = {
    bufferline = {
      underline_selected = false,
      underline_visible = false,
    },
    indent_blankline = {
      context_highlight = "default", -- default | pro
      context_start_underline = false,
    },
  },
  ---@param c Colorscheme
  override = function(c) end,
  ---@param cs Colorscheme
  ---@param p ColorschemeOptions
  ---@param Config PonokaiProOptions
  ---@param hp Helper
  override = function(cs: Colorscheme, p: ColorschemeOptions, Config: PonokaiProOptions, hp: Helper) end,
})
```

- Check my [nvim](https://github.com/loctvl842/nvim) to see my plugins setup for `border` if you want to set `background_clear`

For example:

<details>
  <summary>float_win</summary>

```lua
require("ponokai-pro").setup({
    -- ... your config
    background_clear = { "float_win" }
    -- ... your config
})

require("cmp").setup({
    -- ... your config
    window = {
      border = "rounded",
    }
    completion = {
        border = "rounded",
    }
    -- ... your config
})
```

- With the above config:
  ![bg_clear_cmp](https://user-images.githubusercontent.com/80513079/218801625-a2b43cb0-175c-4463-9290-a361deb41f6a.png)

- With the default config:
  ![default_cmp](https://user-images.githubusercontent.com/80513079/218804686-834c624d-d9bf-45a1-a1bd-a6d05e70e1b8.png)

</details>

<details>
  <summary>Telescope</summary>

```lua
require("ponokai-pro").setup({
    -- ... your config
    background_clear = {}
    -- ... your config
})

require("telescope").setup({
    -- ... your config
    defaults = {
      borderchars = { "█", " ", "▀", "█", "█", " ", " ", "▀" },
    }
    -- ... your config
})
```

- With the above config:

![removed_border_telescope](https://user-images.githubusercontent.com/80513079/218804055-a5cbf9d4-5c0f-4c0f-9cfe-5362af3714e8.png)

- With the default config:
  ![default_telescope](https://user-images.githubusercontent.com/80513079/218803566-56852087-8d3c-410c-854a-89bb49f8d981.png)

</details>

## 📚 Usage

- Enable this colorscheme by using the following command after `setup`:

```vim
" Vim Script
colorscheme ponokai-pro
```

```lua
require("ponokai-pro").setup({
  -- ... your config
})
-- lua
vim.cmd([[colorscheme ponokai-pro]])
```

- To enable `ponokai-pro` for `Lualine`:

```lua
require('lualine').setup {
  options = {
    -- ...
    theme = 'ponokai-pro'
    -- ...
  }
}
```

- To enable `ponokai-pro` for `barbecue`:

```lua
require('barbecue').setup {
  -- ...
  theme = 'ponokai-pro'
  -- ...
}

```

- To enable `ponokai-pro` for `lightline`:

```vim
" Vim Script
let g:lightline = {'colorscheme': 'ponokaipro'}
```

- Override function for customizing the final color scheme:

```lua
require("ponokai-pro").setup({
    -- ...
    override = function()
      return {
          Normal = { bg = "#000000" }
        }
    end
    -- ...
  })
```

- Customize your own palette:

This is a sample config to use `Tokyonight` as the palette:

```lua
require("ponokai-pro").setup({
    -- ...
    --- @param filter "pro" | "kitty"
    override = function(c)
      return {
        IndentBlanklineChar = { fg = c.base.dimmed4 },
      }
    end,
    overridePalette = function(filter)
      return {
        dark2 = "#101014",
        dark1 = "#16161E",
        background = "#1A1B26",
        text = "#C0CAF5",
        red = "#f7768e",
        orange = "#7aa2f7",
        yellow = "#e0af68",
        green = "#9ece6a",
        blue = "#0DB9D7",
        purple = "#9d7cd8",
        dimmed1 = "#737aa2",
        dimmed2 = "#787c99",
        dimmed3 = "#363b54",
        dimmed4 = "#363b54",
        dimmed5 = "#16161e",
      }
    end
    -- ...
  })
```

- Customize the scheme:

This is a sample config to use a darker background for almost all supported plugins:

```lua
require("ponokai-pro").setup({
    -- ...
    overrideScheme = function(cs, p, config, hp)
      local cs_override = {}
      local calc_bg = hp.blend(p.background, 0.75, '#000000')

      cs_override.editor = {
        background = calc_bg,
      }
      return cs_override
    end
    -- ...
  })
```

## 🔧 Command

- run command `PonokaiProSelect` to launch a menu to choose theme filter (required: [nui.nvim](https://github.com/MunifTanjim/nui.nvim))
- or we can run command `PonokaiPro` with parameter to change theme filter: For example:
  > `PonokaiPro classic`
