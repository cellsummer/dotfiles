vim.cmd(

[[
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
]]

)
