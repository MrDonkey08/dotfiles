-- Colors Config File

local wezterm = require("wezterm")

local module = {}

function module.apply_to_config(config)
	-- config.color_scheme_dirs = { "/home/donkey/.config/color/wezterm//" }
	config.color_scheme = "Wombat"

	-- config.color_schemes = {
	-- 	["Red Scheme"] = {
	-- 		background = "red",
	-- 	},
	-- 	["Blue Scheme"] = {
	-- 		background = "blue",
	-- 	},
	-- }
end

return module
