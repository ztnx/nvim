local ok, rt = pcall(require, "rust-tools")
if not ok then
  return
end

rt.setup({
  server = {
    on_attach     = require('zx.lsp.utils').on_attach,
    capabilities  = require('zx.lsp.utils').capabilities,
  },
})

