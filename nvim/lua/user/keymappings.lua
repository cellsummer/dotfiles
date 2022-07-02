local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --

keymap("n", "<S-e>", "$", opts)
keymap("n", "<S-b>", "^", opts)
keymap("n", "<S-y>", "yg_", opts)

-- center my search
keymap('n', 'n', 'nzz', opts)
keymap('n', '<S-n>', '<S-n>zz', opts)
keymap('n', '*', '*zz', opts)
keymap('n', '#', '#zz', opts)

-- remap j/k to gj/gk
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)
keymap("n", "gj", "j", opts)
keymap("n", "gk", "k", opts)

-- S to search and replace
keymap("n", "<S-s>", ":%s//g<Left><Left>", { noremap = true })

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Navigate buffers
keymap("n", "<S-k>", ":bnext<CR>", opts)
keymap("n", "<S-j>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)

-- Clipboard
keymap("n", "<C-p>", '"*p', opts)

-- Buffer operation
keymap("n", "<leader>c", ":bd<CR>", opts)
keymap("n", "<leader>e", ":NERDTreeToggle<CR>", opts)
keymap("n", "<leader>tf", ":NERDTreeFind<CR>", opts)
keymap("n", "<leader>t", ":VimwikiToggleListItem<CR>", opts)

-- No highlight
keymap("n", "<leader>h", ":noh<CR>", opts)

-- Quick fix spelling
keymap("n", "<leader>s", "1z=<CR>", opts)

-- Split window vertically
keymap("n", "<leader>v", ":vsplit<CR>", opts)

-- Ctrl+/ to toggle comment
keymap("n", "", "<plug>NERDCommenterToggle", opts)

-- F8 to paste timestamp
keymap("n", "<F8>", '"=strftime("%c")<CR>p', opts)

-- F12 to open myCoonfig
keymap('n', '<F12>', ':vs $MYVIMRC<CR>', opts)

-- Insert --

-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- undo partially
keymap("i", ",", ",<C-g>u", opts)
keymap("i", ".", ".<C-g>u", opts)
keymap("i", "?", "?<C-g>u", opts)
keymap("i", "!", "!<C-g>u", opts)

-- F8 to paste timestamp
keymap("i", "<F8>", '<C-R>=strftime("%c")<CR>', opts)


-- Paste
keymap("i", "<C-v>", "<C-r>*<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m .-2<CR>gv=gv", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Command Mode --
keymap("c", "<C-v>", "<C-r>*", { noremap = true })
-- Alt-v to paste the current line to command_mode
-- keymap("c", "<A-v>", "<C-\>esubstitute(getline('.'), '^\s*\(' . escape(substitute(&commentstring, '%s.*$', '', ''), '*') . '\)*\s*:*' , '', '')<CR>", opts)
