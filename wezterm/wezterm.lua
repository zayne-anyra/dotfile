local wezterm = require('wezterm')
local config = wezterm.config_builder()

-- Event handlers
wezterm.on('toggle-opacity', function(window, pane)
    local overrides = window:get_config_overrides() or {}
    if not overrides.window_background_opacity then
        overrides.window_background_opacity = 0.95
    else
        overrides.window_background_opacity = nil
    end
    window:set_config_overrides(overrides)
end)

-- config.ssh_domains = {
--     {
--         name = 'wsl',
--         remote_address = 'localhost',
--         username = 'username', -- Replace with your WSL username
--     },
-- }
-- config.default_domain = 'wsl'

-- Connection settings
config.default_domain = 'SSH:localhost' -- Set default domain to WSL via ssh

-- Font configuration
config.font = wezterm.font('VictorMono Nerd Font', { weight = 'Medium' })
config.font_size = 15.0
config.line_height = 1.3

-- Window appearance
config.enable_tab_bar = false
config.window_decorations = 'RESIZE'
config.audible_bell = 'Disabled'
config.adjust_window_size_when_changing_font_size = false
config.initial_rows = 22
config.initial_cols = 135

-- Cursor settings
config.default_cursor_style = 'BlinkingBlock'
config.cursor_blink_rate = 600
config.animation_fps = 1

-- Window padding
config.window_padding = {
    left = 2,
    right = 0,
    top = 0,
    bottom = 0,
}

-- Color scheme (Tokyo Night theme)
config.colors = {
    foreground = '#c0caf5',
    background = '#1a1b26',
    cursor_bg = '#f0cc09',
    cursor_border = '#c0caf5',
    cursor_fg = '#1a1b26',
    selection_bg = '#33467C',
    selection_fg = '#c0caf5',

    ansi = {
        '#15161E', -- black
        '#f7768e', -- red
        '#9ece6a', -- green
        '#e0af68', -- yellow
        '#7aa2f7', -- blue
        '#bb9af7', -- magenta
        '#7dcfff', -- cyan
        '#a9b1d6', -- white
    },
    brights = {
        '#414868', -- bright black
        '#f7768e', -- bright red
        '#9ece6a', -- bright green
        '#e0af68', -- bright yellow
        '#7aa2f7', -- bright blue
        '#bb9af7', -- bright magenta
        '#7dcfff', -- bright cyan
        '#c0caf5', -- bright white
    },
}

-- Leader key
config.leader = { key = ',', mods = 'CTRL', timeout_milliseconds = 1000 }

-- Key bindings
config.keys = {
    -- Pane management
    { key = 'q', mods = 'CTRL|SHIFT',     action = wezterm.action.CloseCurrentPane({ confirm = false }) },
    { key = 'v', mods = 'LEADER',         action = wezterm.action.SplitHorizontal({ domain = 'CurrentPaneDomain' }) },
    { key = 'h', mods = 'LEADER',         action = wezterm.action.SplitVertical({ domain = 'CurrentPaneDomain' }) },

    -- Pane resizing
    { key = 'k', mods = 'CTRL|SHIFT|ALT', action = wezterm.action.AdjustPaneSize({ 'Up', 1 }) },
    { key = 'j', mods = 'CTRL|SHIFT|ALT', action = wezterm.action.AdjustPaneSize({ 'Down', 1 }) },
    { key = 'h', mods = 'CTRL|SHIFT|ALT', action = wezterm.action.AdjustPaneSize({ 'Left', 1 }) },
    { key = 'l', mods = 'CTRL|SHIFT|ALT', action = wezterm.action.AdjustPaneSize({ 'Right', 1 }) },

    -- Pane navigation
    { key = 'k', mods = 'CTRL|SHIFT',     action = wezterm.action.ActivatePaneDirection('Up') },
    { key = 'j', mods = 'CTRL|SHIFT',     action = wezterm.action.ActivatePaneDirection('Down') },
    { key = 'h', mods = 'CTRL|SHIFT',     action = wezterm.action.ActivatePaneDirection('Left') },
    { key = 'l', mods = 'CTRL|SHIFT',     action = wezterm.action.ActivatePaneDirection('Right') },

    -- Utility
    { key = 't', mods = 'ALT|SHIFT',      action = wezterm.action.EmitEvent('toggle-opacity') },
    {
        key = '@',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.SpawnCommandInNewTab({
            args = { 'C:\\Program Files\\PowerShell\\7\\pwsh.exe', '-NoLogo' },
            domain = { DomainName = 'local' },
        }),
    },

    -- Additional useful bindings
    { key = 'c', mods = 'LEADER', action = wezterm.action.SpawnTab('CurrentPaneDomain') },
    { key = 'x', mods = 'LEADER', action = wezterm.action.CloseCurrentPane({ confirm = true }) },
    { key = 'z', mods = 'LEADER', action = wezterm.action.TogglePaneZoomState },
    { key = '[', mods = 'LEADER', action = wezterm.action.ActivateCopyMode },
    { key = 'r', mods = 'LEADER', action = wezterm.action.ReloadConfiguration },

}

config.key_tables = {
    copy_mode = wezterm.gui.default_key_tables().copy_mode,
}

-- Then add your custom binding
table.insert(config.key_tables.copy_mode, {
    key = 'H',
    mods = 'SHIFT',
    action = wezterm.action.CopyMode('MoveToStartOfLine')
})

table.insert(config.key_tables.copy_mode, {
    key = 'L',
    mods = 'SHIFT',
    action = wezterm.action.CopyMode('MoveToEndOfLineContent')
})

-- Performance optimizations
config.scrollback_lines = 10000
config.max_fps = 60

return config
