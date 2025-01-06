syntax enable
filetype plugin indent on

" Set the working directory of the current window to the home directory on Vim startup
autocmd VimEnter * lcd ~

" Enable smart indentation
set smartindent

" Automatically align code
set smarttab

" Set tab and indentation preferences for C
set tabstop=4          " Number of spaces per tab
set shiftwidth=4       " Number of spaces for each indentation level
"set expandtab          " Use spaces instead of tabs

" Ensure line numbers are enabled by default
set number

" Toggle line numbers with num or number
command! Num  :call ToggleLineNumbers()
command! Number :call ToggleLineNumbers()

" Map 'num', 'number' to toggle line numbers
nnoremap <silent> num :call ToggleLineNumbers()<CR>
nnoremap <silent> number :call ToggleLineNumbers()<CR>

function! ToggleLineNumbers()
  if &number
    set nonumber
  else
    set number
  endif
endfunction

" Python-specific indentation settings
autocmd FileType python setlocal expandtab tabstop=4 shiftwidth=4 autoindent smartindent

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Add all Plugins here
call plug#begin()
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-sensible'
Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

" Keeps native background colour
let g:dracula_colorterm = 0 
colorscheme dracula

" Key remaping for coc.vim for C/C++
      "\ coc#refresh()
" inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
" inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Setting mouse works in vim
"set mouse=v
