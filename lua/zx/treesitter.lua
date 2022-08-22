local ok_nvimts,  nvim_treesitter = pcall(require, "nvim-treesitter.configs")

if not ok_nvimts then
  return
end

-- Colors from Tokyonight to add to bracket pair colorizer
--[[ local colors = require("tokyonight.colors").setup({}) ]]

nvim_treesitter.setup {
  ensure_installed = { "lua", "rust", "go", "html", "css", "javascript", "typescript", "tsx", "graphql", "astro", "dockerfile", "toml", "yaml", "bash" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    --[[ colors = { -- Uncomment if using tokyonight
      colors.dark3,
      colors.yellow,
      colors.blue2,
      colors.orange,
      colors.purple,
      colors.green1,
      colors.red,
    }, ]]
  },
}
