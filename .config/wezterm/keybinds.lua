-- Keybind Config File

local wezterm = require("wezterm")

local module = {}

function module.apply_to_config(config)
	config.keys = {
		{
			key = "Enter",
			mods = "CTRL|SHIFT",
			action = wezterm.action.SplitHorizontal,
		},
		{
			key = "LeftArrow",
			mods = "CTRL",
			action = wezterm.action.ActivatePaneDirection("Left"),
		},
		{
			key = "RightArrow",
			mods = "CTRL",
			action = wezterm.action.ActivatePaneDirection("Right"),
		},
		{
			key = "UpArrow",
			mods = "CTRL",
			action = wezterm.action.ActivatePaneDirection("Up"),
		},
		{
			key = "DownArrow",
			mods = "CTRL",
			action = wezterm.action.ActivatePaneDirection("Down"),
		},
		-- Navigation keybindings
		{ key = "z", mods = "CTRL|SHIFT", action = wezterm.action.Search({ Regex = "^[^$#]*[$#] " }) },
		-- { key = "x", mods = "CTRL|SHIFT", action = wezterm.action.Search({ Regex = "^[^$#]*[$#] ", Reverse = true }) },
		{ key = "h", mods = "CTRL|SHIFT", action = wezterm.action.ActivateCopyMode },

		-- Tab-related keybindings
		{
			key = "t",
			mods = "CTRL|SHIFT",
			action = wezterm.action.SpawnTab("CurrentPaneDomain"),
		},
		{
			key = "q",
			mods = "CTRL|SHIFT",
			action = wezterm.action.CloseCurrentTab({
				confirm = false,
			}),
		},
		{
			key = "RightArrow",
			mods = "CTRL|SHIFT",
			action = wezterm.action.ActivateTabRelative(1),
		},
		{
			key = "LeftArrow",
			mods = "CTRL|SHIFT",
			action = wezterm.action.ActivateTabRelative(-1),
		},
		{
			key = "l",
			mods = "CTRL|SHIFT",
			action = wezterm.action.ActivateKeyTable({
				name = "next_layout",
				one_shot = false,
			}),
		},
		{
			key = ".",
			mods = "CTRL|SHIFT",
			action = wezterm.action.MoveTabRelative(1),
		},
		{
			key = ",",
			mods = "CTRL|SHIFT",
			action = wezterm.action.MoveTabRelative(-1),
		},
		{
			key = "t",
			mods = "CTRL|SHIFT|ALT",
			action = wezterm.action.PromptInputLine({
				description = "Set Tab Title",
				action = wezterm.action_callback(function(window, pane, line)
					if line then
						window:set_tab_title(line)
					end
				end),
			}),
		},
	}
end

return module
