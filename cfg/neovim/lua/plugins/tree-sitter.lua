return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.parsers").wgsl = {
      install_info = {
        url = "https://github.com/szebniok/tree-sitter-wgsl",
        branch = "master",
        queries = "queries",
        files = { "src/parser.c" },
      }
    }
    vim.treesitter.language.register("wgsl", { "wgsl", "wesl" })

    local treesitter = require("nvim-treesitter")
    treesitter.setup({
      install_dir = vim.fn.stdpath('data') .. '/site',
      auto_install = true,
      highlight = {
        enabled = true,
      },
    })

    treesitter.install {
      "rust",
      "c",
      "c_sharp",
      "cpp",
      "desktop",
      "fish",
      "gitignore",
      "glsl",
      "hyprlang",
      "java",
      "json",
      "kitty",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "toml",
      "wesl",
      "wgsl",
      -- "wgsl_bevy",
      "yaml",
      "zig",
    }
  end,
}
