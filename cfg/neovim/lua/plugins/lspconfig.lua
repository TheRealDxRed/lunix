local remote_configs = {
	basedpyright = {},
	clangd = {},
	glsl_analyzer = {},
	jdtls = {},
	jsonls = {},

	lua_ls = {
		on_init = function(client)
			if client.workspace_folders then
				local path = client.workspace_folders[1].name
				if
						path ~= vim.fn.stdpath("config")
						and path:find(vim.fn.resolve(vim.env.HOME .. "/lunix")) == nil
						and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
				then
					return
				end

				client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
					runtime = {
						version = "LuaJIT",
						path = {
							"lua/?.lua",
							"lua/?/init.lua",
						},
					},

					workspace = {
						checkThirdParty = false,
						library = {
							vim.env.VIMRUNTIME,
							vim.api.nvim_get_runtime_file("lua/lspconfig", false)[1],
						},
					},
				})
			end
		end,
		settings = {
			Lua = {
				codeLens = { enable = true },
				hint = { enable = true, semicolon = "Disable" },
				diagnostics = { globals = { "hl" }, },
			},
		},
	},

	marksman = {},
	nil_ls = {},

	omnisharp = {
		---@type lspconfig.settings.omnisharp
		settings = {
			dotnet = {
				formatting = {
					organizeImportsOnFormat = true,
				},
			},

			csharp = {
				format = {
					enable = true,
				},
			},

			omnisharp = {
				useEditorFormattingSettings = true,
				enableEditorConfigSupport = true,
			},
		},
	},

	rust_analyzer = {},

	yamlls = {},
	zls = {},
}

local local_configs = {
	-- glasgow = {}
}

return {
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			for lsp, cfg in pairs(remote_configs) do
				vim.lsp.config(lsp, cfg)
				vim.lsp.enable(lsp)
			end

			for lsp, cfg in pairs(local_configs) do
				vim.lsp.config(lsp, cfg)
				vim.lsp.enable(lsp)
			end
		end,
	},

	{
		"mason-org/mason.nvim",
		opts = {},
	},

	{
		"mason-org/mason-lspconfig.nvim",
		opts = function(_, opts)
			local ensure_installed = {}
			for lsp, _ in pairs(remote_configs) do
				table.insert(ensure_installed, lsp)
			end
			opts.ensure_installed = ensure_installed
		end,
	}
}
