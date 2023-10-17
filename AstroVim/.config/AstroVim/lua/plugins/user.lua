return {
  {
    "nvim-telescope/telescope-frecency.nvim",
    config = function() require("telescope").load_extension "frecency" end,
    lazy = false,
  },
  -- database
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod",                     lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },
  -- vim table mode
  { "dhruvasagar/vim-table-mode", lazy = false },
  -- Aasim-A/scrollEOF.nvim
  { "Aasim-A/scrollEOF.nvim",     lazy = false, opts = {} },
  -- neorg: note taking
  {
    "nvim-neorg/neorg",
    ft = "norg",
    cmd = { "Neorg" },
    build = ":Neorg sync-parsers",
    opts = function() return require "plugins.configs.neorg" end,
    dependencies = {
      { "nvim-neorg/neorg-telescope" },
      -- { "max397574/neorg-context" },
      { "nvim-lua/plenary.nvim" },
    },
  },
  { "tpope/vim-surround", lazy = false },
  {
    "arturgoms/moonbow.nvim",
    install = { colorscheme = { "moonbow" } },
    lazy = false,
  },

  -- noice: better UI
  {
    "folke/noice.nvim",
    lazy = false,
    opts = function() return require "plugins.configs.noice" end,
    dependencies = {
      "MunifTanjim/nui.nvim", -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      -- "rcarriga/nvim-notify"
    },
  },
  -- ChatGPT
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function() require("chatgpt").setup() end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
  -- better search tool
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    -- @type Flash.Config
    opts = {
      modes = {
        -- options used when flash is activated through
        -- a regular search with `/` or `?`
        search = {
          -- when `true`, flash will be activated during regular search by default.
          -- You can always toggle when searching with `require("flash").toggle()`
          enabled = false,
          highlight = { backdrop = false },
          jump = { history = true, register = true, nohlsearch = true },
          search = {
            -- `forward` will be automatically set to the search direction
            -- `mode` is always set to `search`
            -- `incremental` is set to `true` when `incsearch` is enabled
          },
        },
      },
    },
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump {
            search = {
              mode = function(str) return "\\<" .. str end,
            },
          }
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "o", "x" },
        function() require("flash").treesitter() end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function() require("flash").remote() end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function() require("flash").treesitter_search() end,
        desc = "Flash Treesitter Search",
      },
      {
        "<c-s>",
        mode = { "c" },
        function() require("flash").toggle() end,
        desc = "Toggle Flash Search",
      },
    },
  },
}
