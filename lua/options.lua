local opt = vim.opt

vim.cmd 'filetype plugin indent on'
vim.cmd 'syntax enable'

opt.tabstop = 2
opt.shiftwidth = 2
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'
opt.fileencodings = { 'utf-8' }
opt.backup = false
opt.writebackup = false
opt.swapfile = false

opt.number = true -- show line numbers
