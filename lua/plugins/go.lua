require("go").setup {
  auto_lint = false
}

-- generate comment for function/method
--vim.cmd("autocmd FileType go nmap <Leader>gc :lua require('go.comment').gen()")
--
--vim.api.nvim_exec([[
--  autocmd BufWritePre *.go :silent! lua require('go.format').gofmt()
--]], true)
