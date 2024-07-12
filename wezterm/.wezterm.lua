local wezterm = require("wezterm")
local config = wezterm.config_builder()
local mux = wezterm.mux
local act = wezterm.action
local keybinds = require("keybinds")

wezterm.on("update-right-status", function(window, pane)
  local date = wezterm.strftime("%d-%m-%Y  %H:%M")
    window:set_right_status(wezterm.format({
      {Text=date},
  }))
end)

-- Fullscreen on start
wezterm.on("gui-startup",
  function()
    local home = wezterm.home_dir

    local stats_tab, stats_pane, window = mux.spawn_window {
      workspace = 'default',
      cwd = '~'
    }
    stats_pane:send_text('btop\n')
    stats_tab:set_title('stats')

    local conf_tab, conf_pane = window:spawn_tab({
      cwd = home .. '/.config'
    })
    conf_pane:send_text('nvim\n')
    conf_tab:set_title('conf')

    local dev_tab = window:spawn_tab({
      cwd = home .. '/dev'
    })
    dev_tab:set_title('dev')

    window:gui_window():toggle_fullscreen()
    window:gui_window():perform_action(act.ActivateTab(2), dev_tab)
  end
)

config.native_macos_fullscreen_mode = true

-- Theme
-- config.color_scheme = "Dracula (Official)"
config.color_scheme = "carbonfox"

-- Font
config.font = wezterm.font("Hack Nerd Font")
config.font_size = 12

-- Appearance
config.use_fancy_tab_bar = false
config.window_decorations = "RESIZE"
config.default_cursor_style = "BlinkingBar"
config.hide_tab_bar_if_only_one_tab = true
config.window_close_confirmation = "AlwaysPrompt"
config.tab_bar_at_bottom = true
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.leader = { key = "F12", mods = "", timeout_milliseconds = 2000}

config.keys = keybinds.keys
config.key_tables = keybinds.key_tables

config.notification_handling = 'AlwaysShow'

return config
