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

setlocal cursorline
" set noequalalways
" set nocompatible
" filetype plugin on
set encoding=UTF-8

let g:netrw_liststyle = 3 " tree style listing
let g:netrw_banner = 0 " removes the netrw banner
let g:netrw_browse_split = 4 " when browsing windows, using previos window 
let g:netrw_altv = 1 " change from left splitting to right splitting
let g:netrw_winsize = 20 " inital size of new expore windows

" let g:airline_theme='atomic'
let g:airline#extensions#tabline#enabled = 1
" let g:airline_powerline_fonts = 1
let g:tagbar_position = 'rightbelow'
" let g:mkdp_browser = 'Google Chrome'
" let g:mkdp_port='1234'
" let g:mkdp_open_ip = '127.0.0.1'
" function g:open_browser(url) abort
"   " open url here
"   
" endfunction
" 
" let g:mkdp_browserfunc = ''
let $NVIM_MKDP_LOG_FILE = $HOME . '/tmp/mkdp-log.log'
let $NVIM_MKDP_LOG_LEVEL = 'debug'

function! s:resizeOnWinNew()
  if (winnr('$') == 2)
    :vertical resize 230
  endif
endfunction

function! OpenTerm()
  :term
  :resize20
  :wincmd R
  :wincmd k
endfunction

augroup ProjectDrawer
  autocmd!
  " autocmd VimEnter * :Vexplore
  autocmd VimEnter * :NERDTreeToggle
  autocmd VimEnter * :TagbarToggle
  autocmd VimEnter * call LexResize()
  autocmd VimEnter * wincmd l
"  auto VimEnter * call s:openTerm()
"  autocmd WinNew * wincmd L 
"  autocmd WinNew * call s:resizeOnWinNew()
augroup END

augroup ReduceNoise
  autocmd!
  autocmd WinEnter * setlocal cursorline
  autocmd WinEnter * setlocal signcolumn=auto

  autocmd WinLeave * setlocal nocursorline
  autocmd WinLeave * setlocal signcolumn=no
  " Automatically resize active split to 85 width
  " autocmd WinEnter * :call ResizeSplits()
augroup END

function! ResizeSplits()
  set winwidth=150
  wincmd =
endfunction

function! LexResize()
  wincmd t
  :vertical resize45
  :resize 40
  wincmd p
endfunction

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
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/tagbar'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" If you don't have nodejs and yarn
" use pre build, add 'vim-plug' to the filetype list so vim-plug can update this plugin
" see: https://github.com/iamcco/markdown-preview.nvim/issues/50
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" If you have nodejs and yarn
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'airblade/vim-gitgutter'
call plug#end()

let g:coc_global_extensions = [ 'coc-tsserver' ]
let g:ackprg = 'ag --vimgrep'

" GoTo code navication.
nmap <silent> ggd <Plug>(coc-definition)
nmap <silent> ggy <Plug>(coc-type-definition)
nmap <silent> ggi <Plug>(coc-implementation)
nmap <silent> ggr <Plug>(coc-references)

nmap <silent> ggs :sp<CR><Plug>(coc-definition)
nmap <silent> ggv :vsp<CR><Plug>(coc-definition)
nmap <silent> ggt :vsp<CR><Plug>(coc-definition)<C-W>T

" leager : \
nmap <silent> tt :call OpenTerm()<CR>
nnoremap <leader>R :vertical resize 230<CR>
nnoremap <leader>r :call LexResize()<CR>
nnoremap <leader>FR :call ResizeSplits()<CR>
map <C-l> <C-w>L
map <C-l>R <C-w>L:vertical resize 230<CR>
nnoremap <leader>b :buffers<CR>:buffer<Space>
nnoremap <silent><F9> :NERDTreeToggle<CR><bar>:TagbarToggle <CR>
nmap <C-p> <Plug>MarkdownPreviewToggle
