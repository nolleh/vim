" Syntax Highlighting
if has("syntax")
    syntax on
endif

set autoindent
set cindent

set nu

colorscheme jellybeans

set ts=2 " Tab width
set shiftwidth=2 " indentations width when automatically occurred

set laststatus=2 " show status bar
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\

set autoread " if file was modifed from extetern, read automatically

set re=0 " Use new regular expression engine

" set nocompatible
" filetype plugin on

let g:netrw_liststyle = 3 " tree style listing
let g:netrw_banner = 0 " removes the netrw banner
let g:netrw_browse_split = 4 " when browsing windows, using previos window 
let g:netrw_altv = 1 " change from left splitting to right splitting
let g:netrw_winsize = 20 " inital size of new expore windows

function! s:resizeOnWinNew()
	if (winnr('$') == 2)
		:vertical resize 230
	endif
endfunction

augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore
  autocmd WinNew * wincmd L 
	" autocmd WinNew * :vertical resize 230
  autocmd WinNew * call s:resizeOnWinNew()
augroup END


