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
keymap("n", "<leader>s", ":%s//g<Left><Left>", { noremap = true })

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
--keymap("n", "<C-j>", "<C-w>j", opts)
--keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Navigate buffers
keymap("n", "<S-k>", ":bnext<CR>", opts)
keymap("n", "<S-j>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)

-- Clipboard
keymap("n", "<leader>p", '"*p', opts)

-- Buffer operation
keymap("n", "<leader>c", ":bd<CR>", opts)
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>ff", ":NvimTreeFindFile<CR>", opts)
keymap("n", "<leader>t", ":VimwikiToggleListItem<CR>", opts)
keymap("n", "<leader>pb", ":BufferLinePick<CR>", opts)

-- No highlight
keymap("n", "<leader>h", ":noh<CR>", opts)

-- Quick fix spelling
keymap("n", "<leader>sp", "1z=<CR>", opts)

-- Split window vertically
keymap("n", "<leader>v", ":vsplit<CR>", opts)

-- Ctrl+/ to toggle comment
-- keymap("n", "", "<plug>NERDCommenterToggle", opts)

-- F8 to paste timestamp
keymap("n", "<F6>", '"=strftime("%c")<CR>p', opts)

-- F12 to open myCoonfig
keymap('n', '<F12>', ':e $MYVIMRC<CR>', opts)

-- F8 to toggle tagbar
keymap('n', '<F8>', ':TagbarToggle<CR>', opts)

-- database key mappings

keymap('n', '<leader>du', ':DBUIToggle<CR>', opts)
keymap('n', '<leader>df', ':DBUIFindBuffer<CR>', opts)
keymap('n', '<leader>dr', ':DBUIRenameBuffer<CR>', opts)
keymap('n', '<leader>dl', ':DBUILastQueryInfo<CR>', opts)

-- my excel workflow

keymap('n', '<leader>xd', ':!python C:/Users/cells/Documents/Github/workflow/pde.py from-dev-sql %<CR>', opts)
keymap('n', '<leader>xt', ':!python C:/Users/cells/Documents/Github/workflow/pde.py from-test-sql %<CR>', opts)
keymap('n', '<leader>xc', ':!python C:/Users/cells/Documents/Github/workflow/pde.py from-csv %<CR>', opts)

-- Search vimwiki tags
keymap('n', '<leader>sn', ':VimwikiSearch ', { noremap = true })
keymap('n', '<leader>st', ':VimwikiSearchTags ', { noremap = true })


-- telescope key mappings
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>?', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer]' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })


-- Insert --

-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Ctrl-e/a to go to end/beginning
keymap("i", "<C-e>", "<ESC>A", opts)
keymap("i", "<C-a>", "<ESC>I", opts)

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
