return {
  "norcalli/nvim-colorizer.lua",
  event = "BufReadPost",
  config = function()
    require("colorizer").setup(
      {
        "*",
        css = {
          css = true,
        },
        html = {
          mode = "foreground",
        },
      },
      {
        RGB = true,
        RRGGBB = true,
        RRGGBBAA = true,
        names = false,
        rgb_fn = true,
        hsl_fn = true,
        mode = "background",
      }
    )
  end,
}
