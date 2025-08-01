-- Window Config File

local wezterm = require("wezterm")

local module = {}

function module.apply_to_config(config)
	config.window_padding = {
		left = 20,
		right = 20,
		top = 20,
		bottom = 25,
	}
end

return module
