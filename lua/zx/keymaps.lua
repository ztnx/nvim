local keymap = vim.keymap.set
local opts = { silent = true }
local exprOpts = { silent = true, expr = true }

keymap("", "<Space>", "<Nop>", opts) -- Leader Key: space
vim.g.mapleader = " "

keymap("i", "jk", "<ESC>", opts)     -- Quick Normal Mode 

keymap("n", "<S-h>", ":BufferLineCyclePrev<CR>", opts)
keymap("n", "<S-l>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<S-q>", ":Bdelete<CR>", opts)

keymap("n", "<leader><CR>", ":so ~/.config/nvim/init.lua<CR>", opts)

keymap("v", "<", "<gv", opts) -- Stay in Visual while indenting
keymap("v", ">", ">gv", opts)

-- Copy to system clipboard
keymap("n", "<leader>y", '"+y', opts)
keymap("v", "<leader>y", '"+y', opts)

keymap("n", ",p", '"0p', opts) -- Paste the last thing copied (not deleted)
keymap("n", ",P", '"0P', opts)

-- Center Next, Prev and Line Concatenate
keymap("n", "N", "Nzzzv", opts)
keymap("n", "J", "mzJ`z", opts)

-- Add Undobreak Points
keymap("i", ",", ",<c-g>u", opts)
keymap("i", ".", ".<c-g>u", opts)
keymap("i", "!", "!<c-g>u", opts)
keymap("i", "?", "?<c-g>u", opts)

-- word wraps
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", exprOpts)
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", exprOpts)

-- Move line up/down
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)
keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

keymap("n", ";", ":", opts) -- Semicolon for command mode

-- Resize with arrows
keymap("n", "<S-Up>", ":resize -2<CR>", opts)
keymap("n", "<S-Down>", ":resize +2<CR>", opts)
keymap("n", "<S-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<S-Right>", ":vertical resize +2<CR>", opts)
