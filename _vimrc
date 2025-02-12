"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"       Amir Salihefendic - @amix3k
"
" Awesome_version: "       Get this config, nice color schemes and lots of plugins!
"
"       Install the awesome version from:
"
"           https://github.com/amix/vimrc
"
" Sections:
"    -> General
"    -> VIM user interface
"    -> netRW Settings
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""" Plugins """""
call plug#begin()
Plug 'lilydjwg/colorizer'
Plug 'sainnhe/gruvbox-material'
Plug 'rhysd/clever-f.vim'
Plug 'rhysd/vim-color-spring-night'

"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'
call plug#end()

" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500
set noshellslash

" VIM cursor shape
let &t_SI = "\e[4 q"
let &t_EI = "\e[2 q"

" Enable filetype plugins
filetype plugin on
filetype indent on

set omnifunc=syntaxcomplete#Complete
" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * silent! checktime

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = " "
let maplocalleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" I don't use x/s
nmap x :Bclose<cr>:tabclose<cr>gT
nmap s <Nop>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Addtional options
set showcmd
set rnu
set nu
"set cursorline

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set nolazyredraw

" For regular expressions turn magic on
set nomagic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" remove dash (-) from keyword
set iskeyword-=-

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

" Add a bit extra margin to the left
set foldcolumn=1

" Split direction
set splitbelow
set splitright

" windows only
" set sh=pwsh.exe


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => netRW settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_winsize = 25

nnoremap <leader>e <cmd>:Lex<cr>
nnoremap <leader>E <cmd>:E<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Set regular expression engine automatically
set regexpengine=0

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

" Jellybean color overrides
set termguicolors
let g:jellybeans_overrides = {
\    'background': { 'guibg': 'B282828'},
\}
" if has('termguicolors') && &termguicolors
"     let g:jellybeans_overrides['background']['guibg'] = 'none'
" endif
"
" Set contrast.
" This configuration option should be placed before `colorscheme gruvbox-material`.
" Available values: 'hard', 'medium'(default), 'soft'
let g:gruvbox_material_background = 'medium'

" For better performance
let g:gruvbox_material_better_performance = 1

colorscheme spring-night

" Terminal mode colors
let g:terminal_ansi_colors = [
  \'#282828', '#CC241D', '#98971A', '#D79921',
  \'#458588', '#B16286', '#689D6A', '#D65D0E',
  \'#fb4934', '#b8bb26', '#fabd2f', '#83a598',
  \'#d3869b', '#8ec07c', '#fe8019', '#FBF1C7' ]

highlight Terminal guibg='#282828'
highlight Terminal guifg='#ebdbb2'

set background=dark
highlight Visual guifg=Black guibg=LightBlue
" highlight SpellBad guifg=White guibg=DarkRed
" highlight Search guifg=White guibg=DarkRed
" highlight Visual guifg=White guibg=DarkRed
" highlight Search guifg=White guibg=DarkBlue

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
    set guifont=Cascadia_Mono:h10
endif


" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set fileformats=dos


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap $) <esc>`>a)<esc>`<i(<esc>
vnoremap $] <esc>`>a]<esc>`<i[<esc>
vnoremap $} <esc>`>a}<esc>`<i{<esc>
vnoremap $" <esc>`>a"<esc>`<i"<esc>
vnoremap $' <esc>`>a'<esc>`<i'<esc>
vnoremap $` <esc>`>a`<esc>`<i`<esc>
""""""""""""""""""""""""""""""
" => Command mode related
""""""""""""""""""""""""""""""
cnoremap <C-A>		<Home>
cnoremap <C-E>		<End>
cnoremap <C-K>		<C-U>
cnoremap <C-P>      <Up>
cnoremap <C-N>      <Down>

""""""""""""""""""""""""""""""
" => Command mode related
""""""""""""""""""""""""""""""
tnoremap <Esc><Esc> <C-\><C-n>:Bclose<cr>:q<cr>
tnoremap <Esc> <C-\><C-n>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => terminal mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>t :term pwsh --nologo<cr>
nnoremap <leader>c :term cmd<cr>
nnoremap <leader>b :term bash<cr>
tnoremap <leader>t <c-w>:term pwsh --nologo ++close<cr>

" import autoload 'zeef.vim'

" zeef
nnoremap <leader>so :call zeef#Args(v:oldfiles)<cr>
nnoremap <leader>sb :call zeef#BufferSwitcher()<cr>
nnoremap <leader>sf :call zeef#Files()<cr>
nnoremap <leader>su :call zeef#Files("c:/users/wfang/bin/")<cr>
nnoremap <leader>sc :call zeef#ColorSchemeSwitcher()<cr>


" Disable highlight when <leader><cr> is pressed
map <silent> <BS> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>
map <C-p> :bu<space>

map <S-l> :bnext<cr>
map <S-h> :bprevious<cr>

" replace the current word under cursor
nnoremap <C-S-F2> :%s/<C-r><C-w>//g<Left><Left>
nnoremap <F2> :%s/<C-r><C-w>//gc<Left><Left><Left>

" map escape
inoremap jk <ESC>

" map C-x C-o
inoremap <c-space> <c-x><c-o>

""""insert today's date""""
inoremap <F4> <C-r>=strftime('%F')<CR>

" Useful mappings for managing tabs
" map <leader>tn :tabnew<cr>
" map <leader>to :tabonly<cr>
" map <leader>tc :tabclose<cr>
" map <leader>tm :tabmove
" map <leader>t<leader> :tabnext<cr>

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=escape(expand("%:p:h"), " ")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry


" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" autocmd BufRead,BufNewFile *.vb setlocal filetype=vbnet


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" browse oldfiles
" nmap <leader>so :bro ol<cr>
"
" q to close readonly buffers
nnoremap <expr> q (&readonly ? ':close!<CR>' : 'q')

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
" map <leader>sn ]s
" map <leader>sp [s
" map <leader>sa zg
" map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Paste from clipboard
set clipboard=unnamed

""""""""
highlight ExtraWhiteSpace ctermbg=red guibg=red
match ExtraWhiteSpace /\s\+$/
autocmd BufWritePre * %s/\s\+$//e
""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

""""""Plugin configurations"""""
"let g:fzf_vim= {}
"let g:fzf_vim.preview_window = []
"" Default: Use quickfix list
"let g:fzf_vim.listproc = { list -> fzf#vim#listproc#quickfix(list) }
let g:markdown_fenced_languages = ['html', 'python', 'sh', 'sql', 'powershell=sh']
