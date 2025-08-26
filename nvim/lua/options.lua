require "nvchad.options"

-- add yours here!
local o = vim.o
local p = vim.opt

o.number = true
o.relativenumber = true
o.autoindent = true
o.scrolloff = 8
o.cmdheight = 1
o.cursorlineopt = "both" -- to enable cursorline!
o.clipboard = "unnamedplus"
o.shiftwidth = 4
o.tabstop = 4
o.cmdheight = 0
o.shell = "pwsh.exe"
o.shellcmdflag = "-NoLogo"

if vim.fn.has("termguicolors") == 1 then
    o.termguicolors = true
    -- Enable undercurl
    vim.api.nvim_set_var('t_Cs', '\\e[4:3m')
    vim.api.nvim_set_var('t_Ce', '\\e[4:0m')
end
-- Enables true color's syntax highlight
-- vim.opt.termguicolors = true
-- vim.cmd([[let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"]])
-- vim.cmd([[let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"]])
-- if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
-- end

p.guicursor = {
    "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50",
    "a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor",
    "sm:block-blinkwait175-blinkoff150-blinkon175",
}
-- vim.g.terminal_emulator = "powershell"
-- o.cursorlineopt ='both' -- to enable cursorline!
if vim.g.neovide then
    require("configs.neovide")
end
