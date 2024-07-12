-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap -- for conciseness
-- delete single character without copying into register
keymap.set("n", "x", '"_x')
-- delete without copying into register
keymap.set("n", "d", '"_d')
-- paste without copying into register
keymap.set("v", "p", '"_dP')

-- resize current pane
keymap.set('n', '<A-Up>', ':resize +4<CR>', { noremap = true, silent = true })
keymap.set('n', '<A-Down>', ':resize -4<CR>', { noremap = true, silent = true })
keymap.set('n', '<A-Left>', ':vertical resize +4<CR>', { noremap = true, silent = true })
keymap.set('n', '<A-Right>', ':vertical resize -4<CR>', { noremap = true, silent = true })
