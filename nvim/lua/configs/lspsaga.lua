require("lspsaga").setup {
    ui = { border = "rounded" },
    symbol_in_winbar = { enable = false },
    hover = { open_link = "gl" },
    lightbulb = {
        enable = false,
        sign = true,
        enable_in_insert = false,
        sign_priority = 20,
        virtual_text = true,
    },
}
