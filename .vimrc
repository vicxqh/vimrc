set nu
syntax on
set nospell	" Spell checking off
set showmode                    " Display the current mode
set linespace=0                 " No extra spaces between rows
set hlsearch                    " Highlight search terms
set nowrap                      " Do not wrap long lines
set autoindent                  " Indent at the same level of the previous line
"set shiftwidth=2                " Use indents of 4 spaces
"set expandtab                   " Tabs are spaces, not tabs
"set tabstop=2                   " An indentation every four columns
"set softtabstop=2               " Let backspace delete indent

"set expandtab
" XW: Using Vundle to manage plugin
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Plugins
Plugin 'scrooloose/nerdtree'
Plugin 'flazz/vim-colorschemes'
Plugin 'valloric/youcompleteme'
Plugin 'jiangmiao/auto-pairs'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

colorscheme molokai


" Open/close nerdtree
map <C-e> :NERDTreeToggle<CR>
