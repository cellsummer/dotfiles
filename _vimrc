""" Plugins {{{
call plug#begin()
Plug 'jiangmiao/auto-pairs'
Plug 'google/vim-searchindex'
Plug 'junegunn/vim-easy-align'
Plug 'lilydjwg/colorizer'
" Plug 'neoclide/coc.nvim', {'commit': 'ed6a2aaad128c417e4d8e11db1dda282f8edf6df'}
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'npm ci'}
Plug 'rhysd/clever-f.vim'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'eggbean/resize-font.gvim'
Plug 'tommcdo/vim-fubitive'
Plug 'airblade/vim-rooter'
Plug 'voldikss/vim-floaterm'
Plug 'nordtheme/vim'
Plug 'vim/colorschemes'
Plug 'cellsummer/oscura-vim', {'branch': 'feat/vim9'}
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
" Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'sheerun/vim-polyglot'
Plug 'dstein64/vim-win'
Plug 'dhruvasagar/vim-table-mode'
Plug 'cellsummer/vim-colors'
Plug 'monkoose/vim9-stargate'
Plug 'kamil-stachowski/flatwhite-vim'
Plug 'lambdalisue/vim-fern'
Plug 'lambdalisue/vim-fern-hijack'
call plug#end()
"}}}

""" Options {{{
set history=5000
set viminfo='1000,<50,s10,h,rA:,rB:
set noshellslash
set t_Co=256
set clipboard=unnamed
set showcmd
set nornu
set nu
set nocursorline
set so=20
set foldlevel=99
set colorcolumn=88
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
set wildmenu
" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win32") || has("win64")
    set wildignore+=.git\*,.hg\*,.svn\*
    set fileformats=dos
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
    set fileformats=unix
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
" stop vim to auto adjust the window sizes
set noequalalways
" use spaces instead of tab
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
" Add a bit extra margin to the left
set foldcolumn=0
set foldmethod=indent
" Split direction
set splitbelow
set splitright

" Enable filetype plugins
filetype plugin on
filetype indent on
set listchars=tab:>\ ,trail:·,extends:>,precedes:<,nbsp:+,leadmultispace:\|\ \ \ 
" Use syntax completion as default
set omnifunc=syntaxcomplete#Complete
"Enables C-w in the terminal mode
set termwinkey=<C-x>
" Set to auto read when a file is changed from the outside
set autoread
syntax enable
set regexpengine=0
" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
" Use Unix as the standard file type
set nobackup
set nowritebackup
set noswapfile
set smarttab
" Linebreak on 500 characters
set lbr
set tw=500
set autoindent
set smartindent
set wrap


if executable('rg')
    " set grepprg=rg\ -i\ --vimgrep\ --hidden
    " set grepprg=git\ grep\ -n
    set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
endif

let $PATH = "$HOME/scoop/shims" . $PATH
"}}}

""" Autocommand {{{
au FocusGained,BufEnter * silent! checktime
au TabLeave * let g:lasttab = tabpagenr()
" Return to last edit position when opening files (You want this!)
"""""" Fold by header for markdown
let g:markdown_folding = 1
au BufEnter *.md setlocal foldlevel=3
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
au FileType python,sql,vb let b:coc_disabled_sources = ['word']
au FileType python set makeprg=uv\ run\ %
au FileType ps1 set makeprg=pwsh\ %

" Auto-disable expensive features on large files
augroup LargeFile
  autocmd!
  autocmd BufReadPre * if getfsize(expand('%')) > 500000
    \ | setlocal syntax=off foldmethod=manual norelativenumber nocursorline
    \ | endif
augroup END

" Open quickfix list after grep
augroup quickfix
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l* lwindow
    autocmd FileType qf wincmd J
augroup END

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.sql,*.sh,*.md,*.vb :call CleanExtraSpaces()
endif
"}}}

""" UI {{{
" VIM cursor shape
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
" netRW settings
let g:netrw_banner = 1
let g:netrw_liststyle = 3
let g:netrw_winsize = 25
let g:netrw_keepdir = 0

set termguicolors

" Terminal mode colors (predawn colors)
" black/red/green/yellow/blue/purple/cyan/white
let g:terminal_ansi_colors = [
  \'#1F1F28', '#E82424', '#76946A', '#DCA561',
  \'#7FB4CA', '#FF9E3B', '#7E9CD8', '#EDEEED',
  \'#797979', '#FF5D62', '#98BB6C', '#E6C384',
  \'#A3D4D5', '#FFA066', '#9CABCA', '#FEFEFE' ]

set background=dark
colorscheme predawn 
hi! link Terminal Normal
hi! Terminal guibg=#1F1F28" 

if has("gui_running")
    " Use ~x on an English Windows version or ~n for French.
    au GUIEnter * simalt ~x
    " set lines=999 columns=999
    " Render colored unicode in GVIM
    set cursorline
    set renderoptions=type:directx
    set guioptions=
    set t_Co=256
    set guitablabel=%M\ %t
    " set guifont=Cascadia_Code:h10
    " set guifont=Fira_Code_Retina:h10
    " set guifont=TX-02_SemiCondensed:h10:W500:cANSI:qDRAFT
    " set guifont=UbuntuMono_Nerd_Font:h11:W400:cANSI:qDRAFT
    set guifont=Hurmit_Nerd_Font_Mono:h10:W400:cANSI:qDRAFT
    " set guifont=0xProto_Nerd_Font_Mono:h9:W400:cANSI:qDRAFT
    " set guifont=Maple_Mono_NF_Medium:h9:W400:cANSI:qDRAFT
    " set guifont=Iosevka_NFM:h10:cANSI:qDRAFT
    set guifontwide=Maple_Mono_NF_Medium
    highlight Folded guifg=#797979

    let g:Lf_DevIconsFont = "0xProto Nerd Font Mono"
endif

" status bar colors
au InsertEnter * hi statusline guifg=black guibg=#d7afff ctermfg=black ctermbg=magenta
au InsertLeave * hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan
hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan

" Status line
" default: set statusline=%f\ %h%w%m%r\ %=%(%l,%c%V\ %=\ %P%)

" Status Line Custom
let g:currentmode={
    \ 'n'  : 'Normal',
    \ 'no' : 'Normal·Operator Pending',
    \ 'v'  : 'Visual',
    \ 'V'  : 'V·Line',
    \ '^V' : 'V·Block',
    \ 's'  : 'Select',
    \ 'S'  : 'S·Line',
    \ '^S' : 'S·Block',
    \ 'i'  : 'Insert',
    \ 'R'  : 'Replace',
    \ 'Rv' : 'V·Replace',
    \ 'c'  : 'Command',
    \ 'cv' : 'Vim Ex',
    \ 'ce' : 'Ex',
    \ 'r'  : 'Prompt',
    \ 'rm' : 'More',
    \ 'r?' : 'Confirm',
    \ '!'  : 'Shell',
    \ 't'  : 'Terminal'
    \}

set laststatus=2
set noshowmode
set statusline=
set statusline+=%0*\ %n\                                 " Buffer number
set statusline+=%1*\ %<%F%m%r%h%w\                       " File path, modified, readonly, helpfile, preview
set statusline+=%3*│                                     " Separator
set statusline+=%2*\ %Y\                                 " FileType
set statusline+=%3*│                                     " Separator
set statusline+=\ (%{&ff})                               " FileFormat (dos/unix..)
set statusline+=%=                                       " Right Side
set statusline+=%2*\ c:\ %02v\                           " Colomn number
set statusline+=%3*│                                     " Separator
set statusline+=%1*\ r:\ %02l/%L\ (%3p%%)\               " Line number / total lines, percentage of document
set statusline+=%3*│                                     " Separator
set statusline+=%2*\ %{''.(&fenc!=''?&fenc:&enc).''}     " Encoding
set statusline+=%3*│                                     " Separator
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}\  " The current mode

hi User1 ctermfg=007 ctermbg=239 guibg=#4e4e4e guifg=#adadad
hi User2 ctermfg=007 ctermbg=236 guibg=#303030 guifg=#adadad
hi User3 ctermfg=236 ctermbg=236 guibg=#303030 guifg=#303030
hi User4 ctermfg=239 ctermbg=239 guibg=#4e4e4e guifg=#4e4e4e

" Extra highlight for whitespace
" highlight ExtraWhiteSpace ctermbg=red guibg=DarkRed
" match ExtraWhiteSpace /\s\+$/
" }}}

""" Mappings {{{
let mapleader = " "
let maplocalleader = ","
" Don't put c/C into register
nnoremap c "_c
vnoremap c "_c
nnoremap C "_C
vnoremap C "_C
" I don't use x/s
nnoremap x :Bclose<cr>
noremap s <Cmd>call stargate#OKvim(2)<CR>

nnoremap <C-`> <C-6>
nnoremap <silent> <BS> :noh<cr>
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l
nnoremap <C-Down>    :resize -5<CR>
nnoremap <C-Up>  :resize +5<CR>
nnoremap <C-Right>  :vertical resize +5<CR>
nnoremap <C-Left> :vertical resize -5<CR>

" show highlight group
nnoremap <leader>h :call ShowHighlightGroup()<CR>


" Toggle between light and dark
nnoremap <leader>ct :call ToggleColorScheme()<cr>

" Insert current date
nnoremap <F4> "=strftime("%Y-%m-%d")<CR>P
inoremap <F4> <C-R>=strftime("%Y-%m-%d")<CR>
" q to close readonly buffers
nnoremap <expr> q (&readonly ? ':close!<CR>' : 'q')
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>rm mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
" Quickly open a buffer for scribble
nnoremap <leader>n :e ~/buffer<cr>
" toggle spell check
nnoremap <leader>ss :setlocal spell!<cr>
" Toggle paste mode on and off
nnoremap <leader>pp :setlocal paste!<cr>
" Show yank list
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>
" Run make
nnoremap <silent> <space>r  :update<cr>:make<cr>
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

" Windows only - mimic readline c-w in terminal mode
nmap <Leader>x :silent ! start "%:p"<CR>
tnoremap <C-w> <Cmd>call term_sendkeys('', "\<C-w>")<CR>
tnoremap <C-;> <C-\><C-n>
tnoremap <Esc><Esc> <C-\><C-n>:Bclose<cr>:q<cr>
tnoremap <C-j> <C-X>j
tnoremap <C-k> <C-X>k
tnoremap <C-h> <C-X>h

" Toggle window zoom
let t:maximizeCurrentWindow = 0
function! ToggleMaximizeCurrentWindow()
  if t:maximizeCurrentWindow == 0
    :vertical resize "<C-w>\|
    :resize          "<C-w>_
    let t:maximizeCurrentWindow = 1
  else
    :exe "normal \<C-W>="
    let t:maximizeCurrentWindow = 0
  endif
endfunction

nnoremap <C-W>m :<C-u>call ToggleMaximizeCurrentWindow()<CR>

" tnoremap <C-l> <C-X>l
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
vnoremap $) <esc>`>a)<esc>`<i(<esc>
vnoremap $] <esc>`>a]<esc>`<i[<esc>
vnoremap $} <esc>`>a}<esc>`<i{<esc>
vnoremap $" <esc>`>a"<esc>`<i"<esc>
vnoremap $' <esc>`>a'<esc>`<i'<esc>
vnoremap $` <esc>`>a`<esc>`<i`<esc>
cnoremap <C-A>		<Home>
cnoremap <C-E>		<End>
cnoremap <C-K>		<C-U>
cnoremap <C-P>      <Up>
cnoremap <C-N>      <Down>

nnoremap   <silent>   <C-BSlash>   :FloatermToggle<CR>
tnoremap   <silent>   <C-BSlash>   <C-\><C-n>:FloatermToggle<CR>
vnoremap   <silent>   <C-R>        :FloatermSend<CR>
" nnoremap <leader>td :vert term cmd<cr>
" nnoremap <leader>tb :vert term bash<cr>
" tnoremap <leader>tt <c-x>:term pwsh --nologo ++close<cr>
"
" tabs
nnoremap <leader>tk :tabclose<CR>
nnoremap <leader>tn :tabNext<CR>
nnoremap <leader>tp :tabprev<CR>
" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nnoremap <leader>tl :exe "tabn ".g:lasttab<CR>
nnoremap <leader>te :tabedit <C-r>=escape(expand("%:p:h"), " ")<cr>/

" buffers
nnoremap <leader>bd :Bclose<cr>:tabclose<cr>gT
nnoremap <leader>bk :Bclose<cr>:tabclose<cr>gT
nnoremap <leader>ba :bufdo bd<cr>
nnoremap <S-l> :bnext<cr>
nnoremap <S-h> :bprevious<cr>
nnoremap <leader>bn :bnext<cr>
nnoremap <leader>bp :bprevious<cr>

" replace the current word
nnoremap <F2> :%s/<C-r><C-w>//gc<Left><Left><Left>
" vim grep
nnoremap <leader>sw :vim /<C-r><C-w>/gj **/*.
nnoremap <leader>e :Fern . -drawer -reveal=% -toggle<cr>
nnoremap <leader>ef :Fern %:h -drawer -reveal=% -toggle<cr>

" fzf-vim
nnoremap <silent><leader><leader> :<c-u>Files<cr>
nnoremap <silent><leader>ff :<c-u>GFiles<cr>
nnoremap <silent><leader>fg :<c-u>GFiles?<cr>
nnoremap <silent><leader>fb :<c-u>Buffers<cr>
nnoremap <silent><leader>fj :<c-u>Jumps<cr>
nnoremap <silent><leader>fc :<c-u>Changes<cr>
nnoremap <silent><leader>f; :<c-u>History:<cr>
nnoremap <silent><C-p>      :<c-u>Buffers<cr>
nnoremap <silent><leader>ft :<c-u>Colors<cr>
nnoremap <silent><leader>fq :<c-u>FzfQuickfix<cr>
nnoremap <silent><leader>fo :<c-u>History<cr>
nnoremap <silent><leader>so :<c-u>History<cr>
nnoremap <silent><leader>pf :<c-u>PickFont<cr>
nnoremap <silent><leader>sn :<c-u>Files c:/users/wfang/Notes<cr>

nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>

inoremap jk <ESC>
inoremap <C-;> <ESC>

" Commands
command! -nargs=0 T     tabnew
"}}}

""" User functions {{{
" Show the highlight group under cursor
fun! ShowHighlightGroup()
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfun
" Open current file in Windows Explorer
function! FileExplorer(path)
    if a:path == ""
        let p = expand("%:p")
    else
        let p = a:path
    endif

    if executable("chcp")
        let code_page = 'cp' . matchstr(system("chcp"), "\\d\\+")
    else
        " If chcp doesn't work, set its value manually here.
        let code_page = 'cp936'
    endif
    if has('win32') && !has('win32unix') && (&enc!=code_page)
        let p = iconv(p, &enc, code_page)
    endif

    exec ":!start explorer /select, " . p
    " Open Explorer Tree.
    "exec ":!start explorer /e,/select, " . p
endfunction

if has("win32")
    " Open Windows Explorer and Fouse current file.
    "                                      %:p:h     " Just Fold Name.
    nmap <F6> :call FileExplorer("")<cr>
    imap <F6> <C-o><F6>
    command -nargs=0 Explor :call FileExplorer("")
    command -nargs=0 Explorer :call FileExplorer("")
endif
" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

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

" Toggle dark/light themes
function! ToggleColorScheme()
    if exists("g:colors_name") && g:colors_name == "predawn"
        colorscheme flatwhite
    else
        colorscheme predawn
    endif
endfunction

" Generate a section divider comment
" Usage: Type the section title on a line, then press <Leader>d
" Example: Type "Section name" → becomes "# ─── Section name ─────────────...─"
function! SectionDivider()
  let title = trim(getline('.'))
  let prefix = '# ─── '
  let suffix_char = '─'
  let total_width = 79
  let content = prefix . title . ' '
  let fill_len = total_width - strwidth(content)
  let divider = content . repeat(suffix_char, fill_len)
  call setline('.', divider)
endfunction

nnoremap <Leader>d :call SectionDivider()<CR>

" Pick a monospace font for &guifont via fzf
function! s:GuiFontApply(font) abort
    if empty(a:font) | return | endif
    let l:size = matchstr(&guifont, ':h\zs\d\+')
    if empty(l:size) | let l:size = '10' | endif
    " Win32 'guifont' splits on spaces; use underscores (Vim maps them back).
    let &guifont = substitute(a:font, ' ', '_', 'g') . ':h' . l:size
    echo 'guifont = ' . &guifont
endfunction

let s:font_cache     = expand('$SCRIPTS') . '\vim_mono_fonts.txt'

let s:font_cmd_script = expand('$SCRIPTS') . '\vim_mono_fonts.cmd'

function! s:GuiFontRefreshCmd() abort
    return printf('"%s"', s:font_cmd_script)
endfunction

function! s:GuiFontSource() abort
    if !filereadable(s:font_cache)
        call system(s:GuiFontRefreshCmd())
    endif
    return readfile(s:font_cache)
endfunction

command! -bar PickFont call fzf#run(fzf#wrap({
    \ 'source':  s:GuiFontSource(),
    \ 'sink':    function('s:GuiFontApply'),
    \ 'options': ['--prompt', 'Font> ',
    \             '--header', 'F5: refresh font cache',
    \             '--bind',   'f5:reload(' . s:GuiFontRefreshCmd() . ')'],
    \ }))

" Quickfix list picker via fzf
function! s:FzfQfSource() abort
    let l:qf = getqflist()
    let l:lines = []
    for l:i in range(len(l:qf))
        let l:e = l:qf[l:i]
        let l:name = l:e.bufnr > 0 ? bufname(l:e.bufnr) : ''
        call add(l:lines, printf("%d\t%s:%d:%d: %s",
            \ l:i + 1, l:name, l:e.lnum, l:e.col, l:e.text))
    endfor
    return l:lines
endfunction

function! s:FzfQfSink(line) abort
    let l:idx = str2nr(matchstr(a:line, '^\d\+'))
    if l:idx > 0
        execute 'cc' l:idx
    endif
endfunction

command! -bar FzfQuickfix call fzf#run(fzf#wrap({
    \ 'source':  s:FzfQfSource(),
    \ 'sink':    function('s:FzfQfSink'),
    \ 'options': ['--prompt', 'QF> ', '-d', "\t", '--with-nth', '2..'],
    \ }))
    
" :History override - simple v:oldfiles based
function! s:HistoryFiles(bang) abort
    call fzf#run(fzf#wrap('history-files', {
        \ 'source':  v:oldfiles,
        \ 'options': ['-m', '--prompt', 'Hist> '],
        \ }, a:bang))
endfunction

function! s:HistoryDispatch(arg, bang) abort
    if a:arg ==# ':'
        call fzf#vim#command_history(a:bang)
    elseif a:arg ==# '/'
        call fzf#vim#search_history(a:bang)
    else
        call s:HistoryFiles(a:bang)
    endif
endfunction

command! -bang -nargs=* History call <SID>HistoryDispatch(<q-args>, <bang>0)

"}}}

""" LSP - Coc {{{
let g:coc_global_extensions = [
      \'coc-powershell',
      \'coc-yaml',
      \'coc-webview',
      \'coc-markdown-preview-enhanced',
      \'coc-word',
      \'coc-json',
      \'coc-yank', 
      \'coc-pydocstring', 
      \'coc-sql', 
      \'coc-emoji',
      \'coc-prettier',
      \'@yaegassy/coc-ruff', 
      \'@yaegassy/coc-marksman' 
      \]

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <C-n>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><C-p> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
"This expression seems to be responsible for coc formatting on enter
inoremap <silent><expr> <cr> "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"I this just says autocomplete with the first option if pop up menu is open.
"If it is not open, just do a regular tab.
inoremap <silent><expr> <tab> pumvisible() ? coc#pum#confirm() : "\<C-g>u\<tab>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent><nowait> [g <Plug>(coc-diagnostic-prev)
nmap <silent><nowait> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent><nowait> gd <Plug>(coc-definition)
nmap <silent><nowait> gy <Plug>(coc-type-definition)
" nmap <silent><nowait> gi <Plug>(coc-implementation)
nmap <silent><nowait> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>lr <Plug>(coc-rename)

" Formatting selected code
xmap <leader>lf  <Plug>(coc-format-selected)
nmap <leader>lf  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>rs  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>rs  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  " nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  " nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>ca  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>ce  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>cc  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>co  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>cs  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>cj  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>ck  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>cp  :<C-u>CocListResume<CR>
let g:pyindent_open_paren = 0
nnoremap <silent><nowait> <space>mp :<C-u>CocCommand markdown-preview-enhanced.openPreview<cr>
"}}}

""" Plugin Configs {{{
if has("win32") || has("win64")
    let g:floaterm_shell = 'cmd'
endif
" let $FZF_DEFAULT_COMMAND = 'rg --files --follow --hidden --no-ignore-vcs -g "!{.venv/*, .git/*, *cache*/*}"'
let g:fzf_vim= {}
let g:fzf_layout = { 'window': { 'width': 0.7, 'height': 0.7 } }
let g:fzf_vim.buffers_jump = 1
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'query':   ['fg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'Visual', 'CursorLine', 'Normal'],
  \ 'bg+':     ['bg', 'Visual', 'CursorLine', 'Normal'],
  \ 'hl+':     ['fg', 'Keyword'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" LeaderF
let g:Lf_WindowPosition = 'popup'
let g:Lf_ShortcutF = "<leader><leader>"
let g:Lf_CommandMap = {'<C-K>': ['<C-P>'], '<C-J>': ['<C-N>'], '<C-]>': ['<C-V>']}
let g:Lf_ShowDevIcons = 1

let g:colorizer_startup = 0
" Default: Use quickfix list
"let g:fzf_vim.listproc = { list -> fzf#vim#listproc#quickfix(list) }
let g:markdown_fenced_languages = ['html', 'python', 'sh', 'sql', 'powershell=sh']

" Easy align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
"
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

""" floaterm
let g:floaterm_keymap_toggle = '<C-/>'
let g:floaterm_keymap_kill = '<C-q>'
let g:floaterm_opener = 'edit'
let g:floaterm_wintype = 'vsplit'
let g:floaterm_width = 0.5

" vim-fugitive
let g:fubitive_domain_pattern = 'bitbucket\.shared\.ta\.aegon\.io'
" let g:fubitive_domain_context_path = 'bitbucket'
let g:fubitive_default_protocol = 'https://'
"""

" python syntax
let g:python_highlight_all = 1

" table mode
let g:table_mode_corner='|'

"}}}

""" MISC {{{
"Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab
  set stal=2
catch
endtry
"}}}

" modeline {{{
" vim: set foldmarker={{{,}}} foldlevel=99 foldmethod=marker :
