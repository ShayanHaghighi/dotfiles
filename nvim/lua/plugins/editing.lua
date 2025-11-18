return {
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
    event = "InsertEnter", -- Only load when you enter Insert mode
    config = function()
      require("nvim-autopairs").setup()
    end,
  },
  {
    "https://github.com/tpope/vim-sleuth",
    event = { "BufReadPost", "BufNewFile" }, -- Load after your file content
  },
  {
    "https://github.com/farmergreg/vim-lastplace",
    event = "BufReadPost",
  },
}
