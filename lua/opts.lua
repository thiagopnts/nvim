local opt = vim.opt

vim.cmd("filetype plugin indent on")
vim.cmd("syntax enable")

opt.compatible = false
opt.tabstop = 2
opt.shiftwidth = 2
opt.shiftround = true
opt.expandtab = true
opt.encoding = "utf-8"
opt.autoindent = true
opt.fileencoding = "utf-8"
opt.fileencodings = {"utf-8"}
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.wrap = true
opt.background = "dark"
opt.softtabstop = 2
opt.relativenumber = true -- show line numbers relative
opt.number = true
--opt.colorcolumn = { 90 }
opt.mouse = "a"
opt.termguicolors = true
opt.ignorecase = true
opt.scrolloff = 999 -- keep cursor centered
opt.hlsearch = false

vim.o.completeopt = 'menuone,noselect'
vim.o.inccommand = 'nosplit'
