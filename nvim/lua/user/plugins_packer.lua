local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use { "wbthomason/packer.nvim" } use { "nvim-lua/popup.nvim" }
  use { "nvim-lua/plenary.nvim" }
  -- colorscheme
  use { 'endel/vim-github-colorscheme'}
  use { 'folke/tokyonight.nvim'}
  use { 'joshdick/onedark.vim'}
  use { 'EdenEast/nightfox.nvim'}
  use { 'vim-airline/vim-airline'}
  use { 'vim-airline/vim-airline-themes'}
  use { 'ayu-theme/ayu-vim'}
  -- file explorer
  use { 'preservim/nerdtree'}
  -- movement
  use { 'justinmk/vim-sneak'}
  use { 'tpope/vim-surround'}
  use { 'jiangmiao/auto-pairs'}
  use { 'kien/ctrlp.vim'}
  use { 'preservim/nerdcommenter'}
  use { 'godlygeek/tabular'}
  -- vimwiki: for writing document
  use { 'vimwiki/vimwiki'}
  -- Startup page
  use { 'mhinz/vim-startify'}
  use { 'mhinz/vim-janah'}
  -- dealing with csv
  use { 'chrisbra/csv.vim'}
  -- language servers
  use { 'neovim/nvim-lspconfig'}
  use { 'williamboman/nvim-lsp-installer'}
  use { "jose-elias-alvarez/null-ls.nvim"}
  -- nvim-cmp
  use { 'hrsh7th/cmp-nvim-lsp'}
  use { 'hrsh7th/cmp-buffer'}
  use { 'hrsh7th/cmp-path'}
  use { 'hrsh7th/cmp-cmdline'}
  use { 'hrsh7th/nvim-cmp'}
  use { 'f3fora/cmp-spell'}
  -- snipts
  use { 'L3MON4D3/LuaSnip'}
  use { 'saadparwaiz1/cmp_luasnip'}
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
