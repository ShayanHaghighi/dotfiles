local map = vim.keymap.set

map("n", "<leader>w", "<cmd>update<cr>", { desc = "Save buffer" })

map("n", "<ScrollWheelUp>", "3k", { noremap = true, silent = true })
map("n", "<ScrollWheelDown>", "3j", { noremap = true, silent = true })

map("n", "<C-d>", "<C-d>zz", { noremap = true })
map("n", "<C-u>", "<C-u>zz", { noremap = true })

map({ "n", "x" }, "gp", '"+p', { desc = "paste from clipboard" })
map({ "n", "x" }, "gy", '"+y', { desc = "copy to clipboard" })

map({ "n", "v" }, "<Leader>x", ":close<CR>", { desc = "close window" })

map("v", "gi", "g<C-a>", { noremap = true, silent = true, desc = "Increment sequence" })
map("v", "gd", "g<C-x>", { noremap = true, silent = true, desc = "Decrement sequence" })

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "<ESC>", ":noh<CR>", { noremap = false })

map("v", "<", "<gv")
map("v", ">", ">gv")
