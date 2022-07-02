local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/AppData/Local/nvim/plugged')

  -- Plug "wbthomason/packer.nvim"
  Plug "nvim-lua/popup.nvim"
  Plug "nvim-lua/plenary.nvim"
  -- colorscheme
  Plug 'endel/vim-github-colorscheme'
  Plug 'folke/tokyonight.nvim'
  Plug 'joshdick/onedark.vim'
  Plug 'EdenEast/nightfox.nvim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'ayu-theme/ayu-vim'
  Plug 'sainnhe/everforest'
  Plug 'morhetz/gruvbox'
  Plug('catppuccin/nvim', {['as'] = 'catppuccin'})
  -- file explorer
  Plug 'preservim/nerdtree'
  -- movement
  Plug 'justinmk/vim-sneak'
  Plug 'tpope/vim-surround'
  Plug 'jiangmiao/auto-pairs'
  Plug 'kien/ctrlp.vim'
  Plug 'preservim/nerdcommenter'
  Plug 'godlygeek/tabular'
  -- vimwiki: for writing document
  Plug 'vimwiki/vimwiki'
  Plug('iamcco/markdown-preview.nvim', { ['do'] = 'cd app && yarn install'})
  -- Startup page
  --Plug 'mhinz/vim-startify'
  --Plug 'mhinz/vim-janah'
  -- dealing with csv
  Plug 'chrisbra/csv.vim'
  -- language servers
  Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/nvim-lsp-installer'
  Plug "jose-elias-alvarez/null-ls.nvim"
  -- nvim-cmp
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'f3fora/cmp-spell'
  -- snipts
  Plug 'L3MON4D3/LuaSnip'
  Plug 'saadparwaiz1/cmp_luasnip'

vim.call('plug#end')
