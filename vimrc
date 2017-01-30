set nocompatible
filetype off

syntax on

if has('nvim')
    let s:editor_root=expand("~/.config/nvim")
else
    let s:editor_root=expand("~/.vim")
endif
if has("unix")
    let s:uname = system("uname")
    let g:python_host_prog='/usr/bin/python2'
    let g:python3_host_prog='/usr/bin/python3'
    if s:uname == "Darwin\n"
        let g:python_host_prog='/usr/bin/python2'
        let g:python3_host_prog='/usr/bin/python3'
    endif
endif

" Setting up Vundle - the vim plugin bundler
let vundle_installed=1
let vundle_readme=s:editor_root . '/bundle/vundle/README.md'
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    " silent execute "! mkdir -p ~/." . s:editor_path_name . "/bundle"
    silent call mkdir(s:editor_root . '/bundle', "p")
    silent execute "!git clone https://github.com/gmarik/vundle " . s:editor_root . "/bundle/vundle"
    let vundle_installed=0
endif
let &rtp = &rtp . ',' . s:editor_root . '/bundle/vundle/'
call vundle#rc(s:editor_root . '/bundle')

Plugin 'gmarik/vundle'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'hdima/python-syntax'
Plugin 'davidhalter/jedi-vim'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'scrooloose/syntastic'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'vim-ctrlspace/vim-ctrlspace'
Plugin 'chriskempson/base16-vim'
Plugin 'lervag/vimtex'
Plugin 'Shougo/neocomplete'

if vundle_installed == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :PluginInstall
endif
" Setting up Vundle - the vim plugin bundler end

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
" Automatically change window's cwd to file's dir
set autochdir
" Spaces instead tabs
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set cursorline
set showcmd
set hidden
set backspace=2
autocmd Filetype html setlocal ts=4 sts=4 sw=4 omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType javascript setlocal ts=4 sts=4 sw=4
autocmd FileType python setlocal ts=4 sts=4 sw=4
autocmd FileType css setlocal ts=4 noet sw=4 omnifunc=csscomplete#CompleteCSS
autocmd bufread *.coffee set ft=coffee
autocmd bufread *.less set ft=less
autocmd bufread *.md set ft=markdown
" Colors 
set term=screen-256color
set t_Co=256
set background=dark
colorscheme base16-eighties
let base16colorspace=256
if filereadable(expand("~/.vimrc_background"))
  source ~/.vimrc_background
endif
" Font
if has('gui_running')
  set guifont=Fira_Code:h12
endif
" Mouse
set mouse=a
" Clipboard
if has('unnamedplus')
  set clipboard+=unnamedplus
else
  set clipboard+=unnamed
endif
" Leader key
let mapleader=","
let maplocalleader = "-"
" Syntax
filetype plugin indent on
syntax on
set encoding=utf-8
" Highlight search
set hlsearch
" set spell spelllang=en
" Disable arrow movement
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
" Syntastic
""""""""""""
let g:syntastic_check_on_open = 1

let g:syntastic_python_checkers = ['prospector']
let g:syntastic_python_pylint_post_args="--max-line-length=120"
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_error_symbol = ''
let g:syntastic_style_warning_symbol = '⯑'

""""""""""
" Airline
""""""""""
let g:airline_powerline_fonts = 1
let g:airline_detect_modified = 1
let g:airline_theme="base16_eighties"
" Required for CtrlSpace integration
let g:airline_exclude_preview = 1
" End CtrlSpace integration
let g:airline#extensions#whitespace#enabled=0
let g:airline#extensions#default#layout = [
    \ [ 'a', 'b', 'c' ],
    \ [ 'x', 'z', 'warning' ]
    \ ]

"""""""""""
" NerdTree
"""""""""""
map <leader>t :NERDTreeToggle<CR>
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore = ['\.pyc$']

""""""""""""""""
" Python-syntax
""""""""""""""""
let python_highlight_all = 1

"""""""""""""
" VirtualEnv
"""""""""""""
map <leader>v :VirtualEnvActivate

"""""""""
" TagBar
"""""""""
map <leader>t :Tagbar<CR>

""""""""""""""""
" Window Splits
""""""""""""""""
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

"""""""
" Jedi
"""""""
let g:jedi#completions_command = "<C-Space>"
let g:jedi#auto_close_doc = 1

""""""""""""""""
" YouCompleteMe
""""""""""""""""
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string
let g:ycm_server_python_interpreter = '/usr/bin/python2'

""""""""""""""""
" NeoComplete
""""""""""""""""
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.tex =
\ '\v\\%('
\ . '\a*cite\a*%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
\ . '|\a*ref%(\s*\{[^}]*|range\s*\{[^,}]*%(}\{)?)'
\ . '|hyperref\s*\[[^]]*'
\ . '|includegraphics\*?%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
\ . '|%(include%(only)?|input)\s*\{[^}]*'
\ . '|\a*(gls|Gls|GLS)(pl)?\a*%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
\ . '|includepdf%(\s*\[[^]]*\])?\s*\{[^}]*'
\ . '|includestandalone%(\s*\[[^]]*\])?\s*\{[^}]*'
\ . ')'

"""""""""
" VimTex
"""""""""
let g:tex_flavor = 'latex'
let g:vimtex_syntax_minted = [
\ {
\   'lang' : 'c'
\ },
\ {
\   'lang' : 'cpp',
\   'environments' : ['cppcode', 'cppcode_test']
\ },
\ {
\   'lang' : 'csharp',
\   'syntax' : 'cs'
\ },
\ {
\   'lang' : 'python',
\   'ignore' : [
\     'pythonEscape',
\     'pythonBEscape'
\     ]
\ }
\]
let g:vimtex_complete_close_braces = 1
