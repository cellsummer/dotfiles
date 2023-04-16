-- Autocommands (https://neovim.io/doc/user/autocmd.html)
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.py", },
  -- enable wrap mode for json files only
  command = "set foldmethod=indent foldlevel=4",
})
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.md", },
  -- enable wrap mode for json files only
  command = "set spell!",
})
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.norg", },
  -- enable wrap mode for json files only
  command = "set fdls=4 conceallevel=2 spell!",
})
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
