require "user.plugins"
require "user.options"
require "user.keymappings"
require "user.lsp"
require "user.cmp"
require "user.telescope"
-- require "user.treesitter"

vim.cmd("source " .. vim.fn.stdpath("config") .. "/lua/user/myConfigs.vim")
