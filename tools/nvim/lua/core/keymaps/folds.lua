local map = vim.keymap.set

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
