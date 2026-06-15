# envvars
set -x HYPRSHOT_DIR "$HOME/screenshots"
set -x LUA_PATH "$HOME/lunix/lua/?.lua;$HOME/lunix/lua/?/init.lua;"(luarocks path --lr-path --full)
set -x LUA_CPATH (luarocks path --lr-cpath --full)
set -x PATH $HOME/.local/bin:$PATH

set -U fish_greeting ""

if [ -f $HOME/lunix/cfg/fish/api-keys.fish ]
  source $HOME/lunix/cfg/fish/api-keys.fish
end

# commands
alias ff "fastfetch"
alias lg "lazygit"

if status is-interactive
  # Commands to run in interactive sessions can go here
  
  # Show fastfetch results when opening a terminal
  fastfetch
end
