local signs = { Error = "●", Warn = "●", Hint = "", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

require("lsp_signature").setup({
  bind = true, -- This is mandatory, otherwise border config won't get registered.
  hint_prefix = "",
  handler_opts = {
    border = "rounded",
  },
})

require("nvim-lsp-installer").setup({
  automatic_installation = true,
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗",
    },
  },
})

local lsp_defaults = {
  flags = {
    debounce_text_changes = 150,
  },
  capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = function(client, bufnr)
    vim.api.nvim_exec_autocmds("User", { pattern = "LspAttached" })
    if client.resolved_capabilities.document_formatting then
      vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
    end
  end,
}
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.shfmt,
    null_ls.builtins.formatting.rubocop,
    null_ls.builtins.formatting.xmllint,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.zigfmt,
    null_ls.builtins.formatting.prettier,

    null_ls.builtins.diagnostics.hadolint,
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.diagnostics.checkmake,
    null_ls.builtins.diagnostics.fish,

    null_ls.builtins.code_actions.eslint,
  },
  -- you can reuse a shared lspconfig on_attach callback here
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({
            bufnr = bufnr,
          })
        end,
      })
    end
  end,
})

local lspconfig = require("lspconfig")

lspconfig.util.default_config = vim.tbl_deep_extend("force", lspconfig.util.default_config, lsp_defaults)

local lang_servers = {
  gopls = {},
  zls = {},
  dockerls = {},
  terraformls = {},
  pyright = {},
  bashls = {},
  solargraph = {},
  sumneko_lua = require("lua-dev").setup({
    lspconfig = {
      on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
      end,
    },
  }),
}

for lang_server, config in pairs(lang_servers) do
  lspconfig[lang_server].setup(config)
end

lspconfig.tsserver.setup({
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
    local ts_utils = require("nvim-lsp-ts-utils")
    ts_utils.setup({})
    ts_utils.setup_client(client)
    lsp_defaults.on_attach(client, bufnr)
  end,
})

require("rust-tools").setup({})
require("go").setup({
  lsp_keymaps = false,
  lsp_cfg = {
    capabilities = lsp_defaults.capabilities,
    on_attach = function(client, bufnr)
      lsp_defaults.on_attach(client, bufnr)
    end,
  },
})
