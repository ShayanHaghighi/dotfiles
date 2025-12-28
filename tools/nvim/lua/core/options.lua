vim.opt.number = true
vim.opt.undofile = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.mouse = "a"
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.diagnostic.config({
  virtual_text = { virt_text_pos = "right_align" },
  virtual_lines = false,
  underline = true,
  update_in_insert = true,
})

vim.opt.foldlevelstart = 99
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.filetype.add({
  extension = {
    ghostty = "cfg",
  },
})

vim.opt.spell = true
vim.opt.spelllang = "en_gb"
