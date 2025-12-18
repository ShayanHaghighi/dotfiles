return {

  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({})
    end,
  }, -- nvim status line

  { -- bufferlines (tabs)
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "RRethy/base16-nvim", "nvim-tree/nvim-web-devicons" },
    config = function()
      require("bufferline").setup({
        options = {
          diagnostics = "nvim_lsp",
          diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local s = " "
            for e, n in pairs(diagnostics_dict) do
              local sym = e == "error" and " " or (e == "warning" and " " or " ")
              s = s .. n .. sym
            end
            return s
          end,
          indicator = {
            style = "underline",
          },
          separator_style = "thin", -- "thin", "slant", or "padded_slant"
          show_buffer_close_icons = false,
          show_close_icon = false,
          always_show_bufferline = false,
        },
      })

      -- Optional keymaps for tab switching
      vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next tab" })
      vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Prev tab" })
    end,
  },
}
