vim.cmd(
[[
autocmd FileType python nnoremap <buffer> <F5> :update<bar>!python %<CR>
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

]]
)

