-- ~/.config/hypr/hyprland.lua
-- Native Hyprland Lua configuration (0.55+)

-------------------------
-- MONITORS & WORKSPACES
-------------------------

hl.monitor({
	output = "eDP-1",
	mode = "1920x1080@60",
	position = "0x0",
	scale = 1,
})

-- Workspace monitor assignments
for _, workspace in ipairs({ 1, 2, 3, 4 }) do
	hl.workspace_rule({
		workspace = tostring(workspace),
		monitor = "DP-1",
	})
end

hl.workspace_rule({
	workspace = "5",
	monitor = "HDMI-A-1",
})

-------------------------
-- MY PROGRAMS
-------------------------

local terminal = "ghostty"
local fileManager = "dolphin"
local browser = "brave --disable-features=WaylandWpColorManagerV1 --password-store=gnome-libsecret"
local menu = "rofi -show drun"

local mainMod = "SUPER"

-------------------------
-- ENVIRONMENT VARIABLES
-------------------------

hl.env("GDK_DPI_SCALE", "1")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("GTK_FONT_NAME", "JetBrains Mono 10")
hl.env("QT_FONT_DPI", "96")
hl.env("GTK_IM_MODULE", "simple")

-------------------------
-- AUTOSTART
-------------------------

hl.on("hyprland.start", function()
	hl.exec_cmd("waybar")
	hl.exec_cmd("hyprpaper")

	-- Start applications on their respective workspaces
	hl.exec_cmd(terminal, {
		workspace = "1 silent",
	})

	hl.exec_cmd(browser, {
		workspace = "4 silent",
	})

	-- Finnish keyboard layout
	hl.exec_cmd("sh -lc 'sleep 1; setxkbmap -layout fi'")

	-- Wallpaper reload
	hl.exec_cmd("hyprpaper reload")
end)

-------------------------
-- LOOK AND FEEL
-------------------------

hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 0,
		border_size = 2,

		col = {
			active_border = {
				colors = {
					"rgba(33ccffee)",
					"rgba(00ff99ee)",
				},
				angle = 45,
			},
			inactive_border = "rgba(595959aa)",
		},

		snap = {
			enabled = true,
			window_gap = 10, -- snap distance to other windows
			monitor_gap = 10, -- snap distance to monitor edges
		},

		resize_on_border = false,
		allow_tearing = false,
		layout = "dwindle",
	},

	decoration = {
		rounding = 10,
		rounding_power = 2,

		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = 0xee1a1a1a,
		},

		blur = {
			enabled = true,
			size = 8,
			ignore_opacity = true,
			passes = 3,
			noise = 0.01,
			vibrancy = 0.1696,
		},
	},

	animations = {
		enabled = false,
	},

	dwindle = {
		preserve_split = true,
	},

	master = {
		new_status = "master",
	},

	misc = {
		force_default_wallpaper = 0,
		focus_on_activate = true,
		disable_hyprland_logo = true,
	},
})

-------------------------
-- INPUT
-------------------------

hl.config({
	input = {
		kb_layout = "fi",
		kb_options = "nodeadkeys,ctrl:nocaps",

		follow_mouse = 1,

		accel_profile = "flat",
		sensitivity = 0.0,

		touchpad = {
			natural_scroll = true,
		},
	},
})

-------------------------
-- KEYBINDINGS
-------------------------

-- Screenshots
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"))

-- Development environment launcher
hl.bind(
	mainMod .. " + SHIFT + R",
	hl.dsp.exec_cmd("env DEV_ENV=/home/veikko/git/dev /home/veikko/git/dev/scripts/dev-env-launcher")
)

-- Restart Waybar
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("pkill waybar; waybar"))

-- Applications
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))

hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))

hl.bind(mainMod .. " + O", hl.dsp.exec_cmd(browser))

hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))

-- Window management
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.close())

hl.bind(mainMod .. " + M", hl.dsp.exit())

hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))

hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())

hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())

-- Move/resize windows with mouse
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })

hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-------------------------
-- FOCUS MOVEMENT
-------------------------

hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))

hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))

hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))

hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Locking
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))

-------------------------
-- WORKSPACE SWITCHING
-------------------------

for i = 1, 10 do
	local key = i % 10

	-- Switch workspace
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))

	-- Move active window to workspace
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-------------------------
-- MULTIMEDIA KEYS
-------------------------

local function mediaBind(key, command, repeating)
	hl.bind(key, hl.dsp.exec_cmd(command), {
		locked = true,
		repeating = repeating or false,
	})
end

-- Volume
mediaBind("XF86AudioRaiseVolume", "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+", true)

mediaBind("XF86AudioLowerVolume", "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-", true)

mediaBind("XF86AudioMute", "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")

mediaBind("XF86AudioMicMute", "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle")

-- Brightness
mediaBind("XF86MonBrightnessUp", "brightnessctl s 10%+", true)

mediaBind("XF86MonBrightnessDown", "brightnessctl s 10%-", true)

-- Media player (requires playerctl)
mediaBind("XF86AudioNext", "playerctl next")
mediaBind("XF86AudioPause", "playerctl play-pause")
mediaBind("XF86AudioPlay", "playerctl play-pause")
mediaBind("XF86AudioPrev", "playerctl previous")
