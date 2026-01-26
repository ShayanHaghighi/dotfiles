return {
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff' },
          lualine_c = { '' },
          lualine_x = { 'diagnostics', 'lsp_status', 'filetype' },
          lualine_y = { 'location', 'progress', },
          lualine_z = {
            {
              'filename',
              file_status = true,
              newfile_status = true,
              path = 0,
              shorting_target = 40,
              symbols = {
                modified = '•',
                readonly = '[-]',
                unnamed = '[Unnamed File]',
                newfile = '[New]',
              },
            },
          },
        },
      })
    end,
  }
}
