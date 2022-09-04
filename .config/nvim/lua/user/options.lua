local opts = {
	backup = false,
	writebackup = false,
	swapfile = false,
	compatible = false,
	wildmenu = true,
	ignorecase = true,
	smartcase = true,
	-- shellslash = true,
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
	scrolloff = 999,
    cursorline = true
}

vim.opt.shortmess:append("c")

for k, v in pairs(opts) do
	vim.opt[k] = v
end

vim.cmd([[set iskeyword+=-]])
vim.cmd([[set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe]])

-- colorscheme
vim.g.catppuccin_flavour = 'macchiato'
vim.cmd [[
filetype plugin on
syntax on
try
    colorscheme catppuccin
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
endtry
]]
-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Plugin globals
vim.g.tagbar_ctags_bin = 'C:\\Users\\cells\\scoop\\apps\\ctags\\ctags.exe'

--set noeb vb t_vb=
--set backspace=indent,eol,start
--set spellsuggest=best,5
