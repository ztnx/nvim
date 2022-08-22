local ok, catppuccin = pcall(require, "catppuccin")
if not ok then
  return
end

local colorscheme = "catppuccin"  -- tokyonight, darkplus
vim.g.catppuccin_flavour = "macchiato"  -- latte, frappe, macchiato, mocha

catppuccin.setup({
	transparent_background = true,
  integrations = {
    ts_rainbow = true,
    lightspeed = true,
    neogit = true,
    lsp_saga = true,
    lsp_trouble = true,
    nvimtree = {
			enabled = true,
			show_root = true,
			transparent_panel = true,
		},
  }
})

local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme) -- Safely set colorscheme
if not ok then
  vim.cmd[[ :colo desert ]] -- One of the more sane default colorschemes
  return
end

-- Bracker Pair Colorizing: 'zx/treesitter'
