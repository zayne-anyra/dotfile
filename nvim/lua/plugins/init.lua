return {
    { "folke/which-key.nvim", enabled = false },
    {
        "stevearc/conform.nvim",
        -- event = 'BufWritePre', -- uncomment for format on save
        opts = require "configs.conform",
    },

    -- These are some examples, uncomment them if you want to see them work!
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },

    -- {
    -- 	"nvim-treesitter/nvim-treesitter",
    -- 	opts = {
    -- 		ensure_installed = {
    -- 			"vim", "lua", "vimdoc",
    --      "html", "css"
    -- 		},
    -- 	},
    -- },

    {
        "VonHeikemen/searchbox.nvim",
        event = "BufWinEnter",
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
    },

    {
        "tpope/vim-surround",
        event = { "BufReadPost", "BufNewFile" },
    },
    {
        "nvimdev/lspsaga.nvim",
        event = "LspAttach",
        config = function()
            require "configs.lspsaga"
        end,
        dependencies = {
            'nvim-treesitter/nvim-treesitter', -- optional
            'nvim-tree/nvim-web-devicons',     -- optional
        }
    },
    {
        "mrcjkb/rustaceanvim",
        version = "^5",
        ft = { "rust" },
        -- name = "rustaceanvim",
        -- lazy = false,
        -- dependencies = "neovim/nvim-lspconfig",
        config = function()
            require("configs.rust-dev")
        end
    },
    {
        "mg979/vim-visual-multi",
        init = function()
            vim.g.VM_default_mappings = 0
            vim.g.VM_set_statusline = 0
            vim.g.VM_mouse_mappings = 1
            vim.g.VM_leader = "\\"
            vim.g.VM_maps = {
                ["Undo"] = "u",
                ["Align"] = "\\a",
                ["Surround"] = "S",
                ["Redo"] = "<C-r>",
                ["Find Next"] = "]",
                ["Find Prev"] = "[",
                ["Skip Region"] = "q",
                ["Transpose"] = "\\t",
                ["Duplicate"] = "\\d",
                ["Select All"] = "\\A",
                ["Align Char"] = "\\<",
                ["Seek Next"] = "<C-f>",
                ["Seek Prev"] = "<C-b>",
                ["Remove Region"] = "Q",
                ["Visual Regex"] = "\\/",
                ["Find Under"] = "<M-d>", -- select word under cursor & enter visual-multi (normal) / add next occurrence (visual-multi)
                ["Visual Add"] = "<M-d>", -- enter visual-multi (visual)
                ["Toggle Block"] = "\\<BS>",
                ["Toggle Multiline"] = "\\M",
                ["Add Cursor At Pos"] = "\\\\",
                ["Case Conversion Menu"] = "\\C",
                ["Select Cursor Up"] = "<M-C-k>",
                ["Select Cursor Down"] = "<M-C-j>",
                ["Mouse Cursor"] = "<C-LeftMouse>",
                ["Mouse Word"] = "<C-RightMouse>",
                ["Mouse Column"] = "<M-C-RightMouse>",
            }
        end,
        lazy = false,
    },
}
