vim.opt.linespace = 3
vim.o.guifont = "VictorMono NFP:h16"
vim.g.neovide_refresh_rate = 60
-- vim.g.neovide_fullscreen = true
vim.g.neovide_cursor_trail_size = 0.1
vim.g.neovide_cursor_antialiasing = true
vim.g.neovide_cursor_animation_length = 0
vim.g.neovide_cursor_animate_command_line = false
vim.g.neovide_cursor_animate_in_insert_mode = false

vim.keymap.set('v', '<C-S-c>', '"+y')         -- Copy
vim.keymap.set('n', '<C-S-v>', '"+P')         -- Paste normal mode
vim.keymap.set('v', '<C-S-v>', '"+P')         -- Paste visual mode
vim.keymap.set('c', '<C-S-v>', '<C-R>+')      -- Paste command mode
vim.keymap.set('i', '<C-S-v>', '<ESC>l"+Pli') -- Paste insert mode

-- Allow clipboard copy paste in neovim
vim.api.nvim_set_keymap('', '<C-S-v>', '+p<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('!', '<C-S-v>', '<C-R>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-S-v>', '<C-R>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-S-v>', '<C-R>+', { noremap = true, silent = true })

vim.g.neovide_scale_factor = 1.0
local change_scale_factor = function(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
end
vim.keymap.set({ "n", "i" }, "<C-=>", function()
    change_scale_factor(1.25)
end)
vim.keymap.set({ "n", "i" }, "<C-->", function()
    change_scale_factor(1 / 1.25)
end)

-- Only map if running under Neovide
-- Map Alt+Enter in normal & insert modes to toggle fullscreen
vim.keymap.set({ 'n', 'i' }, '<A-CR>', function()
    vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
end, { desc = '  Toggle Neovide fullscreen', silent = true })
