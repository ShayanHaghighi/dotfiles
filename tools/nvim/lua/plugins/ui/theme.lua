return {

  {
    enabled = false,
    "RRethy/base16-nvim",
    lazy = false,
    config = function()
      local base16 = require("base16-colorscheme")
      base16.setup({

        -- Start flavours
        base00 = "#1e1e2e",
        base01 = "#181825",
        base02 = "#313244",
        base03 = "#45475a",
        base04 = "#585b70",
        base05 = "#cdd6f4",
        base06 = "#f5e0dc",
        base07 = "#b4befe",
        base0F = "#f38ba8",
        base09 = "#fab387",
        base0A = "#f9e2af",
        base0B = "#a6e3a1",
        base0C = "#94e2d5",
        base0D = "#89b4fa",
        base0E = "#cba6f7",
        base08 = "#f2cdcd",
        -- End flavours
      })
      base16.with_config({
        telescope = true,
        indentblankline = true,
        notify = true,
        ts_rainbow = true,
        cmp = true,
        illuminate = true,
        dapui = true,
      })
    end,
  },
  {
    "catppuccin/nvim",
    integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
    },
    flavor = "mocha",
    float = {
      transparent = true,
    },
    transparent_background = true,
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd("colorscheme catppuccin-mocha")
    end,
  },
}
