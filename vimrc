" Vundle Config
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

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
" =====================================

"NeoBundle Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/amuralid/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('/Users/amuralid/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

set t_Co=256
syntax enable

let g:NERDTreeWinPos = "left"

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

""" Search settings """
set ignorecase " Ignore case by default
set incsearch " Enable incremental search
set hlsearch " highlight searched for phrases


""" Text editing """
set nocompatible	" Use Vim defaults (much better!)
set bs=indent,eol,start		" allow backspacing over everything in insert mode
set history=50
set viminfo='100

""" Visual cues """

""" Color settings """
highlight Normal ctermfg=Black ctermbg=White
highlight Normal ctermfg=White ctermbg=Black
highlight Search ctermfg=Black

""" Indenting settings """
set softtabstop=2
set shiftwidth=2
set nosmartindent " smartindent (filetype indenting instead)
set autoindent
set cindent      
set cinoptions=g0:0 " No indent for public: or case:
set copyindent " but above all -- follow the conventions laid before us
filetype plugin indent on " load filetype plugins and indent settings

""" File type detection """
augroup filetypedetect
    au! BufRead,BufNewFile *.t setfiletype perl
augroup END

augroup Makefile
    au!
    au BufReadPre Makefile set noexpandtab
augroup END

set softtabstop=2 shiftwidth=2 expandtab

colorscheme jellybeans

colo jellybeans "default
autocmd! BufEnter,BufNewFile *.pl,*.pm,*xml,*txt,*log colo wombat
autocmd! BufLeave *.pl,*.pm,*xml,*txt,*log colo wombat

autocmd! BufEnter,BufNewFile *.cpp,*.c,*.h,*.pm,*.pl,*.py,*.cc,*.hpp,*.go  colo jellybeans
autocmd! BufLeave *.cpp,*.c,*.h,*.hpp,*.go colo jellybeans

autocmd! BufEnter,BufNewFile *.d colo d
autocmd! BufLeave *.d colo d

set number
noremap <LeftDrag> <LeftMouse>
noremap! <LeftDrag> <LeftMouse>

:command Nt NERDTree
autocmd vimenter * NERDTree

""" ctrl + w + l and ctrl + w + h to switch """

let g:ycm_global_ycm_extra_conf="/Users/amuralid/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

execute pathogen#infect()
