local ok, autopairs = pcall(require, "nvim-autopairs")
if not ok then
  return
end

autopairs.setup {
  check_ts = true, -- treesitter integration
  disable_filetype = { "TelescopePrompt" },
  enable_check_bracket_line = false,
  check_ts = true,
  ts_config = {
    lua = { "string", "source" },
    javascript = { "string", "template_string" },
  },
}

local cmp_autopairs = require "nvim-autopairs.completion.cmp"
local cmp_ok, cmp = pcall(require, "cmp")
if not cmp_ok then
  return
end
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done {})
