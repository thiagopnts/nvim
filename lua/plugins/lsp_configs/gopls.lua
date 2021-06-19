local common = require("plugins.lsp_configs.common")

-- golang, you need gopls in your PATH
return {on_attach = common.on_attach, capabilities = common.capabilities}
