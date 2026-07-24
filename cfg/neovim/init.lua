require("config.lazy")

--[ OPTIONS ]--
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.termguicolors = true
vim.o.relativenumber = true
vim.o.number = true
vim.o.spell = false
vim.o.signcolumn = "yes"
vim.o.wrap = false
vim.o.conceallevel = 2
vim.o.cmdheight = 1

--[ FILETYPES ]--
vim.filetype.add({ extension = { wgsl = "wgsl", wesl = "wesl" } })

--[ AUTOCMDS ]--

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  desc = "WGSL file type",
  pattern = { "*.wgsl" },
  callback = function(_) vim.treesitter.start() end,
})
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  desc = "WESL file type",
  pattern = { "*.wesl" },
  callback = function(_) vim.treesitter.start() end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  desc = "Markdown work wrap",
  pattern = { "*.md" },
  callback = function(_)
    vim.opt_local.wrap = true
  end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  desc = "CSharp editor settings",
  pattern = { "*.cs" },
  callback = function(_)
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
})
