vim.g.mapleader = " "
-- when in terminal mode(:term), map ESC to exit instead of the default c-\ c-n
vim.api.nvim_set_keymap("t", "<Esc>", [[<C-\><C-n>]], {noremap = true, silent = true})

-- create new file
vim.api.nvim_set_keymap("n", "<Leader>fn", [[<Cmd> DashboardNewFile<CR>]], {noremap = true, silent = true})

-- eval current lua file
vim.api.nvim_set_keymap("n", "<Leader>rr", [[<Cmd> luafile %<CR>]], {noremap = true, silent = true})

-- open/close nvim tree
vim.api.nvim_set_keymap("n", "<Leader>k", [[<Cmd> NvimTreeToggle<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>[", [[<Cmd> bn<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>]", [[<Cmd> bn<CR>]], {noremap = true, silent = true})
