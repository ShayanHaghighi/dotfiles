vim.g.mapleader = " "

local map = vim.keymap.set

-- MOVEMENT

map("n", "<ScrollWheelUp>", "3k", { noremap = true, silent = true })
map("n", "<ScrollWheelDown>", "3j", { noremap = true, silent = true })

map("n", "<C-d>", "<C-d>zz", { noremap = true })
map("n", "<C-u>", "<C-u>zz", { noremap = true })

-- SPLITS N TABS

map("n", "<leader>e", ":Oil<CR>", { desc = "Toggle file tree" })

map("n", "<C-t>", ":tabnew<CR>", { desc = "New Tab" })
map("n", "<C-s>", ":w<CR>", { desc = "Save" })
map("n", "<leader>q", ":wqa<CR>", { desc = "Close Tab" })

map("n", "<leader>v", ":vsplit<CR>", { desc = "Vertical Split" })
map("n", "<leader>h", ":split<CR>", { desc = "Horizontal Split" })

-- SEARCHING

map("n", "<leader>ff", ":Telescope find_files theme=ivy<CR>", { desc = "Find files" })
map("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Grep files" })
map("n", "<leader>fb", ":Telescope buffers<CR>theme=ivy<CR>", { desc = "List buffers" })
map("n", "<leader>fh", ":Telescope help_tags<CR>", { desc = "Help tags" })

map("n", "<leader>ft", ":TodoTelescope<CR>", { desc = "Help tags" })

local function get_root()
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  return clients[1] and clients[1].config.root_dir or vim.fn.getcwd()
end


map("n", "<ESC>", ":noh<CR>", { noremap = false })


local function toggle_lsp(name)
  local bufnr = vim.api.nvim_get_current_buf()

  for _, client in ipairs(vim.lsp.get_clients({ bufnr = bufnr })) do
    if client.name == name then
      vim.lsp.buf_detach_client(bufnr, client.id)
      print("detached", name)
      return
    end
  end

  vim.lsp.start(vim.tbl_extend("force", vim.lsp.config[name], {
    name = name,
  }))

  print("started & attached", name)
end

map("n", "<Leader>tg", function()
  toggle_lsp('ltex_plus')
end, { desc = "Toggle Grammar Checks" })

map("n", "<leader>tt", ":lua require('toggle-checkbox').toggle()<CR>", { desc = "Toggle Checkbox" })

map("n", "<leader>m", ":Mason<CR>", { desc = "Open Mason" })
map("n", "<leader>l", ":Lazy<CR>", { desc = "Open Lazy" })

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


map('n', 'z0', ":set foldlevel=0<CR>", { desc = "Set foldlevel to 0" })

map('n', 'zi', function()
  vim.o.foldlevel = vim.o.foldlevel + 1
  print("foldlevel = " .. vim.o.foldlevel)
end, { desc = "Increment foldlevel" })

map('n', 'zd', function()
  vim.o.foldlevel = vim.o.foldlevel - 1
  print("foldlevel = " .. vim.o.foldlevel)
end, { desc = "Decrement foldlevel" })

map('n', 'zu', 'zR', { desc = "Undo All Folds" })


-- MISC

map({ "n", "x" }, "gp", '"+p', { desc = "paste from clipboard" })
map({ "n", "x" }, "gy", '"+y', { desc = "copy to clipboard" })

map({ "n", "v" }, "<Leader>x", ":close<CR>", { desc = "close window" })

map("v", "gi", "g<C-a>", { noremap = true, silent = true, desc = "Increment sequence" })
map("v", "gd", "g<C-x>", { noremap = true, silent = true, desc = "Decrement sequence" })

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("v", "<", "<gv")
map("v", ">", ">gv")
