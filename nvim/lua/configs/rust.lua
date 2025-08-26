local M = require "nvchad.configs.lspconfig"

vim.g.rustaceanvim = {
    tools = {
        autoSetHints = true,
        -- hover_with_actions = true,
        inlay_hints = {
            auto = true,
            only_current_line = false,
            show_parameter_hints = true,
            parameter_hints_prefix = "➔  ",
            other_hints_prefix = "➔  ",
        },
    },
    server = {
        settings = {
            ["rust-analyzer"] = {
                -- enable clippy on save
                inlayHints = { locationLinks = false },
                checkOnSave = { command = "clippy" },
                diagnostics = {
                    disabled = { "inactive-code" },
                },
            },
        },
        on_attach = function(_, bufnr)
            vim.keymap.set("n", "K", function()
                    vim.cmd.RustLsp({ "hover", "range" })
                end,
                { silent = true, buffer = bufnr }
            )
            vim.keymap.set("n", "<leader>ca", function()
                    vim.cmd.RustLsp("codeAction")
                end,
                { silent = true, buffer = bufnr }
            )
            vim.keymap.set("n", "<leader>jl", function()
                    vim.cmd.RustLsp("joinLines")
                end,
                { silent = true, buffer = bufnr }
            )
            vim.keymap.set("n", "<leader>rc", function()
                    vim.cmd.RustLsp("openCargo")
                end,
                { silent = true, buffer = bufnr }
            )
        end
    }
}
