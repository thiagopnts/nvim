require 'lspconfig'.gopls.setup{} -- golang, you need to have gopls in your PATH
require 'lspconfig'.sumneko_lua.setup{ -- lua, you need to have lua-language-server in your path
	cmd = { "lua-language-server" },
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
}

