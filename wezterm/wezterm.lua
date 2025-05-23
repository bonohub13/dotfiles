local wezterm = require[[wezterm]]
local config = {}
local editor = os.getenv([[EDITOR]])
local home = os.getenv([[HOME]])

if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- Font
config.font_size = 12.5
config.font = wezterm.font_with_fallback {
    -- [[NotoSansMono-Medium]],
    [[FiraCode Nerd Font Propo]],
    [[JetBrains Mono]],
    [[Symbols Nerd Font Mono]],
    [[Noto Color Emoji]],
}

-- Window decorations
config.window_decorations = [[NONE]]
config.window_frame = {
    font = wezterm.font { family = [[FiraCode Nerd Font Propo]], weight = [[Bold]] },
    font_size = 10.0,
}
-- config.window_background_opacity = 1.0
-- config.text_background_opacity = 1.0
config.window_background_opacity = 0.625
config.text_background_opacity = 0.775
config.inactive_pane_hsb = {
    saturation = 0.75,
    brightness = 1.0,
}
config.color_scheme = [[Catpuccin Frappe]]

-- Keymaps
config.leader = {
    key = [[b]],
    mods = [[CTRL]],
    timeout_milliseconds = 5000,
}
config.keys = {
    {   -- Split vertical
        key = [[s]],
        mods = [[LEADER]],
        action = wezterm.action.SplitVertical {
            domain = [[CurrentPaneDomain]],
        },
    },
    {   -- Split horizontal
        key = [[v]],
        mods = [[LEADER]],
        action = wezterm.action.SplitHorizontal {
            domain = [[CurrentPaneDomain]],
        },
    },
    {   -- Move to up
        key = [[k]],
        mods = [[LEADER]],
        action = wezterm.action.ActivatePaneDirection([[Up]]),
    },
    {   -- Move to below
        key = [[j]],
        mods = [[LEADER]],
        action = wezterm.action.ActivatePaneDirection([[Down]]),
    },
    {   -- Move to left
        key = [[h]],
        mods = [[LEADER]],
        action = wezterm.action.ActivatePaneDirection([[Left]]),
    },
    {   -- Move to right
        key = [[l]],
        mods = [[LEADER]],
        action = wezterm.action.ActivatePaneDirection([[Right]]),
    },
    {   -- Move to up
        key = [[UpArrow]],
        mods = [[LEADER]],
        action = wezterm.action.ActivatePaneDirection([[Up]]),
    },
    {   -- Move to below
        key = [[DownArrow]],
        mods = [[LEADER]],
        action = wezterm.action.ActivatePaneDirection([[Down]]),
    },
    {   -- Move to left
        key = [[LeftArrow]],
        mods = [[LEADER]],
        action = wezterm.action.ActivatePaneDirection([[Left]]),
    },
    {   -- Move to right
        key = [[RightArrow]],
        mods = [[LEADER]],
        action = wezterm.action.ActivatePaneDirection([[Right]]),
    },
    {   -- New tab
        key = [[t]],
        mods = [[LEADER]],
        action = wezterm.action.SpawnTab([[CurrentPaneDomain]]),
    },
    {   -- Next tab
        key = [[n]],
        mods = [[LEADER]],
        action = wezterm.action.ActivateTabRelative(1),
    },
    {   -- Previous tab
        key = [[p]],
        mods = [[LEADER]],
        action = wezterm.action.ActivateTabRelative(-1),
    },
    {   -- Show tab navigator
        key = [[;]],
        mods = [[LEADER]],
        action = wezterm.action.ShowTabNavigator
    },
    {   -- Show tab navigator
        key = [[c]],
        mods = [[LEADER]],
        action = wezterm.action.SpawnCommandInNewTab {
            args = { editor, home .. [[/.config/wezterm/wezterm.lua]] }
        }
    },
    {   -- Adjust pane size to up
        key = [[k]],
        mods = [[CTRL]],
        action = wezterm.action.AdjustPaneSize{ [[Up]], 5 },
    },
    {   -- Adjust pane size to below
        key = [[j]],
        mods = [[CTRL]],
        action = wezterm.action.AdjustPaneSize{ [[Down]], 5 },
    },
    {   -- Adjust pane size to left
        key = [[h]],
        mods = [[CTRL]],
        action = wezterm.action.AdjustPaneSize{ [[Left]], 5 },
    },
    {   -- Adjust pane size to right
        key = [[l]],
        mods = [[CTRL]],
        action = wezterm.action.AdjustPaneSize{ [[Right]], 5 },
    },
    {   -- Adjust pane size to up
        key = [[UpArrow]],
        mods = [[CTRL]],
        action = wezterm.action.AdjustPaneSize{ [[Up]], 5 },
    },
    {   -- Adjust pane size to below
        key = [[DownArrow]],
        mods = [[CTRL]],
        action = wezterm.action.AdjustPaneSize{ [[Down]], 5 },
    },
    {   -- Adjust pane size to left
        key = [[LeftArrow]],
        mods = [[CTRL]],
        action = wezterm.action.AdjustPaneSize{ [[Left]], 5 },
    },
    {   -- Adjust pane size to right
        key = [[RightArrow]],
        mods = [[CTRL]],
        action = wezterm.action.AdjustPaneSize{ [[Right]], 5 },
    },
}

-- Etc
config.warn_about_missing_glyphs = false
config.notification_handling = [[NeverShow]]

return config
