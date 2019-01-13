" this is written in a language called VimL, or vimscript. It defines vim customization.

"========================== Plugins ==============================

" If vim-plug is not installed, do so!
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'scrooloose/nerdtree'
"Plug 'morhetz/gruvbox'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'powerline/powerline'

call plug#end()

"========================= Colors ===============================

" the following forces vim to use pywal colorscheme
let g:gruvbox_termcolors=16

set background=dark
"set background=light

"colorscheme gruvbox

"======================== Customization ========================

filetype on
syntax enable

set wildmenu		" bash-like auto-completion
set wildmode=list:longest

set autoindent		" self-explanatory
set showcmd		" shows what you're typing as a command
set number		" show line numbers
set laststatus=2	" always display statusline in all windows
set showtabline=2	" always display tabline
set clipboard=unnamed	" sets clipboard to system-wide
"set paste		" not sure, see :help paste
"set noshowmode		" hide default mode text (eg, -- INSERT -- below statusline)

"==================== Keyboard Mapping ==========================

" stop using those darn arrow keys, no matter the mode!
"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>

"==================== Autostart ================================

"autocmd vimenter * NERDTree	" NERDTree
