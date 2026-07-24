local programs = {
  terminal = "kitty",
  menu = "wofi --show run",
  app_menu = "wofi --show drun",
  calculator = "kitty ipython",
  lock_session = "loginctl lock-session",

  raise_volume = "pactl -- set-sink-volume @DEFAULT_SINK@ +5%",
  lower_volume = "pactl -- set-sink-volume @DEFAULT_SINK@ -5%",
  raise_volume_mod = "pactl -- set-sink-volume @DEFAULT_SINK@ +1%",
  lower_volume_mod = "pactl -- set-sink-volume @DEFAULT_SINK@ -1%",
  toggle_spk_mute = "pactl -- set-sink-mute @DEFAULT_SINK@ toggle",
  toggle_mic_mute = "pactl -- set-sink-mute @DEFAULT_SOURCE@ toggle",
  raise_brightness = "brightnessctl s 5%+",
  lower_brightness = "brightnessctl s 5%-",
  raise_brightness_mod = "brightnessctl s 1%+",
  lower_brightness_mod = "brightnessctl s 1%-",

  screenshot_fullscreen = "hyprshot -m output --clipboard-only",
  screenshot_window = "hyprshot -m window --clipboard-only",
  screenshot_region = "hyprshot -m region --clipboard-only",

  dismiss_notification = "makoctl dismiss",
  dismiss_all_notifications = "makoctl dismiss -a",
}

return programs
