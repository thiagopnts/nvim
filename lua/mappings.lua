vim.g.mapleader = " "
-- when in terminal mode(:term), map ESC to exit instead of the default c-\ c-n
vim.api.nvim_set_keymap("t", '<Esc>', [[<C-\><C-n>]], {noremap=true, silent=true})
