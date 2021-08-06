local lspconfig = require("lspconfig")

-- this simplifies lsp calls so its not 3km long
vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
vim.cmd("command! LspOrganize lua lsp_organize_imports()")
vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
vim.cmd("command! LspDiagPrev lua vim.lsp.diagnostic.goto_prev()")
vim.cmd("command! LspDiagNext lua vim.lsp.diagnostic.goto_next()")
vim.cmd("command! LspDiagLine lua vim.lsp.diagnostic.show_line_diagnostics()")
vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")

local lsps = {
  "diagnosticls",
  "sumneko_lua",
  "pylsp",
  "gopls",
  "rust_analyzer",
  "tsserver",
  "rnix",
  "phpactor"
}

for _, lang_server in pairs(lsps) do
  local config = require("plugins.lsp_configs." .. lang_server)
  print("loading " .. lang_server)
  lspconfig[lang_server].setup(config)
end
