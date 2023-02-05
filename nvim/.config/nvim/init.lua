-- Minimal configuration for neovim

-- Options
local opts = {
  backup = false,
  writebackup = false,
  swapfile = false,
  compatible = false,
  wildmenu = true,
  ignorecase = true,
  smartcase = true,
  --	shellslash = true,
  encoding = "utf-8",
  relativenumber = true,
  ts = 4,
  sw = 4,
  expandtab = true,
  hidden = true,
  hlsearch = true,
  mouse = "a",
  nu = true,
  foldmethod = "indent",
  foldlevel = 4,
  inccommand = "split",
  scrolloff = 10,
  cursorline = true,
}

vim.opt.shortmess:append("c")
vim.opt.clipboard:append("unnamedplus")
vim.opt.iskeyword:append("-")

-- Keymappings

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
keymap("n", "c", "\"_c", opts)

-- remap j/k to gj/gk
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)
keymap("n", "gj", "j", opts)
keymap("n", "gk", "k", opts)


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

-- Quick fix spelling
keymap("n", "<leader>s", "1z=<CR>", opts)

-- Split window vertically
keymap("n", "<leader>v", ":vsplit<CR>", opts)


-- Insert --

-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- undo partially
keymap("i", ",", ",<C-g>u", opts)
keymap("i", ".", ".<C-g>u", opts)
keymap("i", "?", "?<C-g>u", opts)
keymap("i", "!", "!<C-g>u", opts)

-- Paste
keymap("i", "<C-v>", "<C-r>*<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Perform dot commands over visual blocks:
keymap("v", ".", ":norm .<CR>", opts)

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
