-- local wezterm = require("wezterm")

-- Importing configs
local colors = require("colors")
local fonts = require("fonts")
local keybinds = require("keybinds")
local window = require("window")

local config = {}

-- Applying external configs
colors.apply_to_config(config)
fonts.apply_to_config(config)
window.apply_to_config(config)
keybinds.apply_to_config(config)

return config
