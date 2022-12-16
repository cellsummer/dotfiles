-- local Plug = vim.fn['plug#']
-- vim.call('plug#begin', '~/AppData/Local/nvim/plugged')
-- vim.cmd [[packadd packer.nvim]]
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    -- improve startup time
    -- Plug "lewis6991/impatient.nvim"

    -- Plug "wbthomason/packer.nvim"
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"
    -- startup time
    use 'dstein64/vim-startuptime'
    -- colorscheme
    use 'joshdick/onedark.vim'
    -- Plug 'EdenEast/nightfox.nvim'
    -- status line
    use 'nvim-lualine/lualine.nvim'
    use 'akinsho/bufferline.nvim'
    -- Plug 'vim-airline/vim-airline'
    -- Plug 'vim-airline/vim-airline-themes'
    -- Plug 'morhetz/gruvbox'
    use { 'catppuccin/nvim', as = 'catppuccin' }
    use { 'rose-pine/neovim', as = 'rose-pine' }
    -- file explorer
    -- Plug 'preservim/nerdtree'
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'
    -- movement
    use 'tpope/vim-surround'
    use 'jiangmiao/auto-pairs'
    --Plug 'preservim/nerdcommenter'
    use 'terrortylor/nvim-comment'
    use 'godlygeek/tabular'
    -- vimwiki: for writing document
    use 'vimwiki/vimwiki'
    -- dealing with csv
    use 'chrisbra/csv.vim'
    -- language servers
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use "jose-elias-alvarez/null-ls.nvim"
    -- nvim-cmp
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'f3fora/cmp-spell'
    -- snipts
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'rafamadriz/friendly-snippets'
    -- ctags
    -- Plug('preservim/tagbar', { ['for'] = { 'python' } })
    -- Plug 'hkupty/iron.nvim'
    --Plug 'geg2102/nvim-python-repl'

    -- markdown preview
    -- use('iamcco/markdown-preview.nvim', {
    --   ['do'] = vim.fn['mkdp#util#install'],
    --   ['for'] = { 'markdown', 'vimwiki', 'vim-plug' }
    -- })
    use 'godlygeek/tabular'
    use 'preservim/vim-markdown'
    use 'ekickx/clipboard-image.nvim'
    -- database
    -- Plug 'tpope/vim-dadbod'
    -- Plug 'kristijanhusak/vim-dadbod-ui'
    -- telescope
    use 'nvim-telescope/telescope.nvim'

    -- treesitter
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/nvim-treesitter-textobjects'

    -- leap
    use 'ggandor/leap.nvim'

    if packer_bootstrap then
        require('packer').sync()
    end

end)
-- vim.call('plug#end')
