return {
  on_attach     = require('zx.lsp.utils').on_attach,
  capabilities  = require('zx.lsp.utils').capabilities,
  settings = {
    yaml = {
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"]   = "/.github/workflows/*",
        ["../path/relative/to/file.yml"]                        = "/.github/workflows/*",
        ["/path/from/root/of/project"]                          = "/.github/workflows/*"
      },
    },
  }
}
