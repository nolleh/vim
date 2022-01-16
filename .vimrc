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
set expandtab " Expand TABs to spaces

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
  autocmd WinNew * call s:resizeOnWinNew()
augroup END

" vim plugin
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" Code Completion
Plug 'leafgarland/typescript-vim'
Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
" Search
Plug 'junegunn/fzf'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

let g:coc_global_extensions = [ 'coc-tsserver' ]
let g:ackprg = 'ag --vimgrep'

" GoTo code navication.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> gs :sp<CR><Plug>(coc-definition)
nmap <silent> gv :vsp<CR><Plug>(coc-definition)
nmap <silent> gt :vsp<CR><Plug>(coc-definition)<C-W>T

nnoremap <leader>R :vertical resize 230


