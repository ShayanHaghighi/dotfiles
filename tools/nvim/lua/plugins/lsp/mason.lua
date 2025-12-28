return { {
  "williamboman/mason.nvim",
  config = function()
    require("mason").setup()
  end,
},
  {
    "mason-org/mason-lspconfig.nvim",

    opts = {
      ensure_installed = {
        "basedpyright",
        "lua_ls",
      },
      automatic_enable = {
        exclude = {
          "ltex_plus"
        }
      }
    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  }, }
