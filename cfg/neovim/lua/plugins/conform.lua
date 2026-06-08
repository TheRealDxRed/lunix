return {
	"stevearc/conform.nvim",
  event = {"BufReadPost"},
  cmd = {"ConformInfo"},
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
	opts = {
    formatter_by_ft = {
		  lua = { "stylua" },
		  python = { "isort", "black" },
		  rust = { "rustfmt" },
		  javascript = { "prettierd", "prettier", stop_after_first = true },
    },

    default_format_opts = {
      lsp_format = "fallback",
    },

    format_on_save = { timeout_ms = 500 },

    formatters = {
      shfmt = {
        append_args = { "-i", "2" },
      },
    },
	},
  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end
}
