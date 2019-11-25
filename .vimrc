" Syntax Highlighting
if has("syntax")
    syntax on
endif

set autoindent
set cindent

set nu

colorscheme jellybeans

set ts=4 " Tab 너비
set shiftwidth=4 " 자동 인덴트할 때 너비

set laststatus=2 " 상태바 표시를 항상한다
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\

set autoread " 작업 중인 파일 외부에서 변경됬을 경우 자동으로 불러옴

" set nocompatible
" filetype plugin on

let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore
augroup END
