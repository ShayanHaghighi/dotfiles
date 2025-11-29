vim.g.mapleader = " "

local map = vim.keymap.set
map("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file tree" })
map("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Grep files" })
map("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "List buffers" })
map("n", "<leader>fh", ":Telescope help_tags<CR>", { desc = "Help tags" })
map("n", "<leader>v", ":vsplit<CR>", { desc = "Vertical Split" })
map("n", "<leader>h", ":split<CR>", { desc = "Horizontal Split" })
map("n", "<C-t>", ":tabnew<CR>", { desc = "New Tab" })
map("n", "<C-s>", ":w<CR>", { desc = "Save" })
map("n", "<leader>q", ":wqa<CR>", { desc = "Close Tab" })
vim.api.nvim_set_keymap("n","<C-d>", "<C-d>zz", { noremap = true })
vim.api.nvim_set_keymap("n","<C-u>", "<C-u>zz", { noremap = true })
-- TODO: is this the correct way to do new tabs?

-- Enable mouse in all modes
vim.opt.mouse = "a"

-- Move cursor with scroll wheel
vim.api.nvim_set_keymap("n", "<ScrollWheelUp>", "7k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<ScrollWheelDown>", "7j", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
  "n",
  "<leader>gc",
  "<cmd>lua require('telescope.builtin').git_commits()<CR>",
  { noremap = true, silent = true }
)
vim.keymap.set("n","L","$")
vim.keymap.set("n","H","_")
vim.keymap.set("v","L","$")
vim.keymap.set("v","H","_")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set({ "n", "x" }, "gp", '"+p', { desc = "paste from clipboard" })
vim.keymap.set({ "n", "x" }, "gy", '"+y', { desc = "copy to clipboard" })
