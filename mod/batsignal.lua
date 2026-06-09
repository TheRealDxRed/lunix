return {
  reload = function()
    os.execute("systemctl --user restart batsignal")
  end,
}
