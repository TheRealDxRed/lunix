return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local theme = require("alpha.themes.dashboard")

    theme.section.header.val = {
      "                    .   .xXXXX+.   .                    ",
      "               .   ..   xXXXX+.-   ..   .               ",
      "         .   ..  ... ..xXXXX+. --.. ...  ..   .         ",
      "     .   ..  ... .....xXXXX+.  -.-..... ...  ..   .     ",
      "   .   ..  ... ......xXXXX+.  . .--...... ...  ..   .   ",
      "  .   ..  ... ......xXXXX+.    -.- -...... ...  ..   .  ",
      " .   ..  ... ......xXXXX+.   .-+-.-.-...... ...  ..   . ",
      " .   ..  ... .....xXXXX+. . --xx+.-.--..... ...  ..   . ",
      ".   ..  ... .....xXXXX+. - .-xxxx+- .-- .... ...  ..   .",
      " .   ..  ... ...xXXXX+.  -.-xxxxxx+ .---... ...  ..   . ",
      " .   ..  ... ..xXXXX+. .---..xxxxxx+-..--.. ...  ..   . ",
      "  .   ..  ... xXXXX+. . --....xxxxxx+  -.- ...  ..   .  ",
      "   .   ..  ..xXXXX+. . .-......xxxxxx+-. --..  ..   .   ",
      "     .   .. xXXXXXXXXXXXXXXXXXXXxxxxxx+. .-- ..   .     ",
      "         . xXXXXXXXXXXXXXXXXXXXXXxxxxxx+.  -- .         ",
      "           xxxxxxxxxxxxxxxxxxxxxxxxxxxxx+.--            ",
      "            xxxxxxxxxxxxxxxxxxxxxxxxxxxxx+-             ",
    }

    table.insert(theme.section.buttons.val, theme.button(
      "q",
      "󰅖  Quit NVIM",
      ":qa<CR>"
    ))

    --theme.file_icons.provider = "devicons"
    require("alpha").setup(theme.config)
  end,
}
