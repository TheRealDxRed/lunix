local programs = require "programs"

hl.bind("SUPER + T", hl.dsp.exec_cmd(programs.terminal))
hl.bind("SUPER + R", hl.dsp.exec_cmd(programs.app_menu))
hl.bind("SUPER + SHIFT + R", hl.dsp.exec_cmd(programs.menu))

hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("SUPER + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + SHIFT + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind("SUPER + P", hl.dsp.window.pseudo())
hl.bind("SUPER + H", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + CONTROL + H", hl.dsp.window.move({ direction = "left" }))
hl.bind("SUPER + CONTROL + J", hl.dsp.window.move({ direction = "down" }))
hl.bind("SUPER + CONTROL + K", hl.dsp.window.move({ direction = "up" }))
hl.bind("SUPER + CONTROL + L", hl.dsp.window.move({ direction = "right" }))
hl.bind("SUPER + bracketleft", function()
	local current_layout = hl.get_active_workspace().tiled_layout
	if current_layout == "monocle" or current_layout == "master" then
		hl.dispatch(hl.dsp.layout("cycleprev"))
	end
end)
hl.bind("SUPER + bracketright", function()
	local current_layout = hl.get_active_workspace().tiled_layout
	if current_layout == "monocle" or current_layout == "master" then
		hl.dispatch(hl.dsp.layout("cyclenext"))
	end
end)

hl.bind(
	"SUPER + BackSpace",
	hl.dsp.exec_cmd(programs.dismiss_notification),
	{ locked = true }
)

hl.bind(
	"SUPER + SHIFT + BackSpace",
	hl.dsp.exec_cmd(programs.dismiss_all_notifications),
	{ locked = true }
)

hl.bind(
	"SUPER + SHIFT + L",
	hl.dsp.exec_cmd(programs.lock_session),
	{ locked = true }
)

hl.bind(
	"switch:on:Lid Switch",
	hl.dsp.exec_cmd(programs.lock_session),
	{ locked = true }
)

hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd(programs.toggle_spk_mute),
	{ locked = true, repeating = true }
)

hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd(programs.lower_volume),
	{ locked = true, repeating = true }
)

hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd(programs.raise_volume),
	{ locked = true, repeating = true }
)

hl.bind(
	"SHIFT + XF86AudioLowerVolume",
	hl.dsp.exec_cmd(programs.lower_volume_mod),
	{ locked = true, repeating = true }
)

hl.bind(
	"SHIFT + XF86AudioRaiseVolume",
	hl.dsp.exec_cmd(programs.raise_volume_mod),
	{ locked = true, repeating = true }
)

hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd(programs.toggle_mic_mute),
	{ locked = true, repeating = true }
)

hl.bind(
	"XF86MonBrightnessDown",
	hl.dsp.exec_cmd(programs.lower_brightness),
	{ locked = true, repeating = true }
)

hl.bind(
	"XF86MonBrightnessUp",
	hl.dsp.exec_cmd(programs.raise_brightness),
	{ locked = true, repeating = true }
)

hl.bind(
	"SHIFT + XF86MonBrightnessDown",
	hl.dsp.exec_cmd(programs.lower_brightness_mod),
	{ locked = true, repeating = true }
)

hl.bind(
	"SHIFT + XF86MonBrightnessUp",
	hl.dsp.exec_cmd(programs.raise_brightness_mod),
	{ locked = true, repeating = true }
)

hl.bind(
	"XF86Calculator",
	hl.dsp.exec_cmd(programs.calculator),
	{ locked = true, repeating = true }
)

--[ SCREENSHOT ]--
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd(programs.screenshot_region))
hl.bind("SUPER + ALT + SHIFT + S", hl.dsp.exec_cmd(programs.screenshot_window))
hl.bind("SUPER + CONTROL + SHIFT + S", hl.dsp.exec_cmd(programs.screenshot_fullscreen))

hl.bind("SUPER + Print", hl.dsp.exec_cmd(programs.screenshot_region))
hl.bind("SUPER + ALT + Print", hl.dsp.exec_cmd(programs.screenshot_window))
hl.bind("SUPER + CONTROL + Print", hl.dsp.exec_cmd(programs.screenshot_fullscreen))
