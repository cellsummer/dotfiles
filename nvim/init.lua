require("user.plugins")
-- require("user.iron")
require("user.options")
require("user.keymappings")
require('user.autocmd')
require("user.lsp")
require("user.nvim-cmp")
require("user.markdown")
require("user.treesitter")

-- Other configs in vimscript
vim.cmd("source " .. vim.fn.stdpath("config") .. "/lua/myConfigs.vim")
