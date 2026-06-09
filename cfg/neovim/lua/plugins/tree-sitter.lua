return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local treesitter = require("nvim-treesitter")
    treesitter.setup({
      install_dir = vim.fn.stdpath('data') .. '/site'
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
      "python",
      "toml",
      "wgsl",
      "wgsl_bevy",
      "yaml",
      "zig",
    }
  end,
}
