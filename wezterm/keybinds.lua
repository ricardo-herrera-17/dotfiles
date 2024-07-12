local M = {}
local wezterm = require("wezterm")
local act = wezterm.action

M.keys = {
	{
    key = "LeftArrow",
    mods = "OPT",
    action = act.SendString("\x1bb")
  },
	{
    key = "RightArrow",
    mods = "OPT",
    action = act.SendString("\x1bf")
  },
	{
    key = "h",
    mods = "CMD",
    action = act.SendKey({ key = "h", mods = "CTRL" })
  },
	{
    key = "j",
    mods = "CMD",
    action = act.SendKey({ key = "j", mods = "CTRL" })
  },
	{
    key = "k",
    mods = "CMD",
    action = act.SendKey({ key = "k", mods = "CTRL" })
  },
	{
    key = "l",
    mods = "CMD",
    action = act.SendKey({ key = "l", mods = "CTRL" })
  },
	{
    key = "w",
    mods = "CMD",
    action = act.CloseCurrentTab({ confirm = true })
  },
	{
    key = "i",
    mods = "LEADER",
    action = act.SplitVertical({ domain = "CurrentPaneDomain" })
  },
	{
    key = "o",
    mods = "LEADER",
    action = act.SplitHorizontal({ domain = "CurrentPaneDomain" })
  },
	{
    key = "u",
    mods = "LEADER",
    action = act.PaneSelect
  },
	{
    key = "v",
    mods = "LEADER",
    action = act.ActivateCopyMode
  },
  {
    key = "+",
    mods = "LEADER",
    action = wezterm.action.IncreaseFontSize
  },
  {
    key = "-",
    mods = "LEADER",
    action = wezterm.action.DecreaseFontSize
  },
  {
    key = 'd',
    mods = 'LEADER',
    action = wezterm.action.SendString("\x15") -- delete contents on prompt
  },

  {
    key = "t",
    mods = "LEADER",
    action = act.PromptInputLine({
      description = "Enter new tab name:",
      action = wezterm.action_callback(function(window, pane, line)
        if line then
          local tab = window:mux_window():spawn_tab({
            cwd = wezterm.home_dir .. "/me",
          })
          tab:set_title(line)
          tab:activate()
        end
      end),
    }),
  },
  {
    key = "r",
    mods = "LEADER",
    action = act.PromptInputLine({
      description = "Enter tab name:",
      action = wezterm.action_callback(function(window, pane, line)
        if line then
          window:active_tab():set_title(line)
        end
      end),
    }),
  },
	{
		key = "p",
		mods = "LEADER",
		action = act.ActivateKeyTable({
      name = 'resize_pane',
      one_shot = false,
      timeout_milliseconds = 1000,
    })
	},
	{
		key = "m",
		mods = "LEADER",
		action = act.ActivateKeyTable({
      name = 'move_to_pane',
      one_shot = false,
      timeout_milliseconds = 1000,
    })
	},
}

M.key_tables = {
  resize_pane = {
    {
      key = "h",
      action = act.AdjustPaneSize({ "Left", 3 }),
    },
    {
      key = "j",
      action = act.AdjustPaneSize({ "Down", 3 }),
    },
    {
      key = "k",
      action = act.AdjustPaneSize({ "Up", 3 })
    },
    {
      key = "l",
      action = act.AdjustPaneSize({ "Right", 3 }),
    },
    {
      key = "q",
      action = "PopKeyTable",
    },
    {
      key = "Escape",
      action = "PopKeyTable",
    },
  },

  move_to_pane = {
    {
      key = "h",
      action = act.ActivatePaneDirection 'Left',
    },
    {
      key = "j",
      action = act.ActivatePaneDirection 'Down',
    },
    {
      key = "k",
      action = act.ActivatePaneDirection 'Up',
    },
    {
      key = "l",
      action = act.ActivatePaneDirection 'Right',
    },
    {
      key = "q",
      action = "PopKeyTable",
    },
    {
      key = "Escape",
      action = "PopKeyTable",
    },
  }
}

return M
