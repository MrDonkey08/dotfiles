-- Window Config File

-- local wezterm = require("wezterm")
local module = {}

function module.apply_to_config(config)
  local dimmer = { brightness = 0.1 }
  config.window_padding = {
    left = 10,
    right = 10,
    top = 10,
    bottom = 5,
  }

  config.window_background_opacity = 0.9

  config.window_background_image_hsb = {
    brightness = 0.03, -- Equivalent to tint 0.97 (inverted: 1.0 - 0.97)
  }

  config.background = {
    {
      source = {
        File = "/usr/share/backgrounds/fondos/chica-samurai-con-mascara_3840x2160_xtrafondos.com.jpg",
      },
      hsb = { brightness = 0.3 },
      horizontal_align = "Center",
    },
  }
end

return module
