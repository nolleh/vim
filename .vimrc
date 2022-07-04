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
set nocompatible
filetype plugin on
set encoding=UTF-8

" vim plugin
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

source $HOME/.vim/plug.vim

" let g:airline_theme='atomic'
let g:airline#extensions#tabline#enabled = 1
" let g:airline_powerline_fonts = 1
let g:tagbar_position = 'rightbelow'

let g:coc_global_extensions = [ 'coc-tsserver', 'coc-svelte' ]
let g:vim_svelte_plugin_use_typescript = 1
let g:ackprg = 'ag --vimgrep'
" let g:prettier#autoformat = 0 
" let g:prettier#config#single_quote = 'true'
" let g:prettier#config#tab_width = 4

" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" let g:mkdp_browserfunc = ''
" let $NVIM_MKDP_LOG_FILE = $HOME . '/tmp/mkdp-log.log'
" let $NVIM_MKDP_LOG_LEVEL = 'debug'

let g:vimwiki_list = [{'path': '~/Documents/workspace_github/vimwiki/private/',
                      \ 'syntax': 'markdown', 'ext': '.md'}, 
                      \ {'path': '~/Documents/workspace_github/vimwiki/public/', 
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" GoTo code navication.
nmap <silent> ggd <Plug>(coc-definition)
nmap <silent> ggy <Plug>(coc-type-definition)
nmap <silent> ggi <Plug>(coc-implementation)
nmap <silent> ggr <Plug>(coc-references)

nmap <silent> ggs :sp<CR><Plug>(coc-definition)
nmap <silent> ggv :vsp<CR><Plug>(coc-definition)
nmap <silent> ggt :vsp<CR><Plug>(coc-definition)<C-W>T

" leader : \
nmap <silent> tt :call OpenTerm()<CR>
nnoremap <leader>R :vertical resize 230<CR>
nnoremap <leader>r :call LexResize()<CR>
nnoremap <leader>FR :call ResizeSplits()<CR>
map <C-l> <C-w>L
map <C-l>R <C-w>L:vertical resize 230<CR>
nnoremap <leader>b :buffers<CR>:buffer<Space>
nnoremap <silent><F9> :NERDTreeToggle<CR><bar>:TagbarToggle <CR>
nmap <C-p> <Plug>MarkdownPreviewToggle
nnoremap <silent> <leader>.z :ZoomToggle<CR> 

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

" Zoom / Restore window.
function! s:ZoomToggle() abort
  if exists('t:zoomed') && t:zoomed
    let t:zoomed = 0
    tabclose
  else
    tabedit %
    let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()

