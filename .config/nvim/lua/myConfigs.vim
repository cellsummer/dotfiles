" Plugin Config
" colorscheme dracula
" database save location
let g:db_ui_save_location = '~/db_ui'
" ctags
" let g:tagbar_ctags_bin = 'C:\Users\cells\scoop\apps\ctags\ctags.exe'
"vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_list = [{
	\ 'path': '~/vimwiki',
	\ 'template_path': '~/vimwiki/templates/',
	\ 'template_default': 'default',
	\ 'syntax': 'markdown',
	\ 'ext': '.md',
	\ 'path_html': '~/vimwiki/site_html/',
	\ 'custom_wiki2html': 'vimwiki_markdown',
	\ 'auto_tags': 1,
	\ 'template_ext': '.tpl'}]
let g:vimwiki_markdown_link_ext=1
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


" let g:ultisnipsjumpforwardtrigger="<c-n>"
" let g:UltiSnipsJumpBackwardTrigger="<c-p>"

" autocmd

autocmd FileType python nnoremap <buffer> <F5> :update<bar>!python %<CR>
autocmd FileType python setlocal foldmethod=expr | set foldexpr=nvim_treesitter#foldexpr()
autocmd BufNewFile,BufRead *.vb set ft=vbnet
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd VimLeave * call nvim_cursor_set_shape("vertical-bar")
autocmd BufNewFile,BufRead *.md setlocal spell spelllang=en scrolloff=10
autocmd bufenter *.md noremap <silent> <f5> :! start msedge "%:p"<cr>
augroup clear_trailing
    autocmd BufWritePre * if &ft != "vimwiki" | %s/\s\+$//e
    autocmd BufWritePre * if &ft != "vimwiki" | %s/\n\+\%$//e
    autocmd BufwritePre * noh
augroup END

augroup VimrcAuGroup
  autocmd!
  autocmd FileType vimwiki setlocal foldmethod=expr |
    \ setlocal foldenable | set foldexpr=VimwikiFoldLevelCustom(v:lnum) |
    \ setlocal foldlevel=3
augroup END

" MarkdownPreview
" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1
let g:mkdp_browser = 'C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe'
" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown', 'vimwiki']
" set default theme (dark or light)
let g:mkdp_theme = 'light'
