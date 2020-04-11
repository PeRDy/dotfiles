scriptencoding utf-8
source ~/.config/nvim/plugins.vim

if has("unix")
    let s:uname = system("uname")
    let g:python_host_prog='/usr/bin/python2'
    let g:python3_host_prog='/usr/bin/python3'
    if s:uname == "Darwin\n"
        let g:python_host_prog='/usr/bin/python'
        let g:python3_host_prog='/usr/local/bin/python3'
    endif
endif

" ============================================================================ "
" ===                           EDITING OPTIONS                            === "
" ============================================================================ "

" Don't put backups in current dir
set backupdir=~/.local/share/nvim/backup
set backup
set noswapfile

set number

" Use <leader>w to toggle display of whitespace
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

" Filetype associations
autocmd Filetype html setlocal ts=4 sts=4 sw=4
autocmd FileType xml set
autocmd FileType javascript setlocal ts=4 sts=4 sw=4
autocmd FileType python setlocal ts=4 sts=4 sw=4
autocmd FileType css setlocal ts=4 noet sw=4
autocmd bufread *.coffee set ft=coffee
autocmd bufread *.less set ft=less
autocmd bufread *.md set ft=markdown
autocmd BufReadPost *.conf set syntax=dosini
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Mouse
set mouse=a

" Clipboard
if has('unnamedplus')
  set clipboard+=unnamedplus
else
  set clipboard+=unnamed
endif

" Syntax
filetype plugin indent on
syntax on
set encoding=utf-8

" ============================================================================ "
" ===                             KEY MAPPINGS                             === "
" ============================================================================ "

" Leader key
let mapleader=","
let maplocalleader = "-"
nnoremap <Space> <nop>

" Tabs
nnoremap <S-h> gT
nnoremap <S-l> gt

" Window Splits
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Disable arrow movement
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Denite shorcuts "
"   ;         - Browser currently open buffers
"   <leader>t - Browse list of files in current directory
"   <leader>g - Search current directory for occurences of given term and
"   close window if no results
"   <leader>j - Search current directory for occurences of word under cursor
nmap ; :Denite buffer -split=floating -winrow=1<CR>
nmap <leader>t :Denite file/rec -split=floating -winrow=1<CR>
nnoremap <leader>g :<C-u>Denite grep:. -no-empty -mode=normal<CR>
nnoremap <leader>j :<C-u>DeniteCursorWord grep:. -mode=normal<CR>

" Nerdtree shorcuts "
"  <leader>n - Toggle NERDTree on/off
"  <leader>f - Opens current file location in NERDTree
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>

" vim-better-whitespace "
"   <leader>y - Automatically remove trailing whitespace
nmap <leader>y :StripWhitespace<CR>

" Search shorcuts "
"   <leader>h - Find and replace
"   <leader>/ - Claer highlighted search terms while preserving history
map <leader>h :%s///<left><left>
nmap <silent> <leader>/ :nohlsearch<CR>

" Allows you to save files you opened without write permissions via sudo
cmap w!! w !sudo tee %

" Delete current visual selection and dump in black hole buffer before pasting
" Used when you want to paste over something without it getting copied to
" Vim's default buffer
vnoremap <leader>p "_dP

" ============================================================================ "
" ===                                UI                                    === "
" ============================================================================ "

" Colors 
set termguicolors
set background=dark
colorscheme base16-eighties

" Font
if has('gui_running')
  set guifont=Fira\ Code\ 12
endif

" Highlight search
set hlsearch

" Indent guides
let g:indent_guides_default_mapping = 0
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']


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

" ============================================================================ "
" ===                           PLUGIN SETUP                               === "
" ============================================================================ "

"""""""""""
" Airline "
"""""""""""
try
  let g:airline_powerline_fonts = 1
  let g:airline_detect_modified = 1
  let g:airline_theme="base16_eighties"
  let g:airline#extensions#whitespace#enabled=0
  let g:airline#extensions#default#layout = [
    \ [ 'a', 'b', 'c' ],
    \ [ 'x', 'z', 'warning' ]
    \ ]
  let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
  let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
  set laststatus=2
  " Hide the Nerdtree status line to avoid clutter
  let g:NERDTreeStatusline = ''
catch
  echo 'Airline not installed. It should work after running :PlugInstall'
endtry

""""""""""""
" NerdTree "
""""""""""""
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore = ['\.pyc$']
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" Hide certain files and directories from NERDTree
let g:NERDTreeIgnore = ['^\.DS_Store$', '^tags$', '\.git$[[dir]]', '\.idea$[[dir]]', '\.sass-cache$']

""""""""""
" TagBar "
""""""""""
let g:tagbar_type_markdown = {
\ 'ctagstype' : 'markdown',
\ 'kinds' : [
\ 'h:Heading_L1',
\ 'i:Heading_L2',
\ 'k:Heading_L3'
\ ]
\ }

""""""""""
" VimTex "
""""""""""
let g:vimtex_compiler_progname = 'nvr'
" let g:tex_flavor = 'xelatex'
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
let g:vimtex_quickfix_latexlog = {
\ 'overfull' : 0,
\ 'underfull' : 0,
\ 'packages' : {
\   'default' : 0,
\ },
\}

""""""""""
" Denite "
""""""""""
" Use ripgrep for searching current directory for files
" By default, ripgrep will respect rules in .gitignore
"   --files: Print each file that would be searched (but don't search)
"   --glob:  Include or exclues files for searching that match the given glob
"            (aka ignore .git files)
"
call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])

" Use ripgrep in place of "grep"
call denite#custom#var('grep', 'command', ['rg'])

" Custom options for ripgrep
"   --vimgrep:  Show results with every match on it's own line
"   --hidden:   Search hidden directories and files
"   --heading:  Show the file name above clusters of matches from each file
"   --S:        Search case insensitively if the pattern is all lowercase
call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading', '-S'])

" Recommended defaults for ripgrep via Denite docs
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Remove date from buffer list
call denite#custom#var('buffer', 'date_format', '')

" Custom options for Denite
"   auto_resize             - Auto resize the Denite window height automatically.
"   prompt                  - Customize denite prompt
"   direction               - Specify Denite window direction as directly below current pane
"   winminheight            - Specify min height for Denite window
"   highlight_mode_insert   - Specify h1-CursorLine in insert mode
"   prompt_highlight        - Specify color of prompt
"   highlight_matched_char  - Matched characters highlight
"   highlight_matched_range - matched range highlight
try
  let s:denite_options = {'default' : {
  \ 'auto_resize': 1,
  \ 'prompt': 'λ:',
  \ 'direction': 'rightbelow',
  \ 'winminheight': '10',
  \ 'highlight_mode_insert': 'Visual',
  \ 'highlight_mode_normal': 'Visual',
  \ 'prompt_highlight': 'Function',
  \ 'highlight_matched_char': 'Function',
  \ 'highlight_matched_range': 'Normal'
  \ }}
  
  " Loop through denite options and enable them
  function! s:profile(opts) abort
    for l:fname in keys(a:opts)
      for l:dopt in keys(a:opts[l:fname])
        call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
      endfor
    endfor
  endfunction
  
  call s:profile(s:denite_options)
catch
  echo 'Denite not installed. It should work after running :PlugInstall'
endtry

"""""""
" CoC "
"""""""

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format)
nmap <leader>f  <Plug>(coc-format)

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

"""""""""""
" echodoc "
"""""""""""
" Enable echodoc on startup
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'virtual'

"""""""""""
" vim-jsx "
"""""""""""
" Highlight jsx syntax even in non .jsx files
let g:jsx_ext_required = 0

"""""""""""
" Signify "
"""""""""""
let g:signify_sign_delete = '-'

"""""""""""""""""""""
" Auto load at open "
"""""""""""""""""""""
" If only 2 windows left, NERDTree and Tag_List, close vim or current tab
" fun! NoBuffersLeft()
"     if winnr("$") == 2
"         let w1 = bufname(winbufnr(1))
"         let w2 = bufname(winbufnr(2))
"         if exists(":NERDTree")
"             if tabpagenr("$") == 1
"                 exec 'qa'
"             else
"                 exec 'tabclose'
"             endif
"         endif
"     endif
" endfun

" autocmd VimEnter * NERDTree | wincmd w
" autocmd BufWinEnter * NERDTreeMirror | TagbarOpen
" autocmd BufLeave * call NoBuffersLeft()
