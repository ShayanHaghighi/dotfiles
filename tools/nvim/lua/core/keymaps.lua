vim.g.mapleader = " "

local map = vim.keymap.set

-- MOVEMENT

map("n", "<ScrollWheelUp>", "3k", { noremap = true, silent = true })
map("n", "<ScrollWheelDown>", "3j", { noremap = true, silent = true })

map("n", "<C-d>", "<C-d>zz", { noremap = true })
map("n", "<C-u>", "<C-u>zz", { noremap = true })

-- SPLITS N TABS

map("n", "<C-t>", ":tabnew<CR>", { desc = "New Tab" })
map("n", "<C-s>", ":w<CR>", { desc = "Save" })
map("n", "<leader>q", ":wqa<CR>", { desc = "Close Tab" })

map("n", "<leader>v", ":vsplit<CR>", { desc = "Vertical Split" })
map("n", "<leader>h", ":split<CR>", { desc = "Horizontal Split" })

-- PLUGINS

map("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file tree" })

map("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Grep files" })
map("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "List buffers" })
map("n", "<leader>fh", ":Telescope help_tags<CR>", { desc = "Help tags" })

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- DIAGNOSTICS

map("n", "<leader>td", function()
  local current = vim.diagnostic.is_enabled()
  vim.diagnostic.enable(not current)
end, { desc = "Toggle diagnostics" })

map("n", "gK", function()
  local new_config = not vim.diagnostic.config().virtual_lines
  vim.diagnostic.config({ virtual_lines = new_config })
end, { desc = "Toggle diagnostic virtual_lines" })

map("n", "<Leader>tv", function()
  local new_config = not vim.diagnostic.config().virtual_text
  vim.diagnostic.config({ virtual_text = new_config })
end, { desc = "Toggle diagnostic virtual_text" })

map("n", "<leader>w", ":set spell!<CR>", { desc = "Toggle Spell Check" })

-- FOLDS

map("n", "<leader>z", function()
  local count = vim.v.count

  if count == 0 then
    print("No count specified")
    return
  end

  vim.o.foldlevel = count
  print("Foldlevel = " .. count)
end, { desc = "Set foldlevel via count" })

-- MISC

map({ "n", "x" }, "gp", '"+p', { desc = "paste from clipboard" })
map({ "n", "x" }, "gy", '"+y', { desc = "copy to clipboard" })

map({ "n", "v" }, "<Leader>x", ":close<CR>", { desc = "close window" })

map("v", "gi", "g<C-a>", { noremap = true, silent = true, desc = "Increment sequence" })
map("v", "gd", "g<C-x>", { noremap = true, silent = true, desc = "Decrement sequence" })
