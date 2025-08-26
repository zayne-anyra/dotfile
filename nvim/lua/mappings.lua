local autocmd = vim.api.nvim_create_autocmd
local colors = require("base46").get_theme_tb "base_30"
require "nvchad.mappings"

-- vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", {
--     sp = colors.yellow,
--     italic = false,
--     undercurl = true,
-- })
--
-- vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", {
--     sp = colors.purple,
--     italic = false,
--     undercurl = true,
-- })
--
-- vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", {
--     sp = colors.red,
--     italic = false,
--     undercurl = true,
-- })

-- Highlight yanked text
autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank { higroup = "Visual", on_visual = false, timeout = 150 }
    end,
})

-- add yours here
local map = vim.keymap.set

map({ "x", "v" }, "<leader>p", [["_dP]])

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "H", "^")
map("n", "L", "$")
map("n", "<M-k>", "<cmd>resize +2<CR>")
map("n", "<M-j>", "<cmd>resize -2<CR>")
map("n", "<M-h>", "<cmd>vertical resize +2<CR>")
map("n", "<M-l>", "<cmd>vertical resize -2<CR>")

map("v", "K", ":m '<-2<CR>gv=gv")
map("v", "J", ":m '>+1<CR>gv=gv")

map("n", "<A-=>", '<cmd>lua require("nvchad.tabufline").move_buf(1)<CR>', { desc = "" })
map("n", "<A-->", '<cmd>lua require("nvchad.tabufline").move_buf(-1)<CR>', { desc = "" })

map("n", "gr", "<cmd>Telescope lsp_references<CR>")
map("n", "<leader>fd", "<cmd>Telescope diagnostics<CR>")
map("n", "<leader>ft", "<cmd>Telescope terms<CR>", { desc = "Telescope pick hidden terminal" })

map("n", "<leader>s", ":SearchBoxIncSearch<CR>", { desc = "Search Words" })
map("x", "<leader>s", ":SearchBoxIncSearch visual_mode=true<CR>", { desc = "Search Words" })
-- map("n", "<leader>rr", '<cmd>lua require("searchbox").replace({confirm = "menu"})<CR>')
-- map("x", "<leader>rr", '<cmd>lua require("searchbox").replace({confirm = "menu", visual_mode = true})<CR>')
map("n", "<leader>rr", function()
    require("searchbox").replace({ confirm = "menu" })
end)
map("x", "<leader>rr", function()
    require("searchbox").replace({ confirm = "menu", visual_mode = true })
end)

-- Lspsaga Mappings
map("n", "K", "<cmd>Lspsaga hover_doc<CR>")
map("n", "<leader>rn", "<cmd>Lspsaga rename<CR>")
map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>")
map("n", "[d", "<cmd>Lspsaga diagnostic_jump_next<CR>")
map("n", "]d", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
map("n", "<leader>pd", "<cmd>Lspsaga peek_definition<CR>")
map("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")
map("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")
map("n", "<leader>sw", "<cmd>Lspsaga show_workspace_diagnostics<CR>")
map("n", "[E", function()
    require("lspsaga.diagnostic"):goto_prev { severity = vim.diagnostic.severity.ERROR }
end)
map("n", "]E", function()
    require("lspsaga.diagnostic"):goto_next { severity = vim.diagnostic.severity.ERROR }
end)

-- Function to open a terminal in a new buffer and set it to not be buflisted
-- local function open_terminal()
--     -- Open a terminal in a new buffer
--     vim.cmd('term')
--     -- Set the current buffer to not be listed
--     vim.bo.buflisted = false
--     vim.cmd('term')        -- Opens terminal in the new window
--     vim.cmd('startinsert') -- Automatically enter insert mode
-- end

-- Keybinding to open the terminal
-- Replace <leader>t with your preferred keybinding
-- map('n', '<leader>tt', function()
--     vim.cmd('term') -- Opens terminal in the new window
--     if not vim.g.nvchad_terms then
--         vim.g.nvchad_terms = {}
--     end
--     local term_id = "buff_term_" .. os.time()
--     local buf = vim.api.nvim_create_buf(true, false)
--
--     vim.g.nvchad_terms[tostring(buf)] = {
--         id = term_id,
--         buf = buf,
--     }
--     -- Use NvChad's terminal module instead of direct terminal creation
--     vim.opt_local.number = false
--     vim.opt_local.relativenumber = false
--     vim.opt_local.signcolumn = "no"
--     -- vim.opt_local.bufhidden = "hide" -- Hide the buffer instead of deleting when closed
--     vim.opt_local.buflisted = false
--     vim.cmd('startinsert') -- Automatically enter insert mode
-- end, { noremap = true, silent = true })

-- map("n", "<leader>ta", function()
--   require("nvchad.term").open_terminal_in_new_buffer()
-- end, { desc = "terminal new vertical term" })
--
-- map('n', '<leader>tt', function()
--     local buf = vim.api.nvim_create_buf(false, true) -- Create a new buffer
--     local shell = vim.o.shell
--     local cmd = shell
--     vim.api.nvim_set_current_buf(buf) -- Set the new buffer as the current buffer
--     vim.opt_local.number = false
--     vim.opt_local.relativenumber = false
--     vim.opt_local.signcolumn = "no"
--     -- vim.opt_local.bufhidden = "hide" -- Hide the buffer instead of deleting when closed
--     vim.opt_local.buflisted = false
--     vim.fn.termopen(cmd, { detach = false }) -- Open a terminal in the new buffer
--     vim.cmd("startinsert")                         -- Start insert mode    vim.cmd.tabnew()
--     -- vim.cmd.wincmd "J"
--     -- vim.api.nvim_win_set_height(0, 12)
--     -- vim.wo.winfixheight = true
--     -- vim.opt_local.number = false
--     -- vim.opt_local.relativenumber = false
--     -- vim.opt_local.signcolumn = "no"
--     -- -- vim.opt_local.bufhidden = "hide" -- Hide the buffer instead of deleting when closed
--     -- vim.opt_local.buflisted = false
--     -- vim.cmd.term()
--     -- vim.cmd.startinsert() -- Automatically enter insert mode
-- end, { noremap = true, silent = true })
