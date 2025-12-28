return {
    {
        "stevearc/dressing.nvim",
        opts = {

            select = {
                -- Set to false to disable the vim.ui.select implementation
                enabled = true,

                -- Priority list of preferred vim.select implementations
                backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },

                -- Trim trailing `:` from prompt
                trim_prompt = true,

                -- Options for telescope selector
                -- These are passed into the telescope picker directly. Can be used like:
                -- telescope = require('telescope.themes').get_ivy({...})
                telescope = nil,
            }
        },
    },
    {
        'MeanderingProgrammer/render-markdown.nvim',
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' }, -- if you use the mini.nvim suite
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' }, -- if you use standalone mini plugins
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = { render_modes = { 'n', 'c', 't', 'i', 'v' }, preset = 'obsidian' },
    },
    {
        "HiPhish/rainbow-delimiters.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },
    {
        'stevearc/oil.nvim',
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {
            keymaps = {
                ["<Tab>"] = "actions.select",
                ["<S-Tab>"] = { "actions.parent", mode = "n" },
                ["C-r"] = "actions.refresh",
                ["C-l"] = false
            }
        },
        dependencies = { { "nvim-mini/mini.icons", opts = {} } },
        lazy = false,
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

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            spec = {
                { "<leader>f", desc = "find cmds",  group = "Find" },
                { "<leader>t", desc = "toggle",     group = "Toggle" },
                { "<leader>s", mode = { "n", "v" }, desc = "Select (TreeSitter)", group = "Select (TreeSitter)" },
            },
        },
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },
}
