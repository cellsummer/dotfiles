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
      vim.cmd('colorscheme rose-pine')
    end
  },
}
