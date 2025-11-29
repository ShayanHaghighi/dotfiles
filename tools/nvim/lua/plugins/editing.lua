return { { "mg979/vim-visual-multi",
},
  {
    "tpope/vim-surround",
  },
  { "christoomey/vim-tmux-navigator", lazy = false },
  {
    "https://github.com/numToStr/Comment.nvim",
    event = "VeryLazy", -- Special lazy.nvim event for things that can load later and are not important for the initial UI
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
    "VonHeikemen/fine-cmdline.nvim",
    dependencies = {
      { 'MunifTanjim/nui.nvim' },
    },
    config = function ()
      vim.api.nvim_set_keymap('n', '<CR>', '<cmd>FineCmdline<CR>', {noremap = true})
      vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})
      require("fine-cmdline").setup({cmdline = {
    enable_keymaps = true,
    smart_history = true,
    prompt = '> '
  },
  popup = {
    position = {
      row = '10%',
      col = '50%',
    },
    size = {
      width = '60%',
    },
    border = {
      style = 'double',
          padding = {0,1},
    },
    win_options = {
      winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
    },
  },})
    end
  },
}
