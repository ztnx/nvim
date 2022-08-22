local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
	return
end

-- Consider: https://github.com/jose-elias-alvarez/typescript.nvim for TypeScript
local servers = { "astro", "bashls", "cssls", "emmet_ls", "dockerls", "graphql", "html", "taplo", "tsserver" }
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = require("zx.lsp.utils").on_attach,
		capabilities = require("zx.lsp.utils").capabilities,
	})
end

-- CUSTOM LSP SERVERS --
require("zx/lsp/lang-configs/rust")
require("lspconfig").jsonls.setup(require("zx/lsp/lang-configs/json"))
require("lspconfig").yamlls.setup(require("zx/lsp/lang-configs/yaml"))
require("lspconfig").sumneko_lua.setup(require("zx/lsp/lang-configs/sumneko"))
