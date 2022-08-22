return {
  on_attach     = require('zx.lsp.utils').on_attach,
  capabilities  = require('zx.lsp.utils').capabilities,
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    },
  },
}
