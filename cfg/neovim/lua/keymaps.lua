local keymaps = {
  {
    "<leader>w",
    "<cmd>w<cr>",
    mode = "n",
    desc = "Save",
  },
  {
    "<leader>q",
    "<cmd>confirm q<cr>",
    mode = "n",
    desc = "Quit window",
  },
  {
    "<leader>Q",
    "<cmd>confirm qall<cr>",
    mode = "n",
    desc = "Exit NVIM",
  },
  {
    "<leader>n",
    "<cmd>enew<cr>",
    mode = "n",
    desc = "New file",
  },
  {
    "<C-s>",
    "<cmd>w<cr>",
    mode = "",
    desc = "Save",
  },
  {
    "<C-S>",
    "<cmd>w!<cr>",
    mode = "",
    desc = "Force save",
  },
  {
    "<C-q>",
    "<cmd>q<cr>",
    mode = "",
    desc = "Quit",
  },
  {
    "<C-Q>",
    "<cmd>q!<cr>",
    mode = "",
    desc = "Force quit",
  },
  {
    "\\",
    "<cmd>spl<cr>",
    mode = "n",
    desc = "Horizontal split",
  },
  {
    "|",
    "<cmd>vspl<cr>",
    mode = "n",
    desc = "Vertical split",
  },
  {
    "<leader>/",
    "gcc",
    mode = "n",
    desc = "Toggle comment line",
  },
  {
    "<leader>/",
    "gc",
    mode = "x",
    desc = "Toggle comment block",
  },
  {
    "<leader>c",
    function()
      local bufnr = vim.api.nvim_get_current_buf() or 0
      if vim.api.nvim_buf_is_valid(bufnr) and vim.bo[bufnr].buflisted then
        require("snacks").bufdelete { buf = bufnr }
      end
    end,
    mode = "n",
    desc = "Close current buffer",
  },
  {
    "gco",
    "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>",
    mode = "n",
    desc = "Add comment below",
  },
  {
    "gcO",
    "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>",
    mode = "n",
    desc = "Add comment above",
  },
  {
    "<C-Space>",
    "<C-w>N",
    mode = "t",
    desc = "Escape terminal",
  },
  {
    "<leader>e",
    "<cmd>Neotree toggle reveal_force_cwd<cr>",
    mode = "n",
    desc = "Toggle explorer",
  },
  {
    "<leader>o",
    function()
      if vim.bo.filetype == "neo-tree" then
        vim.cmd.wincmd("p")
      else
        vim.cmd("Neotree focus")
      end
    end,
    mode = "n",
    desc = "Toggle explorer focus",
  },

  -- LSP
  {
    "gra",
    vim.lsp.buf.code_action,
    mode = "n",
    desc = "LSP code action",
  },
  {
    "gra",
    vim.lsp.buf.code_action,
    mode = "x",
    desc = "LSP code action",
  },
  {
    "grn",
    vim.lsp.buf.rename,
    mode = "n",
    desc = "Rename symbol",
  },
  {
    "grr",
    vim.lsp.buf.references,
    mode = "n",
    desc = "Show reference(s)",
  },
  {
    "gri",
    vim.lsp.buf.implementation,
    mode = "n",
    desc = "Show implementation(s)",
  },
  {
    "gO",
    vim.lsp.buf.document_symbol,
    mode = "n",
    desc = "Document symbol",
  },
  {
    "gd",
    require("telescope.builtin").lsp_definitions,
    mode = "n",
    desc = "Go-to definition",
  },
  {
    "gD",
    vim.lsp.buf.references,
    mode = "n",
    desc = "Show references",
  },
  {
    "gi",
    vim.lsp.buf.implementation,
    mode = "n",
    desc = "Go-to implementation",
  },
  {
    "gt",
    vim.lsp.buf.type_definition,
    mode = "n",
    desc = "Go-to type definition",
  },
  {
    "K",
    vim.lsp.buf.hover,
    mode = "n",
    desc = "Hover",
  },
  {
    "<leader>la",
    vim.lsp.buf.code_action,
    mode = "n",
    desc = "LSP code action",
  },
  {
    "<leader>la",
    vim.lsp.buf.code_action,
    mode = "x",
    desc = "LSP code action",
  },
  {
    "<leader>lA",
    function()
      vim.lsp.buf.code_action { context = { only = { "source" } } }
    end,
    mode = "n",
    desc = "LSP source action",
  },
  {
    "<leader>ld",
    vim.diagnostic.open_float,
    mode = "n",
    desc = "Show hover diagnostics",
  },
  {
    "<leader>lD",
    require("telescope.builtin").diagnostics,
    mode = "n",
    desc = "Show diagnostics",
  },
  {
    "<leader>lh",
    vim.lsp.buf.signature_help,
    mode = "n",
    desc = "Signature help",
  },
  {
    "<leader>ll",
    function()
      vim.lsp.codelens.enable(true)
    end,
    mode = "n",
    desc = "LSP CodeLens refresh",
  },
  {
    "<leader>lL",
    vim.lsp.codelens.run,
    mode = "n",
    desc = "LSP CodeLens run",
  },
  {
    "<leader>lr",
    vim.lsp.buf.rename,
    mode = "n",
    desc = "Rename symbol",
  },
  {
    "<leader>lR",
    vim.lsp.buf.references,
    mode = "n",
    desc = "Search references"
  },

  -- cursor navigation
  { "j",     "gj" },
  { "k",     "gk" },

  -- split navigation
  { "<C-h>", "<C-w>h" },
  { "<C-j>", "<C-w>j" },
  { "<C-k>", "<C-w>k" },
  { "<C-l>", "<C-w>l" },

  -- buffer navigation
  {
    "]b",
    "<cmd>bnext<cr>",
    mode = "n",
    desc = "Next buffer",
  },
  {
    "[b",
    "<cmd>bprev<cr>",
    mode = "n",
    desc = "Previous buffer",
  },
  -- {
  --   "bd",
  --   "<cmd>bdelete<cr>",
  --   mode = "n",
  --   desc = "Close current buffer",
  -- },

  -- tabs
  {
    "]t",
    "<cmd>tabnext<cr>",
    mode = "n",
    desc = "Next tab",
  },
  {
    "[t",
    "<cmd>tabprevious<cr>",
    mode = "n",
    desc = "Previous tab",
  },

  -- lists
  {
    "<leader>xq",
    "<cmd>copen<cr>",
    mode = "n",
    desc = "Quickfix list",
  },
  {
    "<leader>xl",
    "<cmd>lopen<cr>",
    mode = "n",
    desc = "Location list",
  },
  {
    "]q",
    "<cmd>cnext<cr>",
    mode = "n",
    desc = "Next quickfix",
  },
  {
    "[q",
    "<cmd>cprev<cr>",
    mode = "n",
    desc = "Previous quickfix",
  },
  {
    "]Q",
    "<cmd>clast<cr>",
    mode = "n",
    desc = "Last quickfix",
  },
  {
    "[Q",
    "<cmd>cfirst<cr>",
    mode = "n",
    desc = "First quickfix",
  },
  {
    "]l",
    "<cmd>lnext<cr>",
    mode = "n",
    desc = "Next location",
  },
  {
    "[l",
    "<cmd>lprev<cr>",
    mode = "n",
    desc = "Previous location",
  },
  {
    "]L",
    "<cmd>llast<cr>",
    mode = "n",
    desc = "Last location",
  },
  {
    "[L",
    "<cmd>lfirst<cr>",
    mode = "n",
    desc = "First location",
  },

  -- indents
  {
    "<Tab>",
    ">gv",
    mode = "v",
    desc = "Increase indent",
  },
  {
    "<S-Tab>",
    "<gv",
    mode = "v",
    desc = "Decrease indent",
  },

  -- telescope
  {
    "<leader>ff",
    "<cmd>Telescope find_files<cr>",
    mode = "n",
    desc = "Find files",
  },
  {
    "<leader>fb",
    "<cmd>Telescope buffers<cr>",
    mode = "n",
    desc = "Find buffers",
  },
  {
    "<leader>fh",
    "<cmd>Telescope help_tags<cr>",
    mode = "n",
    desc = "Find help",
  },
  {
    "<leader>fk",
    "<cmd>Telescope keymaps<cr>",
    mode = "n",
    desc = "Find keymaps",
  },
  {
    "<leader>fo",
    "<cmd>Telescope keymaps<cr>",
    mode = "n",
    desc = "Find old files",
  },
  {
    "<leader>fw",
    "<cmd>Telescope live_grep<cr>",
    mode = "n",
    desc = "Find words",
  },

  -- terminal/git
  {
    "<leader>gg",
    "<cmd>TermExec cmd='lazygit' direction=float<cr>",
    mode = "n",
    desc = "ToggleTerm lazygit",
  },
  {
    "<leader>tl",
    "<cmd>TermExec cmd='lazygit' direction=float<cr>",
    mode = "n",
    desc = "ToggleTerm lazygit",
  },
  {
    "<leader>tf",
    "<cmd>ToggleTerm direction=float<cr>",
    mode = "n",
    desc = "ToggleTerm float",
  },
  {
    "<leader>th",
    "<cmd>ToggleTerm size=10 direction=horizontal<cr>",
    mode = "n",
    desc = "ToggleTerm horizontal split",
  },
  {
    "<leader>tv",
    "<cmd>ToggleTerm size=80 direction=vertical<cr>",
    mode = "n",
    desc = "ToggleTerm vertical split",
  },
  {
    "<C-'>",
    "<cmd>execute v:count . 'ToggleTerm'<cr>",
    mode = "n",
    desc = "Toggle terminal",
  },
  {
    "<C-'>",
    "<cmd>ToggleTerm<cr>",
    mode = "t",
    desc = "Toggle terminal",
  },
  {
    "<C-'>",
    "<esc><cmd>ToggleTerm<cr>",
    mode = "i",
    desc = "Toggle terminal",
  },

  -- group labels for which-key
  {
    "<leader>b",
    "<nop>",
    mode = "n",
    desc = "Buffers",
  },
  {
    "<leader>t",
    "<nop>",
    mode = "n",
    desc = "Terminal",
  },
  {
    "<leader>g",
    "<nop>",
    mode = "n",
    desc = "Git",
  },
  {
    "<leader>f",
    "<nop>",
    mode = "n",
    desc = "Find",
  },
  {
    "<leader>x",
    "<nop>",
    mode = "n",
    desc = "Lists",
  },
  {
    "<leader>l",
    "<nop>",
    mode = "n",
    desc = "LSP",
  },

  -- clipboard
  {
    "<leader>yy",
    "\"+y",
    mode = "n",
    desc = "Copy line to system clipboard",
  },
  {
    "<leader>y",
    "\"+y",
    mode = "x",
    desc = "Copy to system clipboard",
  },
  {
    "<leader>p",
    "\"+p",
    mode = "n",
    desc = "Paste from system clipboard",
  },
  {
    "<leader>p",
    "\"+p",
    mode = "x",
    desc = "Paste from system clipboard",
  },
  {
    "<leader>P",
    "\"+P",
    mode = "n",
    desc = "Paste from system clipboard (before cursor)",
  },
  {
    "<leader>P",
    "\"+P",
    mode = "x",
    desc = "Paste from system clipboard (before cursor)",
  },
}

for _, map in pairs(keymaps) do
  vim.keymap.set(
    map.mode or "",
    map[1],
    map[2],
    map.desc ~= nil and { desc = map.desc } or nil
  )
end
