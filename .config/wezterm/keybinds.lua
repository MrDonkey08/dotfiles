-- Keybind Config File

local wezterm = require("wezterm")
local act = wezterm.action
local module = {}

function module.apply_to_config(config)
	config.keys = {
		-- clipboard
		{
			key = "c",
			mods = "CTRL|SHIFT",
			action = act.CopyTo("Clipboard"),
		},
		{
			key = "v",
			mods = "CTRL|SHIFT",
			action = act.PasteFrom("Clipboard"),
		},

		-- scroll by line (j/k duplicates)
		{
			key = "DownArrow",
			mods = "CTRL|SHIFT",
			action = act.ScrollByLine(1),
		},
		{
			key = "UpArrow",
			mods = "CTRL|SHIFT",
			action = act.ScrollByLine(-1),
		},
		{
			key = "j",
			mods = "CTRL|SHIFT",
			action = act.ScrollByLine(1),
		},
		{
			key = "k",
			mods = "CTRL|SHIFT",
			action = act.ScrollByLine(-1),
		},

		-- scroll by page
		{
			key = "PageUp",
			mods = "CTRL|SHIFT",
			action = act.ScrollByPage(-1),
		},
		{
			key = "PageDown",
			mods = "CTRL|SHIFT",
			action = act.ScrollByPage(1),
		},

		-- home / end
		{
			key = "Home",
			mods = "CTRL|SHIFT",
			action = act.ScrollToTop,
		},
		{
			key = "End",
			mods = "CTRL|SHIFT",
			action = act.ScrollToBottom,
		},

		-- scroll to prompt (requires OSC133 / shell integration to be most effective)
		{
			key = "z",
			mods = "CTRL|SHIFT",
			action = act.ScrollToPrompt(-1),
		},
		{
			key = "x",
			mods = "CTRL|SHIFT",
			action = act.ScrollToPrompt(1),
		},

		-- copy / show scrollback / last command output
		{
			key = "h",
			mods = "CTRL|SHIFT",
			action = act.ActivateCopyMode,
		},
		{
			key = "g",
			mods = "CTRL|SHIFT",
			action = act.Multiple({
				act.ActivateCopyMode,
				act.ScrollToPrompt(-1),
			}),
		},

		-- spawn / new window / close / navigation
		{
			key = "Enter",
			mods = "CTRL|SHIFT",
			action = act.SplitHorizontal,
		},

		{
			key = "w",
			mods = "CTRL|SHIFT",
			action = act.CloseCurrentPane({ confirm = true }),
		},
		{
			key = "n",
			mods = "CTRL|SHIFT",
			action = act.ActivateTabRelative(1),
		},
		{
			key = "p",
			mods = "CTRL|SHIFT",
			action = act.ActivateTabRelative(-1),
		},
		{
			key = "f",
			mods = "CTRL|SHIFT",
			action = act.MoveTabRelative(1),
		},
		{
			key = "b",
			mods = "CTRL|SHIFT",
			action = act.MoveTabRelative(-1),
		},

		-- resizing mode: press CTRL|SHIFT+r then use arrow keys to resize panes (approx of start_resizing_window)
		{
			key = "r",

			mods = "CTRL|SHIFT",

			action = act.ActivateKeyTable({
				name = "resize_pane",

				one_shot = false,
				-- stay in table until Escape
			}),
		},

		{
			key = "s",
			mods = "CTRL|SHIFT",
			action = act.PaneSelect({ mode = "SwapWithActiveKeepFocus" }),
		},

		-- tabs: next / previous / new / close / move tab
		{
			key = "Tab",
			mods = "CTRL",
			action = act.ActivateTabRelative(1),
		},
		{
			key = "Tab",
			mods = "CTRL|SHIFT",
			action = act.ActivateTabRelative(-1),
		},
		{
			key = "t",
			mods = "CTRL|SHIFT",
			action = act.SpawnCommandInNewTab({}),
		},
		{
			key = "q",
			mods = "CTRL|SHIFT",
			action = act.CloseCurrentTab({ confirm = true }),
		},
		{
			key = ".",
			mods = "CTRL|SHIFT",
			action = act.MoveTabRelative(1),
		},
		{
			key = ",",
			mods = "CTRL|SHIFT",
			action = act.MoveTabRelative(-1),
		},

		{
			key = "l",
			mods = "CTRL|SHIFT",
			action = act.TogglePaneZoomState,
		},

		-- font size changes
		{
			key = "=",
			mods = "CTRL|SHIFT",
			action = act.IncreaseFontSize,
		},
		{
			key = "-",
			mods = "CTRL|SHIFT",
			action = act.DecreaseFontSize,
		},
		{
			key = "Backspace",
			mods = "CTRL|SHIFT",
			action = act.ResetFontSize,
		},

		-- quick-select / open URLs
		{
			key = "e",
			mods = "CTRL|SHIFT",
			action = act.QuickSelect,
		},

		-- unicode / char selection
		{
			key = "u",
			mods = "CTRL|SHIFT",
			action = act.CharSelect,
		},

		{
			key = "Escape",
			mods = "CTRL|SHIFT",
			action = act.ShowLauncher,
		},

		-- neighboring window navigation (map to pane directions)
		{
			key = "LeftArrow",
			mods = "CTRL",
			action = act.ActivatePaneDirection("Left"),
		},
		{
			key = "RightArrow",
			mods = "CTRL",
			action = act.ActivatePaneDirection("Right"),
		},
		{
			key = "UpArrow",
			mods = "CTRL",
			action = act.ActivatePaneDirection("Up"),
		},
		{
			key = "DownArrow",
			mods = "CTRL",
			action = act.ActivatePaneDirection("Down"),
		},

		-- additional: toggle layout stack conflict resolution
		-- The second occurrence in your kitty.conf: kitty_mod+z -> toggle_layout stack
		-- Provide TogglePaneZoomState also on CTRL|SHIFT|Z (so both behaviors are reachable)
		{
			key = "Z",
			mods = "CTRL|SHIFT",
			action = act.TogglePaneZoomState,
		},

		{
			key = "t",
			mods = "CTRL|SHIFT|ALT",
			action = act.PromptInputLine({
				description = "Set tab title",

				action = wezterm.action_callback(function(window, pane, line)
					if line then
						window:active_tab():set_title(line)
					end
				end),
			}),
		},

		{
			key = "Enter",
			mods = "CTRL|SHIFT|ALT",
			action = act.SpawnCommandInNewTab({}),
		},
	}

	-- Key table for resizing mode started by CTRL|SHIFT+r
	config.key_tables = {
		resize_pane = {
			-- Arrows adjust the active pane by 5 cells
			{
				key = "LeftArrow",
				action = act.AdjustPaneSize({ "Left", 5 }),
			},

			{
				key = "RightArrow",
				action = act.AdjustPaneSize({ "Right", 5 }),
			},

			{
				key = "UpArrow",
				action = act.AdjustPaneSize({ "Up", 5 }),
			},

			{
				key = "DownArrow",
				action = act.AdjustPaneSize({ "Down", 5 }),
			},

			-- smaller adjustments (one cell) when holding Shift
			{
				key = "LeftArrow",
				mods = "SHIFT",
				action = act.AdjustPaneSize({ "Left", 1 }),
			},

			{
				key = "RightArrow",
				mods = "SHIFT",
				action = act.AdjustPaneSize({ "Right", 1 }),
			},

			{
				key = "UpArrow",
				mods = "SHIFT",
				action = act.AdjustPaneSize({ "Up", 1 }),
			},

			{
				key = "DownArrow",
				mods = "SHIFT",
				action = act.AdjustPaneSize({ "Down", 1 }),
			},

			-- Escape or 'q' exit the resize key table
			{
				key = "Escape",
				action = act.PopKeyTable,
			},

			{
				key = "q",
				action = act.PopKeyTable,
			},
		},
	}
end

return module
