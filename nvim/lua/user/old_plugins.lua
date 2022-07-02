
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute "packadd packer.nvim"
end

--- Check if a file or directory exists in this path
local function require_plugin(plugin)
    local plugin_prefix = fn.stdpath("data") .. "/site/pack/packer/opt/"

    local plugin_path = plugin_prefix .. plugin .. "/"
    --	print('test '..plugin_path)
    local ok, err, code = os.rename(plugin_path, plugin_path)
    if not ok then
        if code == 13 then
            -- Permission denied, but it exists
            return true
        end
    end
    --	print(ok, err, code)
    if ok then
        vim.cmd("packadd " .. plugin)
    end
    return ok, err, code
end

vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua

return require("packer").startup(
    function(use)
  -- My plugins here
  use { "wbthomason/packer.nvim" }
  use { "nvim-lua/popup.nvim" }
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

        --require_plugin("nvim-lspconfig")
        --require_plugin("lspsaga.nvim")
        --require_plugin("nvim-lspinstall")
        --require_plugin("friendly-snippets")
        --require_plugin("popup.nvim")
        --require_plugin("plenary.nvim")
        --require_plugin("telescope.nvim")
        --require_plugin("nvim-dap")
        --require_plugin("nvim-compe")
        --require_plugin("vim-vsnip")
        --require_plugin("nvim-treesitter")
        --require_plugin("nvim-ts-autotag")
        --require_plugin("nvim-tree.lua")
        --require_plugin("gitsigns.nvim")
        --require_plugin("which-key.nvim")
        --require_plugin("dashboard-nvim")
        --require_plugin("nvim-autopairs")
        --require_plugin("nvim-comment")
        --require_plugin("nvim-bqf")
        --require_plugin("nvcode-color-schemes.vim")
        --require_plugin("nvim-web-devicons")
        --require_plugin("galaxyline.nvim")
        --require_plugin("barbar.nvim")
        --require_plugin('toggleterm')
        --require_plugin('vim-surround')
        --require_plugin('vim-sneak')
        --require_plugin('tabular')
        --require_plugin('vim-markdown')
        --require_plugin('vim-pandoc')
        --require_plugin('vim-pandoc-syntax')
        --require_plugin('nvim-toggleterm')
    end
)
