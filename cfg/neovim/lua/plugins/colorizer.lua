return {
  "norcalli/nvim-colorizer.lua",
  event = "BufReadPost",
  config = function()
    require("colorizer").setup(nil, {
      RGB = true,
      RRGGBB = true,
      RRGGBBAA = true,
      rgb_fn = true,
      hsl_fn = true,
      mode = "background",
    })
  end,
}
