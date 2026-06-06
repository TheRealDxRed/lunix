return {
  reload = function()
    -- leave the reloading to hyprctl
    os.execute("hyprctl reload")
  end,
}
