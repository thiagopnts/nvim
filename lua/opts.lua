local opt = vim.opt

vim.cmd('filetype plugin indent on')
vim.cmd('syntax enable')

opt.compatible = false
opt.tabstop = 2
opt.shiftwidth = 2
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'
opt.fileencodings = { 'utf-8' }
opt.shiftround = true
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.background = 'dark'
opt.softtabstop = 2
opt.expandtab = true
opt.number = true -- show line numbers
opt.colorcolumn = { 90 } 
opt.mouse = 'a'
opt.termguicolors = true
