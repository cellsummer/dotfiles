lvim.plugins = {
	-- better cut
	{ "tenxsoydev/karen-yank.nvim", config = true },
	-- jump/find plugins
	-- {
	--   "ggandor/leap.nvim",
	--   config = function()
	--     require('leap').add_default_mappings()
	--   Bootend
	-- },
	"tpope/vim-surround", -- notetaking plugins
	-- "renerocksai/telekasten.nvim",
	-- "renerocksai/calendar-vim",
	-- colorscheme
	{ "sainnhe/everforest" }, 
  -- markdown
	"mzlogin/vim-markdown-toc",
	"godlygeek/tabular",
	-- "preservim/vim-markdown"
	-- center-current buffer
	{
		"nvim-neorg/neorg",
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {}, -- Loads default behaviour
					["core.highlights"] = {
						config = {
							highlights = { modifiers = { escape = "+@spell" } },
						},
					},
					["core.keybinds"] = {
						config = { default_keybinds = true, neorg_leader = "," },
					},
					["core.norg.concealer"] = {
						config = { icon_preset = "diamond" },
					}, -- Adds pretty icons to your documents
					["core.norg.dirman"] = { -- Manages Neorg workspaces
						config = {
							workspaces = { notes = "~/Notes" },
							default_workspace = "notes",
						},
					},
					["core.norg.journal"] = {
						config = {
							workspace = "notes",
							journal_folder = "journal",
							strategy = "nested",
						},
					},
					["core.norg.esupports.metagen"] = {
						config = {
							type = "auto",
							template = {
								{ "title", "" },
								{ "description", "" },
								{ "authors", "Wenjing Fang" },
								{ "categories", "notes" },
								{
									"created",
									function()
										return os.date("%Y-%m-%d")
									end,
								},
								{
									"updated",
									function()
										return os.date("%Y-%m-%d")
									end,
								},
								{ "version", "0.1.0" },
							},
						},
					},
					["core.export.markdown"] = { config = { extensions = "all" } },
					["core.export"] = {},
					["core.integrations.telescope"] = {},
					-- ["external.context"] = {},
				},
			})
		end,
		build = ":Neorg sync-parsers",
		dependencies = {
			{ "nvim-neorg/neorg-telescope", "nvim-lua/plenary.nvim" },
			-- { "max397574/neorg-context" },
		},
	},
	{ "nvim-neorg/neorg-telescope" }, -- ChatGpt
	-- {
	-- 	"jackMort/ChatGPT.nvim",
	-- 	config = function()
	-- 		require("chatgpt").setup() -- optional configuration
	-- 	end,
	-- 	dependencies = {
	-- 		"MunifTanjim/nui.nvim",
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-telescope/telescope.nvim",
	-- 	},
	-- }, 

  -- ui
	{
		"folke/noice.nvim",
		config = true,
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim", -- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			-- "rcarriga/nvim-notify"
		},
	},
}
