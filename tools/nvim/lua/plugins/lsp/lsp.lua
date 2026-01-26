return {

  {
    "neovim/nvim-lspconfig",
  },
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        json = { "fixjson" },
        python = { "black" },
        bash = { "beautysh" },
        zsh = { "beautysh" },
        shell = { "beautysh" },
        yaml = { "prettier" },
        css = { "prettier" },
      },
      formatters = {
        stylua = {
          append_args = {
            "--indent-type",
            "Spaces",
            "--indent-width",
            "2",
          },
        },
      },
      format_on_save = {
        timeout_ms = 1000,
        lsp_fallback = true,
      },
    },
  },
}
