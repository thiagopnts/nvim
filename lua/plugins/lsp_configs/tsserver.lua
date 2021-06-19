-- lsp configs for typescript/javascript
-- external dependencies can be installed with:
-- yarn global add typescript typescript-language-server \
-- diagnostic-languageserver eslint_d prettier lua-fmt
return {
  on_attach = function(client, bufnr)
    -- disable formatting so it can be handled by prettier instead
    client.resolved_capabilities.document_formatting = false
    require("plugins.lsp_configs.common").on_attach(client, bufnr)
  end
}
