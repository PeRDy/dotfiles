set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/vundle'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
Plugin 'davidhalter/jedi-vim'
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-commentary'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'majutsushi/tagbar'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'altercation/vim-colors-solarized'
Plugin 'stephenmckinney/vim-solarized-powerline'
Plugin 'kien/ctrlp.vim'

" The bundles you install will be listed here

call vundle#end()
filetype plugin indent on

" The rest of your config follows here

""""""""""""""""""
" General config
""""""""""""""""""
set number
" Use <leader>l to toggle display of whitespace
nmap <leader>w :set list!<CR>
" automatically change window's cwd to file's dir
set autochdir
" Spaces instead tabs
set tabstop=4
set shiftwidth=4
set expandtab
" more subtle popup colors 

set background=dark
se t_Co=256
colorscheme solarized
" Mouse
set mouse=a
" Clipboard
set clipboard=unnamed
" Leader key
let mapleader = ","
" Syntax
filetype plugin indent on
syntax on
set encoding=utf-8
" set spell spelllang=en
" Disable arrow movement
noremap ñ l
noremap l k
noremap k j
noremap j h
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" .conf file as .ini syntax
au BufReadPost *.conf set syntax=dosini

"""""""""""""""""""""
" Python file config
"""""""""""""""""""""
augroup vimrc_autocmds
	autocmd!
	" highlight characters past column 120
	autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
	autocmd FileType python match Excess /\%120v.*/
	autocmd FileType python set nowrap
	augroup END

""""""""""""
" Powerline
""""""""""""
set guifont=Inconsolata-g\ for\ Powerline\ 11
set laststatus=2
let g:Powerline_colorscheme='solarized256_dark'

"""""""""""
" NerdTree
"""""""""""
map <leader>n :NERDTreeToggle<CR>

""""""""""""""
" Python-mode
""""""""""""""
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 0
" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'
"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1
" Support virtualenv
let g:pymode_virtualenv = 1
" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'
" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
" Don't autofold code
let g:pymode_folding = 0

"""""""""""""
" VirtualEnv
"""""""""""""
map <leader>v :VirtualEnvActivate

"""""""""
" TagBar
"""""""""
map <leader>l :Tagbar<CR>

""""""""""""""""
" Window Splits
""""""""""""""""
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

""""""""""""""""
" YouCompleteMe
""""""""""""""""
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string

""""""""""""
" Syntastic
""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ["pylint"]
let g:syntastic_python_pylint_post_args="--max-line-length=120"
