lvim.plugins = {
  {
    "ggandor/leap.nvim",
    config = function()
      require('leap').add_default_mappings()
    end
  },
  "Mofiqul/vscode.nvim",
  "tpope/vim-surround",
  -- notetaking plugins
  "renerocksai/telekasten.nvim",
  "renerocksai/calendar-vim",
  {
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
      require('rose-pine').setup({
        dark_variant = 'moon',
        disable_italics = true
      })
      -- vim.cmd('colorscheme rose-pine')
    end
  },
  -- markdown
  "mzlogin/vim-markdown-toc",
  "godlygeek/tabular",
  -- "preservim/vim-markdown"
  -- note taking using mind
  {
    'phaazon/mind.nvim',
    branch = 'v2.2',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require 'mind'.setup()
    end
  }
}
