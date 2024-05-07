local wezterm = require[[wezterm]]
local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- Font
config.font_size = 12.0
config.font = wezterm.font_with_fallback {
    [[Fira Code]],
    [[JetBrains Mono]],
    [[Symbols Nerd Font Mono]],
    [[Noto Color Emoji]],
}

-- Window decorations
config.window_decorations = [[NONE]]
config.window_frame = {
    font = wezterm.font { family = [[Fira Code]], weight = [[Bold]] },
    font_size = 10.0,
}
config.window_background_opacity = 0.925
config.text_background_opacity = 0.75
config.inactive_pane_hsb = {
    saturation = 0.75,
    brightness = 1.0,
}
config.color_scheme = [[tokyonight_moon]]

-- Keymaps
config.leader = {
    key = [[b]],
    mods = [[CTRL]],
    timeout_milliseconds = 1000,
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
}

-- Etc
config.warn_about_missing_glyphs = false
config.notification_handling = [[NeverShow]]

return config
