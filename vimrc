set tabstop=8
set softtabstop=0
set shiftwidth=4
set expandtab
set smarttab

set showcmd
set number

" Highlight column 110
set colorcolumn=110
highlight ColorColumn ctermbg=darkgray

filetype plugin indent on

let g:netrw_liststyle=3
let g:netrw_banner=0

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Mappings 
let mapleader=' '

" Insert Mode
inoremap kj <Esc>

" fzf :Files
nnoremap <silent> <leader><leader> :Files<Esc>

" fzf :Files in same directory
nnoremap <silent> <leader>. :Files <C-r>=expand("%:h")<CR>/<CR>

" fzf :Buffers
nnoremap <silent> <Leader>b :Buffers<CR>

" fzf :GFiles?
nnoremap <silent> <Leader>g :GFiles?

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

call plug#begin('~/.vim/plugged')

" Command line fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Autocompletion (installed locally)
Plug '~/.vim/plugged/YouCompleteMe'

call plug#end()
