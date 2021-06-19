require("opts")

require("mappings")

require("paq")

--require 'plugins.tokyonight'
require("plugins.tree-sitter")
require("plugins.lspconfig")
require("plugins.CamelCaseMotion")
require("plugins.compe")
require("plugins.telescope")
require("plugins.go")
require("plugins.rust")
require("plugins.gitsigns")
require("plugins.formatter")
require("plugins.galaxyline")

require("plugins.nvim-tree")
require("plugins.bufferline")

local base16 = require("base16")
base16(base16.themes["onedark"], true)

require("presence"):setup(
  {
    editing_text = "Coding %s"
  }
)

require("colorizer").setup()
require("nvim-autopairs").setup()
require("lspkind").init()
--  {
--    preset = "codicons"
--  }
--)

--vim.api.nvim_command("colorscheme jellybeans-nvim")

local g = vim.g

g.indentLine_enabled = 1
g.indent_blankline_char = "▏"

g.indent_blankline_filetype_exclude = {"help", "terminal", "dashboard"}
g.indent_blankline_buftype_exclude = {"terminal"}

g.indent_blankline_show_trailing_blankline_indent = false
g.indent_blankline_show_first_indent_level = false

local colors = require("themes/onedark")

require("nvim-web-devicons").setup {
  override = {
    html = {
      icon = "",
      color = colors.baby_pink,
      name = "html"
    },
    css = {
      icon = "",
      color = colors.blue,
      name = "css"
    },
    js = {
      icon = "",
      color = colors.sun,
      name = "js"
    },
    ts = {
      icon = "ﯤ",
      color = colors.teal,
      name = "ts"
    },
    kt = {
      icon = "󱈙",
      color = colors.orange,
      name = "kt"
    },
    png = {
      icon = "",
      color = colors.dark_purple,
      name = "png"
    },
    jpg = {
      icon = "",
      color = colors.dark_purple,
      name = "jpg"
    },
    jpeg = {
      icon = "",
      color = "colors.dark_purple",
      name = "jpeg"
    },
    mp3 = {
      icon = "",
      color = colors.white,
      name = "mp3"
    },
    mp4 = {
      icon = "",
      color = colors.white,
      name = "mp4"
    },
    out = {
      icon = "",
      color = colors.white,
      name = "out"
    },
    Dockerfile = {
      icon = "",
      color = colors.cyan,
      name = "Dockerfile"
    },
    rb = {
      icon = "",
      color = colors.pink,
      name = "rb"
    },
    vue = {
      icon = "﵂",
      color = colors.vibrant_green,
      name = "vue"
    },
    py = {
      icon = "",
      color = colors.cyan,
      name = "py"
    },
    toml = {
      icon = "",
      color = colors.blue,
      name = "toml"
    },
    lock = {
      icon = "",
      color = colors.red,
      name = "lock"
    },
    zip = {
      icon = "",
      color = colors.sun,
      name = "zip"
    },
    xz = {
      icon = "",
      color = colors.sun,
      name = "xz"
    },
    deb = {
      icon = "",
      color = colors.cyan,
      name = "deb"
    },
    rpm = {
      icon = "",
      color = colors.orange,
      name = "rpm"
    }
  }
}

-- highlights

local cmd = vim.cmd

-- add this again once we move this back to its own file
--local colors = require "themes/onedark"

local white = colors.white
local darker_black = colors.darker_black
local black = colors.black
local black2 = colors.black2
local one_bg = colors.one_bg
local one_bg2 = colors.one_bg2
local one_bg3 = colors.one_bg3
local light_grey = colors.light_grey
local grey = colors.grey
local grey_fg = colors.grey_fg
local red = colors.red
local line = colors.line
local green = colors.green
local nord_blue = colors.nord_blue
local blue = colors.blue
local yellow = colors.yellow
local purple = colors.purple

-- for guifg , bg

local function fg(group, color)
  cmd("hi " .. group .. " guifg=" .. color)
end

local function bg(group, color)
  cmd("hi " .. group .. " guibg=" .. color)
end

local function fg_bg(group, fgcol, bgcol)
  cmd("hi " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol)
end

-- blankline

fg("IndentBlanklineChar", line)

-- misc --
fg("LineNr", grey)
fg("Comment", grey)
fg("NvimInternalError", red)
fg("VertSplit", line)
fg("EndOfBuffer", black)

-- Pmenu
bg("Pmenu", one_bg)
bg("PmenuSbar", one_bg2)
bg("PmenuSel", green)
bg("PmenuThumb", nord_blue)

-- inactive statuslines as thin splitlines
cmd("hi! StatusLineNC gui=underline guifg=" .. line)

-- line n.o
cmd "hi clear CursorLine"
fg("cursorlinenr", white)

-- git signs ---
fg_bg("DiffAdd", green, "none")
fg_bg("DiffChange", green, "none")
fg_bg("DiffModified", green, "none")

-- NvimTree
fg("NvimTreeFolderIcon", blue)
fg("NvimTreeFolderName", blue)
fg("NvimTreeIndentMarker", one_bg2)
fg("NvimTreeVertSplit", darker_black)
bg("NvimTreeVertSplit", darker_black)

fg("NvimTreeRootFolder", darker_black)
bg("NvimTreeNormal", darker_black)
fg_bg("NvimTreeStatuslineNc", darker_black, darker_black)

-- telescope
fg("TelescopeBorder", line)
fg("TelescopePromptBorder", line)
fg("TelescopeResultsBorder", line)
fg("TelescopePreviewBorder", grey)

-- LspDiagnostics ---

-- error / warnings
fg("LspDiagnosticsSignError", red)
fg("LspDiagnosticsVirtualTextError", red)
fg("LspDiagnosticsSignWarning", yellow)
fg("LspDiagnosticsVirtualTextWarning", yellow)

-- info
fg("LspDiagnosticsSignInformation", green)
fg("LspDiagnosticsVirtualTextInformation", green)

-- hint
fg("LspDiagnosticsSignHint", purple)
fg("LspDiagnosticsVirtualTextHint", purple)

-- bufferline

fg_bg("BufferLineFill", grey_fg, black2)
fg_bg("BufferLineBackground", light_grey, black2)

fg_bg("BufferLineBufferVisible", light_grey, black2)
fg_bg("BufferLineBufferSelected", white, black)

cmd "hi BufferLineBufferSelected gui=bold"

-- tabs
fg_bg("BufferLineTab", light_grey, one_bg3)
fg_bg("BufferLineTabSelected", black2, nord_blue)
fg_bg("BufferLineTabClose", red, black)

fg_bg("BufferLineIndicator", black2, black2)
fg_bg("BufferLineIndicatorSelected", black, black)

-- separators
fg_bg("BufferLineSeparator", line, black2)
fg_bg("BufferLineSeparatorVisible", line, black2)
fg_bg("BufferLineSeparatorSelected", black, black2)

-- modified buffers
fg_bg("BufferLineModified", red, black2)
fg_bg("BufferLineModifiedVisible", red, black2)
fg_bg("BufferLineModifiedSelected", green, black)

-- close buttons
fg_bg("BufferLineCLoseButtonVisible", light_grey, black2)
fg_bg("BufferLineCLoseButton", light_grey, black2)
fg_bg("BufferLineCLoseButtonSelected", red, black)

-- dashboard

fg("DashboardHeader", grey_fg)
fg("DashboardCenter", grey_fg)
fg("DashboardShortcut", grey_fg)
fg("DashboardFooter", black)

--
vim.api.nvim_set_keymap("n", "<Leader>rr", [[<Cmd> luafile %<CR>]], {noremap = true, silent = true})
local g = vim.g

vim.api.nvim_set_keymap("n", "<Leader>fn", [[<Cmd> DashboardNewFile<CR>]], {noremap = true, silent = true})
g.dashboard_default_executive = "telescope"
g.dashboard_custom_header = {
  "⠐⠋⠘⠃⠚⠁⠛⠐⠓⠘⠃⠙⠂⠛⠘⠃⠘⠃⠛⠀⠛⠀⠃⠘⠃⠘⠀⠛⠀⠛⠘⠃⠘⠃⠛⠐⠋⠘⠃⠚⠁⠛⠐⠋⠘⠃⠚⠂⠛⠘⠃⠘⠃⠛⠐⠛⠘⠃⠚⠁⠛⠀⠋⠘⠃⠘⠁⠛⠀⠛⠘⠃⠘⠃⠛⠀⠛⠐⠃⠘",
  "⠈⠋⠘⠃⠙⠁⠛⠈⠓⠘⠃⠙⠂⠛⠈⠃⠘⠃⠙⠀⠛⠀⠃⠘⠃⠘⠀⠛⠀⠛⠘⠃⠘⠃⠛⠀⠋⠘⠃⠘⠁⠛⠈⠋⠘⠃⠙⠂⠛⠈⠋⠘⠃⠛⠈⠋⠘⠃⠘⠁⠛⠀⠋⠘⠃⠘⠁⠛⠀⠛⠘⠃⠘⠃⠛⠀⠛⠀⠃⠘",
  "⠈⣉⢈⡁⢉⡁⣉⢈⡁⢈⡁⣉⠀⣉⢈⡉⢈⡁⣉⠁⡉⠀⠁⠈⠀⠀⠀⢀⠀⣉⢈⡁⢈⡁⣉⠈⣉⢈⡁⢉⡁⣉⢈⡉⢈⡁⣉⠁⣉⢈⢉⠀⠀⠈⠈⣉⢈⡁⢉⡁⣉⠀⣉⢈⡁⢈⡁⣉⠀⣉⢈⡁⢈⡁⣉⠀⣉⠈⡁⢈",
  "⢈⣁⢈⡁⣉⡀⣉⢀⡉⢈⡁⣈⠁⣉⢈⡁⠈⠁⠀⠀⣀⠀⡀⢀⡁⢈⠀⣉⠀⣉⢈⡁⢈⡁⣉⠈⣁⢈⡁⣈⡀⣉⢀⣉⢈⡁⣈⠁⣉⢈⡁⢀⡀⠀⠀⠀⠈⠁⠈⡁⣉⠀⣁⢈⡁⢈⡀⣉⠀⣉⢈⡁⢈⡁⣉⠀⣉⠈⡁⢈",
  "⢀⣁⢈⡁⣈⡀⣉⢀⣉⢈⡁⣈⡀⠉⠀⡀⢀⡁⣉⠀⣉⠀⡁⢈⡁⢈⠀⣉⠀⣉⢈⡁⢈⡁⣉⠀⣅⢈⡁⣈⡀⣉⢀⣁⢈⡁⣈⡀⣉⢀⣁⢈⡁⣁⡀⣀⢀⠀⠀⠀⠈⠀⢁⢈⡁⢈⡀⣉⠀⣉⢈⡁⢈⡁⣉⠀⣉⢀⡁⢈",
  "⠀⣅⢀⡅⢨⡀⣡⠀⡅⢈⡄⠈⡀⣠⢀⡅⢨⡁⣨⠀⣍⠀⡅⢨⡁⢨⠀⣍⠀⣅⢨⡁⢨⡀⣍⠀⣅⢀⡅⢨⡀⣡⠀⣅⢈⡄⢨⠀⣁⢀⡅⢨⡀⣨⠀⣅⢈⡅⢠⡀⣄⠀⠀⠈⠁⢨⠀⣩⠀⣍⢨⡁⢨⡁⣍⠀⣍⠀⡅⢨",
  "⠠⡤⢠⡄⢤⠄⣤⠠⡤⢠⡀⢤⠄⣤⠠⡄⢠⡄⢤⠀⣤⠀⡄⢠⡄⢠⠀⣤⠀⡤⢠⡄⢠⡄⢤⠠⡤⢠⡄⢤⠄⣤⠠⡤⢠⡄⢤⠄⣤⠠⡄⢠⡄⢤⠠⡤⢠⡄⢤⠄⣤⠀⣄⠀⠀⠀⠀⠤⠀⣤⢠⡄⢠⡄⣤⠀⣤⠠⡄⢠",
  "⠠⡤⠠⡄⢤⠄⡤⠠⡆⢠⠄⢴⠀⣴⠠⠆⠀⠂⠀⠀⠀⠀⡄⢀⡀⠀⠀⠐⠀⠀⠀⠀⠀⠀⢀⠀⡦⠠⡄⢤⠄⢤⠠⡆⢠⠄⢤⠄⡤⠠⡆⢠⠄⢴⠠⠤⠠⡆⢠⠄⢤⠀⡤⢠⡄⢠⠀⣀⠀⢴⢠⠆⢠⡄⣴⠀⡤⠠⡄⢰",
  "⠀⠦⠠⠆⠰⠄⠴⠀⡆⠰⠄⢴⠀⠆⠀⠀⠀⠀⠀⠀⠄⠀⠀⢰⠄⠐⠀⠄⠀⠀⠠⠀⠠⠀⡶⠀⡦⠠⠆⢰⠄⠴⠀⡦⠠⠆⠰⠀⠴⠀⠆⠐⠀⠐⠀⠂⠰⠆⠰⠄⢴⠀⠦⠠⡆⢰⠀⢶⠀⠐⠰⠆⢰⠄⢶⠀⠶⠀⡆⢰",
  "⠀⠦⠐⠆⠰⠄⠖⠠⠆⠰⠂⠴⠀⠀⠀⠀⠀⠆⠀⠀⠀⠀⠆⠰⠆⠰⠀⠄⠀⠠⠀⠄⠰⠂⠶⠀⠦⠐⠆⠰⠄⠖⠀⠆⠐⠂⠀⠀⠴⠀⠀⠀⠀⠀⠀⠀⠐⠂⠀⠀⠒⠀⠦⠰⠆⠰⠀⠶⠀⠶⠀⠂⠰⠆⠶⠀⠶⠀⠆⠰",
  "⠐⠖⠐⠆⠲⠂⠲⠐⠖⠰⠂⠂⠀⠠⠀⠂⠈⠂⠐⠀⠐⠀⠁⠰⠃⠸⠀⠷⠀⠖⠸⠆⠸⠂⠗⠀⠗⠐⠆⠸⠂⠲⠐⠗⠠⠀⠀⠀⠀⠀⠄⠰⠀⠀⠀⠀⠠⠀⠀⠀⠀⠀⠀⠀⠃⠰⠂⠺⠀⠞⠰⠇⠸⠂⠾⠀⠖⠐⠇⠸",
  "⠀⠓⠐⠃⠘⠂⠓⠀⠇⠘⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠆⠘⠀⠛⠀⠓⠘⠃⠘⠂⠛⠀⠗⠐⠃⠘⠂⠚⠀⠇⠐⠂⠠⠀⠂⠐⠃⠘⠀⠀⠀⠘⠀⠀⠰⠁⠓⠀⠀⠀⠀⠀⠂⠛⠀⠛⠘⠃⠘⠃⠛⠀⠛⠀⠇⠘",
  "⠀⠓⠈⠃⢘⠂⢋⠀⡃⠐⠂⢘⠀⢛⠈⡃⠐⡃⢑⠀⡛⠀⡃⢘⠃⢘⠀⡛⠀⡋⢘⠃⢘⠁⡛⠀⡓⠈⠃⢘⠂⠙⠀⡃⠘⠁⢚⠀⠂⠀⡀⠀⠀⠀⠀⠂⠀⠁⠈⠀⠉⠀⠁⠀⠂⠀⠀⠉⠀⠙⠘⡃⢘⠃⢛⠀⡛⠀⡃⢘",
  "⠀⡋⠈⡃⢘⠁⣉⠀⡃⢘⠁⢙⠀⣋⠈⡃⢘⡃⢙⠀⣋⠀⡃⢘⡁⢘⠀⣋⠀⡋⢘⡁⢘⠁⣋⠀⡋⠈⡃⢘⠀⡙⠈⡃⢈⠃⢙⠀⡋⠈⡁⢐⠀⣀⠀⠐⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣋⢘⡁⢘⡁⣋⠀⣋⠀⡃⢘",
  "⠀⣉⢈⡁⢘⠀⣉⠀⡃⢈⡁⢉⠀⣉⢈⡁⢈⡁⣉⠀⣩⠀⡁⢈⡁⢨⠀⣉⠀⣍⢈⡁⢨⡁⣉⠀⡍⢈⡁⢈⡁⣉⠀⡃⢈⡁⢘⠀⣉⢈⡁⢈⡁⣘⠀⣉⢈⡁⢈⡁⣘⠀⡂⢀⡁⢀⠀⠁⠀⠀⢈⠁⢈⡁⣉⠀⣉⢀⡁⢨",
  "⠀⣁⢀⡁⣨⠀⣡⢀⡅⢈⡄⣩⠀⣩⢀⡅⢈⡅⣨⠀⣍⠀⡅⢨⡁⢨⠀⣍⠀⣅⢨⡁⢨⡀⣍⠀⣍⢀⡁⢨⡀⣈⢀⡅⢈⡄⢨⠀⣁⢀⡅⢈⡀⣨⠀⣁⢀⡅⢨⡀⣨⠀⡍⢈⡅⢠⠀⣬⠀⡄⠀⡀⢨⡁⣩⠀⣍⠀⡅⢨",
  "⠀⣅⢀⡅⣨⡀⣤⢀⡅⢠⡄⣨⡀⣬⢀⡅⢨⡄⣨⠀⣥⠀⡅⢨⡄⢨⠀⣥⠀⣅⢨⡄⢨⡀⣥⠀⣅⢠⡁⣨⡀⣌⢀⣅⢠⡄⣨⠀⣌⢀⣄⢨⡀⣨⠀⣅⢀⡅⢠⡀⣬⠀⣅⢠⡅⢨⡀⣬⠀⣥⢀⠀⢨⡄⣥⠀⣥⠀⡅⢨",
  "⢀⣤⢠⡄⣠⡀⣤⢀⡤⢠⡄⣠⡀⣤⢠⡄⢠⡄⣤⠀⣤⠀⡄⢠⡄⢠⠀⣤⠀⣤⢠⡄⢠⡄⣤⢀⣤⢠⡄⣠⡀⣤⢀⣄⢠⡄⣠⡀⣤⢠⡄⢠⡄⣤⢀⣤⢠⡄⣠⠄⣤⠀⡤⢠⡄⢠⡀⣤⠀⣤⢠⠀⢠⡄⣤⠀⣤⢀⡄⢠",
  "⠀⡦⠠⠆⢰⠄⢤⠠⡆⠠⡄⢴⠀⢴⠠⡆⢰⠄⢴⠀⡦⠀⡆⢰⠄⢰⠀⡦⠀⡦⢰⠄⢰⠄⡦⠀⡦⠠⠆⢰⠄⢤⠠⡆⠠⠄⢴⠀⠤⠠⡆⠰⠄⢴⠀⡤⠠⡆⠰⠄⢴⠀⠦⠠⡆⢰⠀⢴⠀⡦⠰⡄⢰⠄⢦⠀⡦⠀⡆⢰",
  "⠀⠦⠰⠆⠴⠄⠦⠠⠦⠰⠄⠴⠄⠶⠠⠆⠰⠆⠴⠀⠶⠀⠆⠰⠆⠰⠀⠶⠀⠦⠰⠆⠰⠄⠶⠀⠦⠰⠆⠰⠄⠦⠠⠦⠰⠆⠴⠄⠶⠠⠆⠰⠆⠴⠀⠦⠠⠆⠴⠄⠶⠀⠦⠰⠆⠰⠄⠶⠀⠶⠰⠆⠰⠆⠶⠀⠶⠀⠆⠰",
  "⠠⠶⠰⠆⠴⠄⠶⠠⠦⠰⠆⠲⠄⠶⠰⠆⠰⠆⠶⠀⠶⠀⠆⠰⠆⠰⠀⠶⠀⠶⠰⠆⠰⠆⠶⠐⠶⠰⠆⠴⠂⠶⠠⠦⠰⠆⠴⠄⠶⠐⠦⠰⠆⠶⠠⠶⠰⠆⠰⠆⠶⠀⠖⠰⠆⠰⠄⠶⠀⠶⠰⠀⠰⠆⠶⠀⠶⠠⠆⠰",
  "⠠⠖⠰⠆⠲⠂⠶⠐⠦⠰⠆⠲⠄⠶⠐⠆⠰⠆⠶⠀⠶⠀⠆⠰⠆⠰⠀⠶⠀⠶⠰⠆⠰⠆⠶⠀⠶⠰⠆⠴⠂⠶⠐⠖⠰⠆⠲⠄⠶⠐⠦⠰⠆⠶⠠⠖⠰⠆⠰⠂⠶⠀⠖⠰⠆⠰⠂⠶⠀⠶⠰⠀⠰⠆⠶⠀⠶⠀⠆⠰",
  "⠀⠓⠘⠃⠚⠂⠓⠐⠓⠘⠂⠙⠂⠛⠐⠃⠘⠃⠚⠀⠛⠀⠃⠘⠃⠘⠀⠛⠀⠓⠘⠃⠘⠂⠛⠀⠓⠘⠃⠘⠂⠛⠐⠓⠘⠃⠚⠂⠓⠘⠃⠘⠂⠛⠀⠓⠘⠃⠘⠂⠛⠀⠓⠘⠃⠘⠂⠛⠀⠛⠈⠀⠘⠃⠛⠀⠛⠐⠃⠘",
  "⠐⠛⠘⠃⠚⠁⠛⠐⠓⠘⠃⠙⠂⠛⠘⠃⠘⠃⠛⠀⠛⠀⠃⠘⠃⠘⠀⠛⠀⠛⠘⠃⠘⠃⠛⠈⠛⠘⠃⠚⠁⠛⠐⠋⠘⠃⠚⠂⠛⠘⠃⠘⠃⠛⠐⠛⠘⠃⠘⠃⠛⠀⠋⠘⠃⠘⠁⠛⠀⠛⠀⠂⠘⠃⠛⠀⠛⠐⠃⠘",
  "⠈⠋⠘⠃⠙⠁⠛⠈⠃⠘⠃⠙⠂⠛⠈⠃⠘⠃⠛⠀⠛⠀⠃⠘⠃⠘⠀⠛⠀⠛⠘⠃⠘⠃⠛⠀⠋⠘⠃⠘⠁⠛⠈⠋⠘⠃⠙⠂⠛⠈⠋⠘⠃⠛⠈⠋⠘⠃⠘⠁⠛⠀⠋⠘⠃⠘⠁⠛⠀⠋⠐⠃⠘⠃⠛⠀⠛⠀⠃⠘",
  "⠈⡋⠘⠃⢙⠁⢋⠈⡋⠘⡁⢙⠁⢛⠈⡋⠘⡃⢙⠀⡛⠀⡃⢘⠃⢘⠀⡛⠀⡋⢘⠃⢘⠁⡛⠈⡋⠘⠃⢙⠁⢋⠈⡋⠘⠁⢙⠁⠋⠈⡋⠘⠁⢙⠈⠋⠈⡃⢙⠁⢛⠀⡋⠘⡃⢘⠁⢛⠀⡃⠘⡃⢘⠃⢛⠀⡛⠈⡃⢘"
}

--g.dashboard_custom_header = {
--  "⠄⠄⠄⢰⣧⣼⣯⠄⣸⣠⣶⣶⣦⣾⠄⠄⠄⠄⡀⠄⢀⣿⣿⠄⠄⠄⢸⡇⠄⠄",
--  "⠄⠄⠄⣾⣿⠿⠿⠶⠿⢿⣿⣿⣿⣿⣦⣤⣄⢀⡅⢠⣾⣛⡉⠄⠄⠄⠸⢀⣿⠄",
--  "⠄⠄⢀⡋⣡⣴⣶⣶⡀⠄⠄⠙⢿⣿⣿⣿⣿⣿⣴⣿⣿⣿⢃⣤⣄⣀⣥⣿⣿⠄",
--  "⠄⠄⢸⣇⠻⣿⣿⣿⣧⣀⢀⣠⡌⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⣿⣿⣿⠄",
--  "⠄⢀⢸⣿⣷⣤⣤⣤⣬⣙⣛⢿⣿⣿⣿⣿⣿⣿⡿⣿⣿⡍⠄⠄⢀⣤⣄⠉⠋⣰",
--  "⠄⣼⣖⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⢇⣿⣿⡷⠶⠶⢿⣿⣿⠇⢀⣤",
--  "⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣽⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣷⣶⣥⣴⣿⡗",
--  "⢀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠄",
--  "⢸⣿⣦⣌⣛⣻⣿⣿⣧⠙⠛⠛⡭⠅⠒⠦⠭⣭⡻⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃⠄",
--  "⠘⣿⣿⣿⣿⣿⣿⣿⣿⡆⠄⠄⠄⠄⠄⠄⠄⠄⠹⠈⢋⣽⣿⣿⣿⣿⣵⣾⠃⠄",
--  "⠄⠘⣿⣿⣿⣿⣿⣿⣿⣿⠄⣴⣿⣶⣄⠄⣴⣶⠄⢀⣾⣿⣿⣿⣿⣿⣿⠃⠄⠄",
--  "⠄⠄⠈⠻⣿⣿⣿⣿⣿⣿⡄⢻⣿⣿⣿⠄⣿⣿⡀⣾⣿⣿⣿⣿⣛⠛⠁⠄⠄⠄",
--  "⠄⠄⠄⠄⠈⠛⢿⣿⣿⣿⠁⠞⢿⣿⣿⡄⢿⣿⡇⣸⣿⣿⠿⠛⠁⠄⠄⠄⠄⠄",
--  "⠄⠄⠄⠄⠄⠄⠄⠉⠻⣿⣿⣾⣦⡙⠻⣷⣾⣿⠃⠿⠋⠁⠄⠄⠄⠄⠄⢀⣠⣴",
--  "⣿⣿⣿⣶⣶⣮⣥⣒⠲⢮⣝⡿⣿⣿⡆⣿⡿⠃⠄⠄⠄⠄⠄⠄⠄⣠⣴⣿⣿⣿"
--}
--g.dashboard_custom_header = {
--  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣶⣶⣶⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢷⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣴⣾⣿⣿⣿⣿⡿⠿⠙⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⡿⣿⣿⣶⣦⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⠟⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠿⢻⣿⣿⣿⣿⣦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--  "⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠛⠻⣿⣿⣷⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--  "⠀⠀⠀⠀⠀⠀⠀⠰⠟⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⢀⡄⢀⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣿⣧⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣶⣾⣿⣿⣿⣟⡻⠿⣷⣶⣾⣿⣿⣿⣷⣾⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠙⠙⠿⢿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀",
--  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⣿⣿⣿⣿⣿⣿⡇⠒⢶⣯⣿⣿⣿⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣄⡄⣶⣶⣿⣷⣶⣶⣦⣤⣀⡀⠀⠀⠀⠀⠀⠀⠀⢿⣆⡄⠀⠀⠀⠀⠀⠀⠀",
--  "⠀⠀⠀⠀⠀⠀⠀⠀⢀⣸⣿⣿⣿⣿⢹⣿⣿⣿⣧⠆⠀⠀⠈⢻⣿⠟⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣟⣱⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣄⠀⠀⠀⠀⠀⠘⢳⡄⠀⠀⠀⠀⠀⠀",
--  "⠀⠀⠀⠀⠀⠀⠀⢠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡾⠾⠇⠀⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⣿⣿⣿⣏⠉⢸⣿⣿⣟⣿⣿⡿⠻⢿⣿⣿⣷⣶⠀⠀⠀⠀⠘⠃⠀⠀⠀⠀⠀⠀",
--  "⠀⠀⠀⠀⠀⠀⠀⠿⠿⠛⠛⠛⠻⠿⠛⠿⠛⠛⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣿⣿⣿⣿⢿⣿⣿⣤⣤⣤⣿⣿⣿⣿⣮⣄⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀",
--  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠻⢿⣿⣿⣟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀",
--  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠈⠉⠛⠙⠛⠛⣿⣿⣿⣿⣿⡇⡀⠀⠀⠀⠀⠀⠀⠀",
--  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⠙⠙⢻⣿⣿⠀⠀⠀⠀⠀⠀⠀",
--  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⡆⠀⠀⠀⠀⠀⠀",
--  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀⠀",
--  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⡇⠀⠀⠀⠀⠀⠀",
--  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⠇⠀⠀⠀⠀⠀⠀",
--  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀",
--  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⠀⠀⠀⠀⠀⠀⠀",
--  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡟⠀⠀⠀⠀⠀⠀⠀",
--  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡞⠀⠀⠀⠀⠀⠀⠀⠀",
--  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀",
--  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀",
--  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀",
--  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠃⠀⠀⠀⠀⠀⠀⠀⠀",
--  "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
--}

g.dashboard_custom_section = {
  a = {description = {"  Find File                 SPC f f"}, command = "Telescope find_files"},
  d = {description = {"洛 New File                  SPC f n"}, command = "DashboardNewFile"},
  e = {description = {"󰓏  Bookmarks                 SPC b m"}, command = "Telescope marks"},
  f = {description = {"  Load Last Session         SPC s l"}, command = "SessionLoad"}
}
