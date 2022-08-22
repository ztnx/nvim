local ok, saga = pcall(require, "lspsaga")
if not ok then
  return
end

vim.o.winbar = " "  -- Show winbar before lspsaga load
--[[ vim.api.nvim_set_hl(0, 'WinBar', { bg = '#1f2335', sp = '#1f2335' }) ]]
--[[ vim.api.nvim_set_hl(0, 'WinBarNC', { bg = '#1f2335', sp = '#1f2335' }) ]]

saga.init_lsp_saga({
  saga_winblend = 10,
  code_action_icon = " ",
  symbol_in_winbar = {
    enable = true,
    separator = '  ',
    show_file = false,
    click_support = true,
  }
})
