-- local wezterm = require("wezterm")
local module = {}

function module.apply_to_config(config)
  -- cursor blinkning
  config.animation_fps = 5
  config.cursor_blink_rate = 600
  config.cursor_blink_ease_in = "Constant"
  config.cursor_blink_ease_out = "Constant"

  -- cursor style
  config.default_cursor_style = "BlinkingBar"
  config.cursor_thickness = 1.8
  config.detect_password_input = true
end

return module
