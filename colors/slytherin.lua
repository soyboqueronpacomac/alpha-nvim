-- ~/.config/nvim/lua/colors/slytherin.lua
local sly = require("colors.slytherin-palette")

vim.cmd("highlight clear")
vim.o.background = "dark"
vim.g.colors_name = "slytherin"

local set = vim.api.nvim_set_hl

-- Basic UI
set(0, "Normal", { fg = sly.fg, bg = sly.black })
set(0, "CursorLine", { bg = sly.cursorline })
set(0, "Visual", { bg = sly.selection })
set(0, "Comment", { fg = sly.comment, italic = true })

-- Syntax
set(0, "Identifier", { fg = sly.fg })
set(0, "Function", { fg = sly.green_bright })
set(0, "Keyword", { fg = sly.green, bold = true })
set(0, "String", { fg = sly.yellow })
set(0, "Number", { fg = sly.cyan })
set(0, "Boolean", { fg = sly.magenta })
set(0, "Constant", { fg = sly.blue })
set(0, "Type", { fg = sly.green })

-- Diagnostics
set(0, "DiagnosticError", { fg = sly.red })
set(0, "DiagnosticWarn", { fg = sly.yellow })
set(0, "DiagnosticInfo", { fg = sly.blue })
set(0, "DiagnosticHint", { fg = sly.cyan })

-- Snacks
-- Dashboard
set(0, "SnacksDashboardIcon", { fg = sly.green_bright })
set(0, "SnacksDashboardDesc", { fg = sly.fg })
set(0, "SnacksDashboardKey", { fg = sly.magenta })
set(0, "SnacksDashboardFooter", { fg = sly.blue })
set(0, "SnacksDashboardHeader", { fg = sly.green })
set(0, "SnacksDashboardSpecial", { fg = sly.magenta })
set(0, "SnacksDashboardDir", { fg = sly.gray })

-- Notifiers
set(0, "SnacksNotifierDebug", { fg = sly.fg, bg = sly.bg })
set(0, "SnacksNotifierBorderDebug", { fg = sly.comment, bg = sly.bg })
set(0, "SnacksNotifierIconDebug", { fg = sly.comment })
set(0, "SnacksNotifierTitleDebug", { fg = sly.comment })

set(0, "SnacksNotifierError", { fg = sly.fg, bg = sly.bg })
set(0, "SnacksNotifierBorderError", { fg = sly.red, bg = sly.bg })
set(0, "SnacksNotifierIconError", { fg = sly.red })
set(0, "SnacksNotifierTitleError", { fg = sly.red })

set(0, "SnacksNotifierInfo", { fg = sly.fg, bg = sly.bg })
set(0, "SnacksNotifierBorderInfo", { fg = sly.blue, bg = sly.bg })
set(0, "SnacksNotifierIconInfo", { fg = sly.blue })
set(0, "SnacksNotifierTitleInfo", { fg = sly.blue })

set(0, "SnacksNotifierTrace", { fg = sly.fg, bg = sly.bg })
set(0, "SnacksNotifierBorderTrace", { fg = sly.magenta, bg = sly.bg })
set(0, "SnacksNotifierIconTrace", { fg = sly.magenta })
set(0, "SnacksNotifierTitleTrace", { fg = sly.magenta })

set(0, "SnacksNotifierWarn", { fg = sly.fg, bg = sly.bg })
set(0, "SnacksNotifierBorderWarn", { fg = sly.yellow, bg = sly.bg })
set(0, "SnacksNotifierIconWarn", { fg = sly.yellow })
set(0, "SnacksNotifierTitleWarn", { fg = sly.yellow })

-- Profiler
set(0, "SnacksProfilerIconInfo", { bg = sly.selection, fg = sly.blue })
set(0, "SnacksProfilerBadgeInfo", { bg = sly.cursorline, fg = sly.blue })
set(0, "SnacksScratchKey", { link = "SnacksProfilerIconInfo" })
set(0, "SnacksScratchDesc", { link = "SnacksProfilerBadgeInfo" })
set(0, "SnacksProfilerIconTrace", { bg = sly.selection, fg = sly.gray })
set(0, "SnacksProfilerBadgeTrace", { bg = sly.cursorline, fg = sly.gray })

-- Misc
set(0, "SnacksIndent", { fg = sly.gray, nocombine = true })
set(0, "SnacksIndentScope", { fg = sly.blue, nocombine = true })
set(0, "SnacksZenIcon", { fg = sly.magenta })
set(0, "SnacksInputIcon", { fg = sly.blue })
set(0, "SnacksInputBorder", { fg = sly.yellow })
set(0, "SnacksInputTitle", { fg = sly.yellow })

-- Picker
set(0, "SnacksPickerInputBorder", { fg = sly.yellow, bg = sly.bg })
set(0, "SnacksPickerInputTitle", { fg = sly.yellow, bg = sly.bg })
set(0, "SnacksPickerBoxTitle", { fg = sly.yellow, bg = sly.bg })
set(0, "SnacksPickerSelected", { fg = sly.magenta })
set(0, "SnacksPickerToggle", { link = "SnacksProfilerBadgeInfo" })
set(0, "SnacksPickerPickWinCurrent", { fg = sly.fg, bg = sly.magenta, bold = true })
set(0, "SnacksPickerPickWin", { fg = sly.fg, bg = sly.selection, bold = true })

-- Treesitter Highlights
set(0, "@comment", { fg = sly.comment, italic = true })
set(0, "@constant", { fg = sly.blue })
set(0, "@constant.builtin", { fg = sly.magenta })
set(0, "@string", { fg = sly.yellow })
set(0, "@string.escape", { fg = sly.cyan })
set(0, "@number", { fg = sly.cyan })
set(0, "@boolean", { fg = sly.red })
set(0, "@float", { fg = sly.cyan })

set(0, "@function", { fg = sly.green_bright })
set(0, "@function.builtin", { fg = sly.green })
set(0, "@method", { fg = sly.green })
set(0, "@constructor", { fg = sly.blue })

set(0, "@parameter", { fg = sly.fg })
set(0, "@variable", { fg = sly.fg })
set(0, "@variable.builtin", { fg = sly.magenta })

set(0, "@type", { fg = sly.green })
set(0, "@type.builtin", { fg = sly.green_bright })
set(0, "@field", { fg = sly.fg })
set(0, "@property", { fg = sly.fg })

set(0, "@operator", { fg = sly.fg })
set(0, "@punctuation.delimiter", { fg = sly.comment })
set(0, "@punctuation.bracket", { fg = sly.gray })
set(0, "@punctuation.special", { fg = sly.yellow })

set(0, "@keyword", { fg = sly.green, bold = true })
set(0, "@keyword.function", { fg = sly.green_bright, bold = true })
set(0, "@keyword.return", { fg = sly.magenta })

set(0, "@tag", { fg = sly.blue })
set(0, "@tag.attribute", { fg = sly.green })
set(0, "@tag.delimiter", { fg = sly.fg })

set(0, "@namespace", { fg = sly.cyan })
set(0, "@symbol", { fg = sly.cyan })

-- Optional
set(0, "@text.title", { fg = sly.green_bright, bold = true })
set(0, "@text.strong", { bold = true })
set(0, "@text.emphasis", { italic = true })

-- LSP Semantic Tokens
set(0, "@lsp.type.class", { link = "@type" })
set(0, "@lsp.type.decorator", { link = "@function" })
set(0, "@lsp.type.enum", { link = "@type" })
set(0, "@lsp.type.enumMember", { link = "@constant" })
set(0, "@lsp.type.function", { link = "@function" })
set(0, "@lsp.type.interface", { link = "@type" })
set(0, "@lsp.type.keyword", { link = "@keyword" })
set(0, "@lsp.type.macro", { fg = sly.magenta, bold = true })
set(0, "@lsp.type.method", { link = "@method" })
set(0, "@lsp.type.namespace", { link = "@namespace" })
set(0, "@lsp.type.parameter", { link = "@parameter" })
set(0, "@lsp.type.property", { link = "@property" })
set(0, "@lsp.type.struct", { link = "@type" })
set(0, "@lsp.type.type", { link = "@type" })
set(0, "@lsp.type.typeParameter", { fg = sly.blue })
set(0, "@lsp.type.variable", { link = "@variable" })

-- Modifiers (e.g., readonly, static, etc.)
set(0, "@lsp.typemod.variable.readonly", { italic = true })
set(0, "@lsp.typemod.variable.static", { bold = true })
set(0, "@lsp.typemod.variable.defaultLibrary", { fg = sly.magenta, italic = true })
