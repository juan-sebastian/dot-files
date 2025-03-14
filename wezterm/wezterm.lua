local wezterm = require 'wezterm'
local config = {}

-- Font configuration
config.font = wezterm.font('Hack Nerd Font Mono')
config.font_size = 12.0

-- Opacity settings (WezTerm uses 0.0-1.0 scale)
config.window_background_opacity = 1.0

-- Remote control/CLI access
config.enable_wayland = true  -- Similar to allowing remote control

-- Disable confirmation prompt when closing
config.window_close_confirmation = 'NeverPrompt'

return config
