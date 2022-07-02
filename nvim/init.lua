require("user.plugins")
require("user.options")
require("user.keymappings")
require('user.autocmd')
require("user.lsp")
require("user.nvim-cmp")

-- Other configs in vimscript
vim.cmd("source " .. vim.fn.stdpath("config") .. "/lua/myConfigs.vim")
