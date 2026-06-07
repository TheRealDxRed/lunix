return {
  reload = function()
    -- the SIGUSR2 interrupt triggers a restart for waybar
    os.execute("killall -SIGUSR2 waybar")
  end
}
