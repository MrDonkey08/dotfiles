-- Window Config File

-- local wezterm = require("wezterm")
local module = {}

function module.apply_to_config(config)
  config.window_padding = {
    left = 10,
    right = 10,
    top = 10,
    bottom = 5,
  }

  config.window_background_opacity = 0.9
end

return module
