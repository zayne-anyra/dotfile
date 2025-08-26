-- Credits to https://github.com/loctvl842/monokai-pro.nvim
-- This is a modified version for NvChad's base46

local M = {}

local monokai_palette = {
    dark2 = "#19181a",
    dark1 = "#221f22",
    background = "#2d2a2e",
    text = "#fcfcfa",
    accent1 = "#ff6188",
    accent2 = "#fc9867",
    accent3 = "#ffd866",
    accent4 = "#a9dc76",
    accent5 = "#78dce8",
    accent6 = "#ab9df2",
    dimmed1 = "#c1c0c0",
    dimmed2 = "#939293",
    dimmed3 = "#727072",
    dimmed4 = "#5b595c",
    dimmed5 = "#403e41",
}

M.base_30 = {
    white = monokai_palette.text,
    black = monokai_palette.dark1, -- nvim bg
    darker_black = monokai_palette.dark2,
    black2 = "#292828",            -- darkened variant
    one_bg = "#353535",            -- one background level
    one_bg2 = "#3a3a3a",           -- one background level deeper
    one_bg3 = "#404040",           -- one background level even deeper
    grey = monokai_palette.dimmed3,
    grey_fg = monokai_palette.dimmed2,
    grey_fg2 = monokai_palette.dimmed1,
    light_grey = monokai_palette.dimmed4,
    red = monokai_palette.accent1,
    baby_pink = "#DE8C92",     -- custom tone
    pink = "#ff75a0",          -- custom tone
    line = "#2d2d2d",          -- line background
    green = monokai_palette.accent4,
    vibrant_green = "#73daca", -- custom vibrant tone
    nord_blue = "#80a8fd",     -- custom nordic blue
    blue = monokai_palette.accent5,
    yellow = monokai_palette.accent3,
    sun = "#EBCB8B",         -- sunlight tone
    purple = monokai_palette.accent6,
    dark_purple = "#9d7cd8", -- darkened purple
    teal = monokai_palette.accent5,
    orange = monokai_palette.accent2,
    cyan = monokai_palette.accent5,
    statusline_bg = "#1e1e1e",
    lightbg = "#2a2a2a",
    pmenu_bg = monokai_palette.accent5,
    folder_bg = monokai_palette.accent5,
}

M.base_16 = {
    base00 = monokai_palette.background,
    base01 = monokai_palette.dark2,
    base02 = monokai_palette.dimmed5,
    base03 = monokai_palette.dimmed4,
    base04 = monokai_palette.dimmed2,
    base05 = monokai_palette.dimmed1,
    base06 = monokai_palette.text,
    base07 = monokai_palette.text,
    base08 = monokai_palette.accent1,
    base09 = monokai_palette.accent2,
    base0A = monokai_palette.accent3,
    base0B = monokai_palette.accent4,
    base0C = monokai_palette.accent5,
    base0D = monokai_palette.accent6,
    base0E = monokai_palette.accent6,
    base0F = monokai_palette.accent1,
}

M.polish_hl = {
    defaults = {
        ColorColumn = { bg = M.base_16.base02 },
        Directory = { bg = M.base_30.black, fg = M.base_30.grey },
        Pmenu = { bg = M.base_16.base02, fg = M.base_16.base05 },
        FloatBorder = { bg = M.base_16.base00 },
        FloatTitle = { bg = M.base_30.yellow, fg = M.base_30.black },
        WarningMsg = { fg = M.base_30.orange },
        Title = { fg = M.base_30.yellow, bold = true },
        WinSeparator = { fg = M.base_30.black },
        Whitespace = { fg = M.base_30.light_grey },

        LazyButton = { bg = M.base_16.base02, fg = M.base_16.base05 },
        LazyComment = { fg = M.base_30.yellow },
        LazyH1 = { bg = M.base_30.yellow, fg = M.base_30.black, bold = true },
        LazyH2 = { fg = M.base_30.green, bold = true },
        LazyUrl = { fg = M.base_16.cyan },
        LazyDir = { link = "LazyUrl" },
        LazySpecial = { fg = M.base_16.yellow, bold = true },
        LazyReasonStart = { fg = M.base_16.green },
        LazyReasonCmd = { fg = M.base_16.cyan },
    },
    treesitter = {
        ["@variable"]                          = { fg = M.base_30.white },
        ["@variable.member"]                   = { fg = M.base_30.white },
        ["@variable.builtin"]                  = { fg = M.base_30.grey_fg2, italic = true },
        ["@punctuation.bracket"]               = { fg = M.base_30.red },
        ["@punctuation.delimiter"]             = { fg = M.base_30.grey_fg },
        ["@punctuation.special"]               = { fg = M.base_30.grey_fg },
        ["@function.method.call"]              = { fg = M.base_30.green },
        ["@function.call"]                     = { fg = M.base_30.green },
        ["@constant"]                          = { fg = M.base_30.purple },
        ["@variable.parameter"]                = { fg = M.base_30.blue, italic = true },
        ["@variable.parameter.builtin"]        = { fg = M.base_30.blue, italic = true },

        -- String
        ["@string"]                            = { fg = M.base_30.yellow },
        ["@string.documentation"]              = { fg = M.base_30.grey },
        ["@string.escape"]                     = { fg = M.base_30.purple },
        ["@string.regexp"]                     = { fg = M.base_30.yellow },
        ["@character"]                         = { fg = M.base_30.yellow },
        ["@character.printf"]                  = { fg = M.base_30.yellow },
        ["@character.special"]                 = { fg = M.base_30.yellow },

        -- Tags & Markup
        ["@tag"]                               = { fg = M.base_30.red },
        ["@tag.attribute"]                     = { fg = M.base_30.cyan, italic = true },
        ["@tag.builtin"]                       = { fg = M.base_30.red },
        ["@tag.delimiter"]                     = { fg = M.base_30.grey_fg2 },

        -- Numbers & Operators
        ["@number"]                            = { fg = M.base_30.purple },
        ["@number.float"]                      = { fg = M.base_30.purple },
        ["@operator"]                          = { fg = M.base_30.red }, -- `==`, `*`, `+`, `-`

        ["@markup"]                            = { fg = M.base_30.white },
        ["@markup.emphasis"]                   = { fg = M.base_30.white, italic = true },
        ["@markup.environment"]                = { fg = M.base_30.white },
        ["@markup.environment.name"]           = { fg = M.base_30.white },
        ["@markup.heading"]                    = { fg = M.base_30.green, bold = true },
        ["@markup.italic"]                     = { fg = M.base_30.white, italic = true },
        ["@markup.link"]                       = { fg = M.base_30.blue, underline = true },
        ["@markup.link.label"]                 = { fg = M.base_30.blue, underline = true },
        ["@markup.link.label.symbol"]          = { fg = M.base_30.blue, underline = true },
        ["@markup.link.url"]                   = { fg = M.base_30.blue, underline = true },
        ["@markup.list"]                       = { fg = M.base_30.white },
        ["@markup.list.checked"]               = { fg = M.base_30.white },
        ["@markup.list.markdown"]              = { fg = M.base_30.white },
        ["@markup.list.unchecked"]             = { fg = M.base_30.white },
        ["@markup.math"]                       = { fg = M.base_30.yellow },
        ["@markup.raw"]                        = { fg = M.base_30.yellow },
        ["@markup.raw.markdown_inline"]        = { fg = M.base_30.yellow },
        ["@markup.strikethrough"]              = { fg = M.base_30.white, strikethrough = true },
        ["@markup.strong"]                     = { fg = M.base_30.white, bold = true },
        ["@markup.underline"]                  = { fg = M.base_30.white, underline = true },

        -- Types
        ["@type"]                              = { fg = M.base_30.cyan },
        ["@type.builtin"]                      = { fg = M.base_30.cyan, italic = true },
        ["@type.definition"]                   = { fg = M.base_30.green },
        ["@type.qualifier"]                    = { fg = M.base_30.cyan },
        ["@module"]                            = { fg = M.base_30.cyan },
        ["@module.builtin"]                    = { fg = M.base_30.cyan },
        ["@namespace.builtin"]                 = { fg = M.base_30.cyan },

        -- Labels
        ["@label"]                             = { fg = M.base_30.cyan },

        ["@conceal.markdown"]                  = { bg = M.base_30.black },
        ["@markup.italic.markdown_inline"]     = { italic = true },
        ["@markup.link.label.markdown_inline"] = { fg = M.base_30.red },
        ["@markup.link.url.markdown_inline"]   = { fg = M.base_30.green, underline = true },
        ["@markup.raw.block.markdown"]         = { bg = M.base_30.black },
        ["@markup.raw.delimiter.markdown"]     = { bg = M.base_30.black, fg = M.base_30.dimmed2 },
        ["@markup.strong.markdown_inline"]     = { bold = true },
        ["@none.markdown"]                     = { bg = M.base_30.black },
        ["@punctuation.special.markdown"]      = { fg = M.base_30.dimmed2 },
        ["@text.emphasis.markdown_inline"]     = { fg = M.base_30.white, italic = true },
        ["@text.literal.block.markdown"]       = { bg = M.base_16.base00 },
        ["@text.literal.markdown_inline"]      = { bg = M.base_30.dimmed4, fg = M.base_30.white },
        ["@text.quote.markdown"]               = { bg = M.base_30.dimmed5, fg = M.base_30.white },
        ["@text.reference.markdown_inline"]    = { fg = M.base_30.red },
        ["@text.strong.markdown_inline"]       = { bold = true },
        ["@text.uri.markdown_inline"]          = { fg = M.base_30.green, sp = M.base_30.green, underline = true },
    },
}

M.type = "dark"

M = require("base46").override_theme(M, "monokai_pro")

return M
