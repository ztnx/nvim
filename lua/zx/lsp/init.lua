local ok_mason,  mason            = pcall(require, "mason")
local ok_mlconf, mason_lspconfig  = pcall(require, "mason-lspconfig")

if not ok_mason or not ok_mlconf then
  return
end

mason.setup()
mason_lspconfig.setup({
    ensure_installed = { "rust_analyzer", "gopls", "html", "cssls", "emmet_ls", "tsserver", "jsonls", "eslint", "graphql", "astro", "dockerls", "taplo", "yamlls", "bashls"  },
    automatic_installation = true,
})

require('zx/lsp/lsp-config')    -- LSP Configurationf for Languages 
require('zx/lsp/utils').setup()
require('zx/lsp/null-ls')       -- Diagnostics and Formatting
