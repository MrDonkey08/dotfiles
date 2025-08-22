-- local wezterm = require("wezterm")
local module = {}

function module.apply_to_config(config)
  config.max_fps = 60
  config.webgpu_power_preference = "LowPower"
end

return module
