local map = vim.keymap.set

map("n", "<C-t>", ":tabnew<CR>", { desc = "New Tab" })
map("n", "<leader>q", ":wqa<CR>", { desc = "Close Tab" })

map("n", "<leader>v", ":vsplit<CR>", { desc = "Vertical Split" })
map("n", "<leader>h", ":split<CR>", { desc = "Horizontal Split" })
