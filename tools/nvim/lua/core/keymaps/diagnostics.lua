local map = vim.keymap.set
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

map("n", "<leader>td", function()
  local current = vim.diagnostic.is_enabled()
  vim.diagnostic.enable(not current)
end, { desc = "Toggle diagnostics" })

map("n", "<Leader>tV", function()
  local new_config = not vim.diagnostic.config().virtual_lines
  vim.diagnostic.config({ virtual_lines = new_config })
end, { desc = "Toggle diagnostic virtual_lines" })

map("n", "<Leader>tv", function()
  local new_config = not vim.diagnostic.config().virtual_text
  vim.diagnostic.config({ virtual_text = new_config })
end, { desc = "Toggle diagnostic virtual_text" })

map("n", "<leader>tw", ":set spell!<CR>", { desc = "Toggle Spell Check" })
