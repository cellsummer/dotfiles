local wezterm = require 'wezterm';
local act = wezterm.action

return {
 default_prog = {"c:/Program Files/WindowsApps/Microsoft.PowerShell_7.1.3.0_x64__8wekyb3d8bbwe/pwsh.exe", "-noLogo"},
 font = wezterm.font("JetBrains Mono"),
 color_scheme = "tokyonight",
keys = {
    -- activate pane selection mode with the default alphabet (labels are "a", "s", "d", "f" and so on)
    {key="8", mods="CTRL", action=act.PaneSelect},
    -- activate pane selection mode with numeric labels
    {key="9", mods="CTRL", action=act.PaneSelect{alphabet="1234567890"}},
    -- show the pane selection mode, but have it swap the active and selected panes
    {key="0", mods="CTRL", action=act.PaneSelect{mode="SwapWithActive"}},

    -- window navigation
    { key = "h", mods="ALT",
      action=act.ActivatePaneDirection("Left")},
    { key = "l", mods="ALT",
      action=act.ActivatePaneDirection("Right")},
    { key = "k", mods="ALT",
      action=act.ActivatePaneDirection("Up")},
    { key = "j", mods="ALT",
      action=act.ActivatePaneDirection("Down")},
    { key = "H", mods = "ALT", action=act.AdjustPaneSize{"Left", 5} },
    { key = "J", mods = "ALT", action=act.AdjustPaneSize{"Down", 5} },
    { key = "K", mods = "ALT", action=act.AdjustPaneSize{"Up", 5} },
    { key = "L", mods = "ALT", action=act.AdjustPaneSize{"Right", 5} },

    -- close tab
    { key = "q", mods="ALT", action=wezterm.action.CloseCurrentTab{confirm=true}},
    -- toggle full screen
    { key = "F11", action=wezterm.action.ToggleFullScreen},

    -- This will create a new split and run your default program inside it
    {key="+", mods="ALT|SHIFT",
      action=wezterm.action.SplitHorizontal{domain="CurrentPaneDomain"}},

    -- Create a new tab in the same domain as the current pane.
    {key="Enter", mods="ALT", action=act.SpawnTab("CurrentPaneDomain")},
  }
}
