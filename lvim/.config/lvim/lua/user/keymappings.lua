-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.insert_mode['jk'] = '<ESC>'
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["x"] = ":BufferKill<CR>"
lvim.keys.normal_mode["<S-b>"] = "^"
lvim.keys.normal_mode["<S-e>"] = "$"

lvim.keys.normal_mode['j'] = 'gj'
lvim.keys.normal_mode['k'] = 'gk'
lvim.keys.normal_mode['<C-d>'] = "<C-d>zz"
lvim.keys.normal_mode['<C-u>'] = "<C-u>zz"
lvim.keys.normal_mode['n'] = "nzz"
lvim.keys.normal_mode['N'] = "Nzz"

-- telescope keybindings
lvim.keys.normal_mode["<leader>sl"] = ":Telescope current_buffer_fuzzy_find<cr>"
lvim.keys.normal_mode["<leader>ss"] = ":Telescope spell_suggest<cr>"
lvim.keys.normal_mode["<leader>so"] = ":Telescope oldfiles<cr>"

local opts = { noremap = true, silent = true }
-- Prevent changes made to text from landing in the default registers
vim.api.nvim_set_keymap('n', "c", "\"_c", opts)
vim.api.nvim_set_keymap('n', "C", "\"_C", opts)
vim.api.nvim_set_keymap('n', "s", "\"_s", opts)
vim.api.nvim_set_keymap('n', "S", "\"_S", opts)

-- Same as above but for visual mode
vim.api.nvim_set_keymap('v', "c", "\"_c", opts)
vim.api.nvim_set_keymap('v', "C", "\"_C", opts)
vim.api.nvim_set_keymap('v', "s", "\"_s", opts)
vim.api.nvim_set_keymap('v', "S", "\"_S", opts)

-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }
