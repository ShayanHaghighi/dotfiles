local map = vim.keymap.set

map("n", "<leader>ff", ":Telescope find_files theme=ivy<CR>", { desc = "Find files" })
map("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Grep files" })
map("n", "<leader>fb", ":Telescope buffers<CR>theme=ivy<CR>", { desc = "List buffers" })
map("n", "<leader>fh", ":Telescope help_tags<CR>", { desc = "Help tags" })

map("n", "<leader>ft", ":TodoTelescope<CR>", { desc = "Help tags" })
