if empty(glob('~/.vim/autoload/plug.vim'))
nnoremap <C-t> :tabnew<Space>
inoremap <C-t> <Esc>:tabnew<Space>
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'hdima/python-syntax'
Plug 'w0rp/ale'
Plug 'Chiel92/vim-autoformat'
Plug 'Valloric/YouCompleteMe', { 'do': 'python3 install.py --clang-completer --tern-completer' }
Plug 'scrooloose/nerdcommenter'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'fisadev/vim-isort'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jmcantrell/vim-virtualenv'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'chriskempson/base16-vim'
Plug 'lervag/vimtex'

call plug#end()

if has("unix")
    let s:uname = system("uname")
    let g:python_host_prog='/usr/bin/python2'
    let g:python3_host_prog='/usr/bin/python3'
    if s:uname == "Darwin\n"
        let g:python_host_prog='/usr/bin/python2'
        let g:python3_host_prog='/usr/bin/python3'
    endif
endif

""""""""""""""""""
" General config
""""""""""""""""""
set number
" Use <leader>w to toggle display of whitespace
nmap <leader>W :set list!<CR>
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
  set guifont=Fira\ Code\ 12
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
let mapleader="\<Space>"
let maplocalleader = "-"
nnoremap <Space> <nop>
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
let g:ale_python_pylint_options="--max-line-length=120"
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'

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
set laststatus=2

"""""""""""
" NerdTree
"""""""""""
map <leader>N :NERDTreeToggle<CR>
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore = ['\.pyc$']

""""""""""""""""
" Python-syntax
""""""""""""""""
let python_highlight_all = 1

"""""""""""""
" VirtualEnv
"""""""""""""
map <leader>V :VirtualEnvActivate

"""""""""
" TagBar
"""""""""
map <leader>T :Tagbar<CR>

"""""""
" Tabs
"""""""
nnoremap <S-h> gT
nnoremap <S-l> gt

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
let g:ycm_server_python_interpreter = '/usr/bin/python3'
let g:ycm_python_binary_path = 'python3.6'
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_goto_buffer_command = 'new-or-existing-tab'
let g:ycm_autoclose_preview_window_after_completion = 1
nnoremap <silent> <leader>j :YcmCompleter GoToDefinitionElseDeclaration<CR>

""""""
" FZF
""""""
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>w :Windows<CR>
nnoremap <silent> <leader>t :Tags<CR>
nnoremap <silent> <leader>h :History<CR>
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--all --graph --pretty=format:"%C(yellow)%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --date=relative'
" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'
" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

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

""""""""""""""""
" Indent guides
""""""""""""""""
let g:indent_guides_default_mapping = 0
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'python']

""""""""""""""""
" Indent guides
""""""""""""""""
let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
let g:CtrlSpaceSaveWorkspaceOnExit = 1

""""""""""""""""""""
" Auto load at open
""""""""""""""""""""
au VimEnter * wincmd w
au BufWinEnter * NERDTree
au BufEnter * nested :call tagbar#autoopen(0)
au BufWinEnter * wincmd w
au BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
