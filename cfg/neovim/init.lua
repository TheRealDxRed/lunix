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

-- disable codelens until i can fix those damn phantom lines
--vim.lsp.codelens.enable(false)

--[ AUTOCMDS ]--
vim.api.nvim_create_autocmd({ "FileType" }, {
  desc = "Markdown work wrap",
  pattern = { "*.md" },
  callback = function(_)
    vim.opt_local.wrap = true
  end,
})
