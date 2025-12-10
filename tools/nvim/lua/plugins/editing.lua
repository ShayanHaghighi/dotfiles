return {
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
    "https://github.com/windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup()
    end,
  },
  {
    "https://github.com/tpope/vim-sleuth",
    event = { "BufReadPost", "BufNewFile" },
  },
  {
    "https://github.com/farmergreg/vim-lastplace",
    event = "BufReadPost",
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      spec = {
        { "<leader>f", desc = "find cmds",  group = "Find" },
        { "<leader>t", desc = "toggle",     group = "Toggle" },
        { "<leader>s", mode = { 'n', 'v' }, desc = "Select (TreeSitter)", group = "Select (TreeSitter)" },
      }
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    }
  }
}
