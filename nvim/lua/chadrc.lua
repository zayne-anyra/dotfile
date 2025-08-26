-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

local colors = dofile(vim.g.base46_cache .. "colors")

---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "tokyonight",
    -- theme = "monokai_pro",     -- default/vscode/vscode_colored/minimal

    hl_add = {
        DiagnosticUnderlineWarn = { undercurl = true, sp = colors.yellow, underline = false },
        DiagnosticUnderlineHint = { undercurl = true, sp = colors.purple, underline = false },
        DiagnosticUnderlineError = { undercurl = true, sp = colors.red, underline = false },
    },

}

M.ui = {
    tabufline = {
        lazyload = false,
    },

    statusline = {
        theme = "vscode_colored", -- default/vscode/vscode_colored/minimal
    },
}

M.term = {
    float = {
        border = "rounded",
        row = 0.1,
        col = 0.15,
        height = 0.7,
        width = 0.7
        -- border = "none",
        -- row = vim.o.lines,
        -- col = vim.o.columns,
        -- height = vim.o.lines,
        -- width = vim.o.columns,
    }
}

return M
