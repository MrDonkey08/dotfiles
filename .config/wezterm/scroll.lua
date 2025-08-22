-- local wezterm = require("wezterm")
local module = {}

function module.apply_to_config(config)
  config.scrollback_lines = 4000
end

return module
