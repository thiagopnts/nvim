require("nvim-lsp-installer").setup {
  automatic_installation = true,
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗",
    },
  },
}

local lsp_defaults = {
  flags = {
    debounce_text_changes = 150,
  },
  capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = function(client, bufnr)
    vim.api.nvim_exec_autocmds("User", { pattern = "LspAttached" })
  end,
}
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require "null-ls"
null_ls.setup {
  debug = true,
  sources = {
    null_ls.builtins.diagnostics.hadolint,
    null_ls.builtins.formatting.black,
    --null_ls.builtins.formatting.autopep8,

    null_ls.builtins.formatting.stylua,
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.diagnostics.checkmake,
    null_ls.builtins.diagnostics.fish,
    null_ls.builtins.completion.spell,
  },
  -- you can reuse a shared lspconfig on_attach callback here
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format {
            bufnr = bufnr,
            --            filter = function(clients)
            --              return vim.tbl_filter(
            --                function(c) return c.name ~= "null-ls" end,
            --                clients
            --              )
            --            end
          }
        end,
      })
    end
  end,
}

local lspconfig = require "lspconfig"

lspconfig.util.default_config = vim.tbl_deep_extend("force", lspconfig.util.default_config, lsp_defaults)
require("rust-tools").setup {}
require("go").setup {}

local lang_servers = {
  gopls = {},
  dockerls = {},
  terraformls = {},
  pyright = {},
  bashls = {},
  sumneko_lua = require("lua-dev").setup {},
}

for lang_server, config in pairs(lang_servers) do
  lspconfig[lang_server].setup(config)
end
