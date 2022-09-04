local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/AppData/Local/nvim/plugged')

-- Plug "wbthomason/packer.nvim"
Plug "nvim-lua/popup.nvim"
Plug "nvim-lua/plenary.nvim"
-- startup time
Plug 'dstein64/vim-startuptime'
-- colorscheme
Plug 'joshdick/onedark.vim'
-- Plug 'EdenEast/nightfox.nvim'
-- status line
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim'
-- Plug 'vim-airline/vim-airline'
-- Plug 'vim-airline/vim-airline-themes'
-- Plug 'morhetz/gruvbox'
Plug('catppuccin/nvim', { ['as'] = 'catppuccin' })
-- file explorer
-- Plug 'preservim/nerdtree'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
-- movement
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
--Plug 'preservim/nerdcommenter'
Plug 'terrortylor/nvim-comment'
Plug 'godlygeek/tabular'
-- vimwiki: for writing document
Plug 'vimwiki/vimwiki'
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
Plug 'rafamadriz/friendly-snippets'
-- ctags
Plug('preservim/tagbar', {
    ['for'] = { 'python' }
})
-- markdown preview
Plug('iamcco/markdown-preview.nvim', {
    ['do'] = vim.fn['mkdp#util#install'],
    ['for'] = { 'markdown', 'vimwiki', 'vim-plug' }
})
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
Plug 'ekickx/clipboard-image.nvim'
-- database
-- Plug 'tpope/vim-dadbod'
-- Plug 'kristijanhusak/vim-dadbod-ui'
-- telescope
Plug 'nvim-telescope/telescope.nvim'

-- treesitter
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

-- leap
Plug 'ggandor/leap.nvim'

vim.call('plug#end')

-- active plugins
require("catppuccin").setup(
    { transparent_background = false,
        dim_inactive = {
            enabled = true,
            shade = "dark",
            percentage = 0.15,
        },
    })

require("bufferline").setup {}
require("nvim-tree").setup({
    git = { enable = true },
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {}
    }

})
require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'onedark',
        component_separators = '|',
        section_separators = '',
    },
}
require('nvim_comment').setup()
require('leap').set_default_keymaps()
