local workspaces = require "workspaces"

hl.monitor({
	output = "eDP-1",
	mode = "1920x1080@60.0",
	position = "0x0",
	scale = "1.5",
})

hl.monitor({
	output = "",
	mirror = "eDP-1",
})

hl.on("hyprland.start", function()
	hl.exec_cmd("hyprlock")
	hl.exec_cmd("systemctl --user start hyprlock")
	hl.exec_cmd("awww-daemon")
	hl.exec_cmd("awww img --no-resize $HOME/lunix/img/wallpaper/warthog-in-snow.gif")
	-- hl.exec_cmd("awww img --no-resize $HOME/lunix/img/wallpaper/anime-girl-hearts.gif")
	-- hl.exec_cmd("awww img --no-resize $HOME/lunix/img/wallpaper/pichu-pop-art.gif")
	hl.exec_cmd("waybar")
	hl.exec_cmd("udiskie")
end)

-- FIXME: XWayland only *sometimes* uses the Future-Cyan cursor.
hl.env("XCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "Future-Cyan")
hl.env("HYPRCURSOR_SIZE", "32")
hl.env("HYPRCURSOR_THEME", "Future-Cyan")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")

hl.config({
	general = {
		gaps_in = 1,
		gaps_out = 2,
		border_size = 1,
		resize_on_border = true,
		allow_tearing = false,
		layout = "dwindle",

		col = {
			active_border = { colors = { "rgba(ffbd5eee)", "rgba(ff6e5eee)" }, angle = 45 },
			inactive_border = "rgba(3c4048aa)",
		},
	},

	decoration = {
		rounding = 2,
		rounding_power = 1,
		active_opacity = 0.95,
		inactive_opacity = 0.9,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = 0xee1a1a1a,
		},

		blur = {
			enabled = true,
			size = 3,
			passes = 1,
			vibrancy = 0.1696,
		},

	},

	animations = {
		enabled = true,
	},

	dwindle = {
		preserve_split = true,
	},

	master = {
		new_status = "master",
	},

	scrolling = {
		fullscreen_on_one_column = true,
	},

	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
	},

	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "caps:swapescape",
		kb_rules = "",
		follow_mouse = 1,
		sensitivity = 0,

		touchpad = {
			natural_scroll = true,
		},
	},

	xwayland = {
		force_zero_scaling = true,
	},
})

hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

hl.curve("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, spring = "easy", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace"
})

require "window_rules"
require "binds"

workspaces.setup()
