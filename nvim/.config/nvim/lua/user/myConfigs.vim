
" autocmd
" python
autocmd FileType python nnoremap <buffer> <F5> :update<bar>!python %<CR>
autocmd FileType python nnoremap <buffer> <F6> :update<bar>!black -q %<CR>

" Golang
autocmd FileType go nnoremap <buffer> <F5> :update<bar>!go run %<CR>

autocmd BufNewFile,BufRead *.vb set ft=vbnet
"stop auto commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Plugin Config
colorscheme tokyonight-night
"colorscheme dracula
" commenter
let g:airline#extensions#tabline#enabled      = 1
let g:NERDCreateDefaultMappings = 0
map <silent>  <plug>NERDCommenterToggle
" Airline
let g:airline#extensions#tabline#left_sep     = ' '
let g:airline_theme='ayu_mirage'
let g:airline#extensions#tabline#left_alt_sep = '|'
" nerdTree
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
"vimwiki
filetype plugin on
syntax on
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_markdown_link_ext=1
autocmd BufNewFile,BufRead *.md setlocal spell spelllang=en
autocmd bufenter *.md noremap <silent> <f5> :! firefox %<cr>
augroup clear_trailing
    autocmd BufWritePre * if &ft != "vimwiki" | %s/\s\+$//e
    autocmd BufWritePre * if &ft != "vimwiki" | %s/\n\+\%$//e
    autocmd BufwritePre * noh
augroup END

let g:vimwiki_folding='custom'

function! VimwikiFoldLevelCustom(lnum)
    let pounds = strlen(matchstr(getline(a:lnum), '^#\+'))
    if (pounds)
        return '>' . pounds  " start a fold level
    endif
    if getline(a:lnum) =~? '\v^\s*$'
        if (strlen(matchstr(getline(a:lnum + 1), '^#\+')))
        return '-1' " don't fold last blank line before header
      endif
    endif
    return '=' " return previous fold level
endfunction

augroup VimrcAuGroup
  autocmd!
  autocmd FileType vimwiki setlocal foldmethod=expr |
    \ setlocal foldenable | set foldexpr=VimwikiFoldLevelCustom(v:lnum) |
    \ setlocal foldlevel=3 | setlocal scrolloff=-1
augroup END

let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"
"colorscheme
let ayucolor='mirage'
"Startify
let g:startify_session_dir = '~/AppData/Local/nvim/session'
let g:startify_change_to_vcs_root = 1
"Automatically Update Sessions
let g:startify_session_persistence = 1
"Get rid of empy buffer and quit
let g:startify_enable_special = 0
"Let Startify take care of buffers
let g:startify_session_delete_buffers = 1
"Menu
let g:startify_lists = [
      \ { 'type': 'files',     'header': ['   Files']            },
      \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ ]
" Bookmarks
let g:startify_bookmarks = [
        \ { 'i': '~/AppData/Local/nvim/init.lua' },
        \ { 'r': '~/Documents/Github' },
        \ { 'w': '~/vimwiki' },
        \ { 'b': '~/vimwiki/Blog/vuepress-deploy/blog/views' },
        \ ]
