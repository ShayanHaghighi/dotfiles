-- lua/plugins/terminal.lua
return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        -- Use *real splits* by default
        direction = "horizontal",

        size = function(term)
          if term.direction == "horizontal" then
            return 15 -- normal split height
          elseif term.direction == "vertical" then
            return math.floor(vim.o.columns * 0.33)
          end
        end,
        open_mapping = [[<C-\>]],
        start_in_insert = true,
        shade_terminals = true, -- shading stops terminals from blending into tiled layouts
        hide_numbers = false,
        persist_size = true,
        persist_mode = true,
        close_on_exit = true,

        float_opts = {
          border = "rounded",
          winblend = 20,
          width = 85,
          height = 15,
        },
      })

      -----------------------------------------------------
      -- 🔥 KEYMAPS
      -----------------------------------------------------

      -- Toggle horizontal split terminal (tiles with buffers)
      vim.keymap.set("n", "<leader>th", function()
        require("toggleterm.terminal").Terminal:new({ direction = "horizontal" }):toggle()
      end, { desc = "Toggle horizontal terminal" })

      -- Toggle vertical split terminal (tiles with buffers)
      vim.keymap.set("n", "<leader>tv", function()
        require("toggleterm.terminal").Terminal:new({ direction = "vertical" }):toggle()
      end, { desc = "Toggle vertical terminal" })

      -- Floating terminal remains available
      vim.keymap.set("n", "<leader>tf", function()
        require("toggleterm.terminal").Terminal:new({ direction = "float" }):toggle()
      end, { desc = "Toggle floating terminal" })

      -----------------------------------------------------
      -- 🚀 Terminal Mode Keymaps (escaping, window nav)
      -----------------------------------------------------
      function _G.set_terminal_keymaps()
        local opts = { buffer = 0 }
        vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], opts)

        -- Normal nav works flawlessly with tiled terminals
        vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], opts)
        vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], opts)
        vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], opts)
        vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], opts)
      end

      vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

      -----------------------------------------------------
      -- 🧹 Make terminal splits clean + pretty
      -----------------------------------------------------
      vim.api.nvim_create_autocmd("TermOpen", {
        pattern = "*",
        callback = function()
          vim.opt.number = false
          vim.opt.relativenumber = false
          vim.opt.signcolumn = "no"
        end,
      })

      -----------------------------------------------------
      -- 🎨 Floating terminal appearance only (tiled splits stay normal)
      -----------------------------------------------------
      vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#8aa9ff", bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1a1b26" })
    end,
  },
}
