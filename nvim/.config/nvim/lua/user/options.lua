local opts = {
	backup = false,
	writebackup = false,
	swapfile = false,
	compatible = false,
	wildmenu = true,
	ignorecase = true,
	smartcase = true,
--	shellslash = true,
	encoding = "utf-8",
	relativenumber = true,
	ts = 4,
	sw = 4,
	expandtab = true,
	hidden = true,
	hlsearch = true,
	mouse = "a",
	nu = true,
	foldmethod = "indent",
	foldlevel = 4,
	inccommand = "split",
	scrolloff = 10,
    cursorline = true,
}

vim.opt.shortmess:append("c")
vim.opt.clipboard:append("unnamedplus")
vim.opt.iskeyword:append("-")

for k, v in pairs(opts) do
	vim.opt[k] = v
end

-- Plugin Options
require("bufferline").setup()
require("nvim-tree").setup({
  git = { enable = true },
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {}
  }

})
require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = 'onedark',
    component_separators = '|',
    section_separators = '',
  },
})

require('nvim_comment').setup()
require('leap').set_default_keymaps()


--vim.cmd([[set iskeyword+=-]])
--vim.cmd([[set clipboard+=unnamedplus]])
--set noeb vb t_vb=
--set backspace=indent,eol,start
--set spellsuggest=best,5
