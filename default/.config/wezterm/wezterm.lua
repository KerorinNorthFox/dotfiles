-- set windows environment variable
-- '\\wsl$\Ubuntu\home\kerorinnf\dotfiles\default\.config\wezterm\wezterm.lua'
-- as 'WEZTERM_CONFIG_FILE' if using wsl.
local wezterm = require("wezterm")
local config = wezterm.config_builder()

--
-- basics
--
config.automatically_reload_config = true -- same as default value
config.audible_bell = "Disabled"
config.use_ime = true
config.default_domain = "WSL:Ubuntu"

--
-- visibility
--
config.enable_scroll_bar = true
config.min_scroll_bar_height = "2cell"
config.window_decorations = "RESIZE" -- タイトルバー非表示
config.show_tabs_in_tab_bar = true
config.window_frame = {
	inactive_titlebar_bg = "none",
	active_titlebar_bg = "none",
}

--
-- fonts
--
config.font = wezterm.font("FiraCode Nerd Font Mono", { weight = "Medium", stretch = "Normal", style = "Normal" })
config.font_size = 10.0

--
-- theme, colors
--
config.color_scheme = "iceberg-dark"
config.colors = {
	scrollbar_thumb = "white",
}
config.background = {
	{
		source = {
			File = os.getenv("USERPROFILE") .. "/terminal_vscode_background/terminal/image.jpg",
		},
		repeat_x = "NoRepeat",
		hsb = {
			brightness = 0.1,
		},
	},
}
-- タブの見た目
local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_lower_right_triangle
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_lower_left_triangle
wezterm.on("format-tab-title", function(tab, tabs, panes, conf, hover, max_width)
	local background = "#84A0C6"
	local foreground = "#C6C8D1"
	local edge_background = "none"
	if tab.is_active then
		background = "#B4BE82"
		foreground = "#1E2132"
	end
	local edge_foreground = background
	local title = "   " .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. "   "
	return {
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_LEFT_ARROW },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = title },
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_RIGHT_ARROW },
	}
end)

return config
