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
  use { "wbthomason/packer.nvim" }
  use { "nvim-lua/popup.nvim" }
  use { "nvim-lua/plenary.nvim" }
  -- colors and themes
  use { 'xiyaowong/nvim-transparent' }
  use { 'preservim/nerdtree'}
  use { 'joshdick/onedark.vim'}
  use { 'folke/tokyonight.nvim'}
  use { 'EdenEast/nightfox.nvim'}
  use { 'justinmk/vim-sneak'}
  use { 'tpope/vim-surround'}
  use { 'jiangmiao/auto-pairs'}
  use { 'vim-airline/vim-airline'}
  use { 'vim-airline/vim-airline-themes'}
  use { 'ayu-theme/ayu-vim'}
  -- use { 'kien/ctrlp.vim'}
  use { 'vimwiki/vimwiki'}
  use { 'godlygeek/tabular'}
  use { 'preservim/nerdcommenter'}
  --use { 'mhinz/vim-startify'}
  use { 'mhinz/vim-janah'}
  use { 'chrisbra/csv.vim'}
  -- LSP
  use { 'neovim/nvim-lspconfig'}
  use { 'williamboman/nvim-lsp-installer'}
  use { "jose-elias-alvarez/null-ls.nvim"}
  -- Telescope
  use "nvim-telescope/telescope.nvim"
  -- CMP
  use { 'hrsh7th/cmp-nvim-lsp'}
  use { 'hrsh7th/cmp-buffer'}
  use { 'hrsh7th/cmp-path'}
  use { 'hrsh7th/cmp-cmdline'}
  use { 'hrsh7th/nvim-cmp'}
  -- snippets
  use { 'L3MON4D3/LuaSnip'}
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
  use { 'saadparwaiz1/cmp_luasnip'}
  use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
      }
  -- Git
  use "lewis6991/gitsigns.nvim"
  -- Quarto
  --use 'vim-pandoc/vim-pandoc'
  --use 'vim-pandoc/vim-pandoc-sytnax'
  --use 'quarto-dev/quarto-vim'
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
