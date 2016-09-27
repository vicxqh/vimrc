set nu
syntax on
set nospell                     " Spell checking off
set showmode                    " Display the current mode
set linespace=0                 " No extra spaces between rows
set hlsearch                    " Highlight search terms
"set nowrap                      " Do not wrap long lines
set autoindent                  " Indent at the same level of the previous line
set shiftwidth=3                " Use indents of 3 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=3                   " An indentation every four columns
set softtabstop=3               " Let backspace delete indent
set ignorecase                  " Search in case insensitive mode"

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
Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-airline/vim-airline'
Plugin 'majutsushi/tagbar'
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

" For airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
set t_Co=256
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'

" Open/close nerdtree
map <C-e> :NERDTreeToggle<CR>
" Open/close Tagbarr
map <C-t> :TagbarToggle<CR>

" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
"autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" This tests to see if vim was configured with the '--enable-cscope' option
" when it was compiled.  If it wasn't, time to recompile vim...
if has("cscope")

    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0
    
    " add any cscope database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    " else add the database pointed to by environment variable
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif

    " show msg when any other cscope db added
    set cscopeverbose


    """"""""""""" My cscope/vim key mappings
    "
    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the f"unction name under cursor
     "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
    "

    nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>  
    nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>  
    nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>  
    nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>  
    nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>  
    nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>  
    nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>   
    nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>  

    set cscopequickfix=s-,c-,d-,i-,t-,e-,a-
    nmap <C-n> :cnext<CR>
    nmap <C-p> :cprev<CR> 
endif
