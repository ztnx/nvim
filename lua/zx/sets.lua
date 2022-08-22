vim.g.mapleader = " "
vim.opt.backup = false                          -- creates a backup file
vim.opt.cmdheight = 1                           -- more space in the neovim command line for displaying messages
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
vim.opt.conceallevel = 0                        -- so that `` is visible in markdown files
vim.opt.cursorline = true                       -- highlight the current line
vim.opt.errorbells = false
vim.opt.expandtab = true                        -- convert tabs to spaces
vim.opt.fileencoding = "utf-8"                  -- the encoding written to a file
vim.opt.fillchars.eob=" "
vim.opt.guifont = "monospace:h17"               -- the font used in graphical neovim applications
vim.opt.hlsearch = true                         -- highlight all matches on previous search pattern
vim.opt.ignorecase = true                       -- ignore case in search patterns
vim.opt.incsearch = true
vim.opt.isfname:append("@-@")
vim.opt.iskeyword:append("-")
vim.opt.laststatus = 3
vim.opt.mouse = "a"                             -- allow the mouse to be used in neovim
vim.opt.number = true                           -- set numbered lines
vim.opt.numberwidth = 4                         -- set number column width to 2 {default 4}
vim.opt.path = vim.opt.path + "**"
vim.opt.pumheight = 10                          -- pop up menu height
vim.opt.relativenumber = true
vim.opt.ruler = false
vim.opt.scrolloff = 8                           -- is one of my fav
vim.opt.shiftwidth = 2                          -- the number of spaces inserted for each indentation
vim.opt.shortmess:append("c")                   -- Don't pass messages to |ins-completion-menu|.
vim.opt.showcmd = false
vim.opt.showmode = false                        -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 0                         -- always show tabs
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time
vim.opt.smartcase = true                        -- smart case
vim.opt.smartindent = true                      -- make indenting smarter again
vim.opt.splitbelow = true                       -- force all horizontal splits to go below current window
vim.opt.splitright = true                       -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false                        -- creates a swapfile
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.termguicolors = true                    -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 400                        -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.title = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true                         -- enable persistent undo
vim.opt.updatetime = 50                         -- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
vim.opt.whichwrap:append("<,>,[,],h,l")
vim.opt.wildmenu = true 
vim.opt.wrap = false                            -- display lines as one long line
vim.opt.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

-- Disable some default plugins for faster load times
vim.g.loaded_gzip = false
vim.g.loaded_matchit = false
vim.g.loaded_netrwPlugin = false
vim.g.loaded_tarPlugin = false
vim.g.loaded_zipPlugin = false
vim.g.loaded_man = false
vim.g.loaded_2html_plugin = false
vim.g.loaded_remote_plugins = false
vim.g.did_load_filetypes = false

-- Custom GitLab Domains
vim.g.fugitive_gitlab_domains = { 'https://gitlab.coko.foundation' }
