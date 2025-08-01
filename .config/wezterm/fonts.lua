-- Fonts Config File

local wezterm = require("wezterm")

local module = {}

function module.apply_to_config(config)
	config.font = wezterm.font("HackNerdFont")
	-- config.font_weight = "Bold"
	config.font_size = 13
end

return module
