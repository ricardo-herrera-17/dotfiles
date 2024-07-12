-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt -- for conciseness
opt.autoindent = true -- copy indent from current line when starting new one
-- line wrapping
opt.wrap = true -- disable line wrapping

-- disable autoformat
vim.g.autoformat = false
