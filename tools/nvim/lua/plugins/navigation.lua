return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local actions = require("telescope.actions")
      local action_state = require("telescope.actions.state")
      local builtin = require("telescope.builtin")
      local themes = require("telescope.themes")
      require("telescope").setup({

        defaults = {
          mappings = {
            i = {
              ["<C-u>"] = function(prompt_bufnr)
                local current_picker = action_state.get_current_picker(prompt_bufnr)
                local cwd = current_picker.cwd and tostring(current_picker.cwd) or vim.loop.cwd()
                local parent_dir = vim.fs.dirname(cwd)

                actions.close(prompt_bufnr)
                builtin.find_files(themes.get_ivy({ cwd = parent_dir }))
              end,
            },
          },
        },
      })
    end,
  },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  {
    "wsdjeg/rooter.nvim",
    opts = {
      root_patterns = { ".git/", "init.lua", "main.tex", "tmux.conf" },
      outermost = false,
      enable_cache = false,
    },
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup()
      vim.keymap.set("n", "<leader>a", function()
        harpoon:list():add()
        print("added '" .. vim.fn.expand("%") .. "' to harp")
      end)
      vim.keymap.set("n", "<leader>r", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)

      vim.keymap.set("n", "<C-m>", function()
        harpoon:list():select(1)
      end)
      vim.keymap.set("n", "<C-,>", function()
        harpoon:list():select(2)
      end)
      vim.keymap.set("n", "<C-.>", function()
        harpoon:list():select(3)
      end)
      vim.keymap.set("n", "<C-/>", function()
        harpoon:list():select(4)
      end)

      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set("n", "<C-A-P>", function()
        harpoon:list():prev()
      end)
      vim.keymap.set("n", "<C-A-N>", function()
        harpoon:list():next()
      end)
    end,
  },
}
