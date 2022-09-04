local wezterm = require 'wezterm';
local act = wezterm.action

return {
    default_prog = {
        "c:/Program Files/WindowsApps/Microsoft.PowerShell_7.1.3.0_x64__8wekyb3d8bbwe/pwsh.exe",
        "-noLogo"
    },
    -- Appearance
    default_cursor_style = "BlinkingBar",
    font = wezterm.font("Hack"),
    -- color_scheme = "tokyonight",
    color_scheme = "Catppuccin Macchiato",
    -- color_scheme = "Catppuccin Latte",
    inactive_pane_hsb = {
        saturation = 0.8,
        brightness = 0.4,
    },
    -- quick mode

    --quick_select_patterns = {'[a-zA-Z:\\]*', },

    -- Keybindings
    keys = {
        -- activate pane selection mode with the default alphabet (labels are "a", "s", "d", "f" and so on)
        -- {key=";", mods="ALT", action=act.PaneSelect},
        -- activate pane selection mode with numeric labels
        { key = ";", mods = "ALT", action = act.PaneSelect },
        -- show the pane selection mode, but have it swap the active and selected panes
        -- {key="Space", mods="ALT", action=act.PaneSelect{mode="SwapWithActive"}},
        -- Toggle max pane
        { key = 'Space', mods = 'ALT', action = wezterm.action.TogglePaneZoomState },

        -- window navigation
        { key = "h", mods = "ALT",
            action = act.ActivatePaneDirection("Left") },
        { key = "l", mods = "ALT",
            action = act.ActivatePaneDirection("Right") },
        { key = "k", mods = "ALT",
            action = act.ActivatePaneDirection("Up") },
        { key = "j", mods = "ALT",
            action = act.ActivatePaneDirection("Down") },
        { key = "H", mods = "ALT", action = act.AdjustPaneSize { "Left", 5 } },
        { key = "J", mods = "ALT", action = act.AdjustPaneSize { "Down", 5 } },
        { key = "K", mods = "ALT", action = act.AdjustPaneSize { "Up", 5 } },
        { key = "L", mods = "ALT", action = act.AdjustPaneSize { "Right", 5 } },

        -- close tab
        { key = "q", mods = "ALT", action = wezterm.action.CloseCurrentPane { confirm = false } },
        -- toggle full screen
        { key = "F11", action = wezterm.action.ToggleFullScreen },

        -- This will create a new split and run your default program inside it
        { key = "Enter", mods = "ALT",
            action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" } },

        { key = "Enter", mods = "ALT|SHIFT",
            action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" } },

        -- Active Copy Mode
        { key = "v", mods = "ALT", action = act.ActivateCopyMode },
        -- Create a new tab in the same domain as the current pane.
        { key = "+", mods = "ALT|SHIFT", action = act.SpawnTab("CurrentPaneDomain") },
    }
}
