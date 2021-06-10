
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

local buf_set_keymap = require '../util'.nvim_buf_set_keymap
local on_attach = function(client, bufnr)
  require'lsp_signature'.on_attach({
    bind = true,
    handler_opts = {
      border = "single",
    },
  }) -- from ray-x/lsp_signature.nvim, enables signature help pop up

  --Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap(bufnr, 'n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap(bufnr, 'n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end


require 'lspconfig'.gopls.setup({
  on_attach = on_attach ,
  capabilities = capabilities,
}) -- golang, you need to have gopls in your PATH

require 'lspconfig'.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities,
}) -- rust, need
local user = vim.fn.expand('$USER')
local sumneko_root_path = '/Users/' .. user .. '/src/lua-language-server'
local sumneko_binary = sumneko_root_path .. '/bin/macOS/lua-language-server'
local cmd = { "lua-language-server" }
if vim.fn.has('mac') then cmd = { sumneko_binary, '-E', sumneko_root_path .. '/main.lua' } end

require 'lspconfig'.sumneko_lua.setup({ -- lua, you need to have lua-language-server in your path
  capabilities = capabilities,
  on_attach = on_attach,
	cmd = cmd,
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT', -- set lua version to LuaJIT given we only use lua for neovim
				path = vim.split(package.path, ';'), -- set lua path
			},
			diagnostics = {
				globals = { 'vim' },
			},
			workspace = {
				library = {
					[vim.fn.expand('$VIMRUNTIME/lua')] = true,
					[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
				},
			},
		},
	},
})
