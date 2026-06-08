local configs = {
  basedpyright = {},
  clangd = {},
  jdtls = {},
  jsonls = {},
  lua_ls = {
    on_init = function(client)
      if client.workspace_folders then
        local path = client.workspace_folders[1].name
        if
          path ~= vim.fn.stdpath("config")
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
      },
    },
  },
  marksman = {},
  omnisharp = {},
  rust_analyzer = {},
  wgsl_analyzer = {},
  yamlls = {},
  zls = {},
}

return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      for lsp, cfg in pairs(configs) do
        vim.lsp.config(lsp, cfg)
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
      for lsp, _ in pairs(configs) do
        table.insert(ensure_installed, lsp)
      end
      opts.ensure_installed = ensure_installed
    end,
  }
}
