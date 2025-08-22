-- Fonts Config File

local wezterm = require("wezterm")

local module = {}

function module.apply_to_config(config)
  config.font = wezterm.font({
    family = "HackNerdFont",
    weight = "Medium",
    harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
  })
  -- config.font_weight = "Bold"
  config.font_size = 13.5
end

return module
