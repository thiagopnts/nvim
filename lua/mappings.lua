vim.g.mapleader = " "
-- when in terminal mode(:term), map ESC to exit instead of the default c-\ c-n
vim.api.nvim_set_keymap("t", "<Esc>", [[<C-\><C-n>]], {noremap = true, silent = true})

-- create new file
vim.api.nvim_set_keymap("n", "<Leader>fn", [[<Cmd> DashboardNewFile<CR>]], {noremap = true, silent = true})

-- eval current lua file
vim.api.nvim_set_keymap("n", "<Leader>rr", [[<Cmd> luafile %<CR>]], {noremap = true, silent = true})

-- keep everything centered
vim.api.nvim_set_keymap("n", "n", "nzzzv", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "N", "Nzzzv", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "J", "mzJ`z", {noremap = true, silent = true})

-- undo break points
vim.api.nvim_set_keymap("i", ",", [[,<c-g>u]], {noremap = true, silent = true})
vim.api.nvim_set_keymap("i", ".", [[.<c-g>u]], {noremap = true, silent = true})
vim.api.nvim_set_keymap("i", "::", [[.<c-g>u]], {noremap = true, silent = true})
vim.api.nvim_set_keymap("i", "_", [[.<c-g>u]], {noremap = true, silent = true})

-- open/close nvim tree
vim.api.nvim_set_keymap("n", "<Leader>k", [[<Cmd> NvimTreeToggle<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>[", [[<Cmd> bp<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>]", [[<Cmd> bn<CR>]], {noremap = true, silent = true})
-- map Y to yank curr line position up until the end, similar with D, C, etc
vim.api.nvim_set_keymap("n", "Y", "y$", {noremap = true, silent = true})

-- text move support
vim.api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv", {noremap = true, silent = true})
vim.api.nvim_set_keymap("v", "K", ":m '<-2<CR>gv=gv", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>j", ":m .+1<CR>==", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>k", ":m .-2<CR>==", {noremap = true, silent = true})
vim.api.nvim_set_keymap("i", "<C-j>", "<esc>:m .+1<CR>==i", {noremap = true, silent = true})
vim.api.nvim_set_keymap("i", "<C-k>", "<esc>:m .-2<CR>==i", {noremap = true, silent = true})
