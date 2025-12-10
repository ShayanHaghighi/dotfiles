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
        base08 = "#f38ba8",
        base09 = "#fab387",
        base0A = "#f9e2af",
        base0B = "#a6e3a1",
        base0C = "#94e2d5",
        base0D = "#89b4fa",
        base0E = "#cba6f7",
        base0F = "#f2cdcd",
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
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      local nvim_tree = require("nvim-tree")
      nvim_tree.setup({
        on_attach = on_attach,
        update_cwd = true,
        update_focused_file = {
          enable = true,
          update_cwd = true,
        },
        hijack_cursor = true,
        view = {
          side = "left",
          width = 35,
        },
        renderer = {
          highlight_git = true, -- color git status
          highlight_opened_files = "all",
          highlight_modified = "icon",
          root_folder_label = ":t", -- shorten root folder name
          full_name = false,
          indent_markers = { enable = true },
          add_trailing = false,
          icons = {
            webdev_colors = true,
            git_placement = "after",
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
            },
            glyphs = {
              default = "󰈙",
              symlink = "",
              folder = {
                arrow_closed = "",
                arrow_open = "",
                default = "",
                open = "",
                empty = "",
                empty_open = "",
                symlink = "",
              },
              git = {
                unstaged = "M",
                staged = "S",
                unmerged = "",
                renamed = "➜",
                untracked = "U",
                deleted = "D",
                ignored = "◌",
              },
            },
          },
        },
      })

      vim.cmd([[
      hi NvimTreeGitNewIcon guifg=#ff4444

      hi NvimTreeGitStagedIcon guifg=#00ff7f

      hi NvimTreeGitDirtyIcon guifg=#ffb347
        ]])
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = false,
    priority = 1000,
    config = function()
      require("nvim-web-devicons").setup({
        override = {},
        color_icons = true,
        default = true,
        strict = true,
      })
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({})
    end,
  }, -- nvim status line

  {  -- bufferlines (tabs)
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
          separator_style = "slant", -- "thin", "slant", or "padded_slant"
          show_buffer_close_icons = false,
          show_close_icon = false,
          always_show_bufferline = true,
        },
      })

      -- Optional keymaps for tab switching
      vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next tab" })
      vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Prev tab" })
    end,
  },
  { -- smart window tiling
    "mrjones2014/smart-splits.nvim",
    config = function()
      local splits = require("smart-splits")

      -- Movement between splits
      vim.keymap.set("n", "<C-h>", splits.move_cursor_left)
      vim.keymap.set("n", "<C-j>", splits.move_cursor_down)
      vim.keymap.set("n", "<C-k>", splits.move_cursor_up)
      vim.keymap.set("n", "<C-l>", splits.move_cursor_right)

      -- Resizing splits
      vim.keymap.set("n", "<A-h>", splits.resize_left)
      vim.keymap.set("n", "<A-j>", splits.resize_down)
      vim.keymap.set("n", "<A-k>", splits.resize_up)
      vim.keymap.set("n", "<A-l>", splits.resize_right)

      vim.keymap.set("n", "<leader><leader>h", require("smart-splits").swap_buf_left)
      vim.keymap.set("n", "<leader><leader>j", require("smart-splits").swap_buf_down)
      vim.keymap.set("n", "<leader><leader>k", require("smart-splits").swap_buf_up)
      vim.keymap.set("n", "<leader><leader>l", require("smart-splits").swap_buf_right)
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = { char = "│" },
      scope = { enabled = true },
    },
  },
}
