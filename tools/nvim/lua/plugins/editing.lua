return {
  -- {
  --   "opdavies/toggle-checkbox.nvim"
  -- },
  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = {
      enable = true,
      max_lines = 3,
      min_window_height = 0,
      line_numbers = true,
      -- multiline_threshold = 20,
      trim_scope = 'outer',
      mode = 'cursor',
    }
  },
  { "mg979/vim-visual-multi" },
  {
    "tpope/vim-surround",
  },
  { "christoomey/vim-tmux-navigator", lazy = false },
  {
    "https://github.com/numToStr/Comment.nvim",
    event = "VeryLazy",
    config = function()
      require("Comment").setup()
    end,
  },
  {
    "https://github.com/tpope/vim-sleuth",
    event = { "BufReadPost", "BufNewFile" },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
  {
    "johmsalas/text-case.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      local textcase = require("textcase")
      textcase.setup({ prefix = 'gC' })
      require("telescope").load_extension("textcase")
      vim.keymap.del('n', 'gCU')
      vim.keymap.del('n', 'gCL')
      vim.keymap.del('n', 'gCS')
      vim.keymap.del('n', 'gCD')
      vim.keymap.del('n', 'gCN')


      vim.keymap.del('n', 'gCC')
      vim.keymap.del('n', 'gCP')
    end,
    lazy = false,
  },
  {
    "https://github.com/windwp/nvim-autopairs",
    -- not ideal, but since this remaps <CR>, it needs to
    -- load first as to not overwrite the autolist keymap
    lazy = false,
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({
        disable_filetype = { "markdown" },
      })
    end,
  },
  {
    "gaoDean/autolist.nvim",
    ft = {
      "markdown",
      "text",
      "tex",
      "plaintex",
      "norg",
    },
    config = function()
      require("autolist").setup()

      vim.keymap.set("i", "<tab>", "<cmd>AutolistTab<cr>")
      vim.keymap.set("i", "<s-tab>", "<cmd>AutolistShiftTab<cr>")
      -- vim.keymap.set("i", "<c-t>", "<c-t><cmd>AutolistRecalculate<cr>") -- an example of using <c-t> to indent
      vim.keymap.set("i", "<CR>", "<CR><cmd>AutolistNewBullet<cr>")
      vim.keymap.set("n", "o", "o<cmd>AutolistNewBullet<cr>")
      vim.keymap.set("n", "O", "O<cmd>AutolistNewBulletBefore<cr>")
      vim.keymap.set("n", "<CR>", "<cmd>AutolistToggleCheckbox<cr><CR>", { noremap = false })
      vim.keymap.set("n", "<leader>tt", "<cmd>AutolistToggleCheckbox<cr>", { noremap = false })
      vim.keymap.set("n", "<C-r>", "<cmd>AutolistRecalculate<cr>")

      -- cycle list types with dot-repeat
      vim.keymap.set("n", "<leader>cn", require("autolist").cycle_next_dr, { expr = true })
      vim.keymap.set("n", "<leader>cp", require("autolist").cycle_prev_dr, { expr = true })

      -- if you don't want dot-repeat
      -- vim.keymap.set("n", "<leader>cn", "<cmd>AutolistCycleNext<cr>")
      -- vim.keymap.set("n", "<leader>cp", "<cmd>AutolistCycleNext<cr>")

      -- functions to recalculate list on edit
      vim.keymap.set("n", ">>", ">><cmd>AutolistRecalculate<cr>")
      vim.keymap.set("n", "<<", "<<<cmd>AutolistRecalculate<cr>")
      vim.keymap.set("n", "dd", "dd<cmd>AutolistRecalculate<cr>")
      vim.keymap.set("v", "d", "d<cmd>AutolistRecalculate<cr>")
    end,
  },
}
