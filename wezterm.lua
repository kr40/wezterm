-- Wezterm configuration file (See https://wezfurlong.org/wezterm/config/files.html)
-- luacheck: ignore

-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Shorten wezterm.mux to mux
local mux = wezterm.mux

-- Set font
config.font = wezterm.font("CaskaydiaCove Nerd Font", { weight = "Regular" })

-- Set font size
config.font_size = 15.0

-- Set colorscheme
config.color_scheme = "tokyonight_night"

-- Remove window decorations (titlebar)
config.window_decorations = "RESIZE"

-- Disable dead keys
config.use_dead_keys = false

-- Set scrollback lines
config.scrollback_lines = 10000

-- Disable missing glyphs warning
config.warn_about_missing_glyphs = false

-- Set tab font
config.window_frame = {
	font = wezterm.font({ family = "CaskaydiaCove Nerd Font", weight = "Regular" }),
}

-- Set cursor style
config.default_cursor_style = "SteadyBar"

-- Set maximum window size on startup
wezterm.on("gui-startup", function()
	local tab, pane, window = mux.spawn_window({})
	window:gui_window():maximize()
end)

return config
