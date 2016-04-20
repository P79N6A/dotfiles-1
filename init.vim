" vim: set filetype=vim:

"plugin manage {{{
if &compatible
  set nocompatible               " Be iMproved
endif
set runtimepath^=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim
call dein#begin(expand('~/.config/nvim/dein'))
call dein#add('Shougo/dein.vim')

" general
call dein#add('scrooloose/nerdtree')
call dein#add('majutsushi/tagbar')
call dein#add('easymotion/vim-easymotion')
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-repeat')
call dein#add('luochen1990/rainbow')
" color
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('flazz/vim-colorschemes')
call dein#add('powerline/fonts')


" programming
"call dein#add('scrooloose/syntastic')
call dein#add('scrooloose/nerdcommenter')
call dein#add('tpope/vim-commentary')
call dein#add('tpope/vim-fugitive')
"call dein#add('scrooloose/syntastic') " syntax checking for vim
call dein#add('benekastah/neomake') " neovim syntastic
call dein#add('airblade/vim-gitgutter') "show git diff
call dein#add('Shougo/unite.vim')

" snippet complete
call dein#add('Shougo/deoplete.nvim')
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('honza/vim-snippets')
"call dein#add('matthewsimo/angular-vim-snippets')

" python
call dein#add('zchee/deoplete-jedi')
call dein#add('davidhalter/jedi-vim')

" doc
call dein#add('vimcn/vimcdoc')
call dein#add('vimcn/NERD_tree.vim.cnx')
call dein#add('vimcn/NERD_commenter.cnx')
call dein#add('vimcn/ctrlp.cnx')
call dein#add('vimcn/tagbar.cnx')

" You can specify revision/branch/tag.
call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

call dein#end()
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
"End dein Scripts------------------------- }}}

" plugin mange end ---------------------------------


" nvim Config
"let g:python_host_prog = '/Users/levi/.virtualenvs/neovim2/bin/python'
"let g:python3_host_prog = '/Users/levi/.virtualenvs/neovim3/bin/python'
if has("mac")
    let g:python_host_prog = '/usr/local/bin/python'
    let g:python3_host_prog = '/usr/local/bin/python3'
else
    let g:python_host_prog = '/usr/bin/python'
    let g:python3_host_prog = '/usr/bin/python3'
endif
"
" nvim config end ---------------------------------

" General {{{
set visualbell
syntax on
"set helplang=cn

" UI
colorscheme molokai
set nu
"set wrap
"set nospell
let $LANG = 'en'
set showmatch                   " Show matching brackets/parenthesis
set ignorecase
set smartcase
set scrolloff=3
set scrolljump=3
"set foldenable                  " Auto fold code
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

" formatting
set pastetoggle=<F12>
set splitright
set splitbelow
set nojoinspaces
autocmd FileType c,cpp,python set cc=121|hi colorcolumn guibg=black

" key map
let mapleader = ","
nmap <silent> <leader>/ :nohlsearch<CR>
nnoremap <silent> <C-l> : <C-u>nohlsearch<CR><C-l>

" config end --------------------------------- }}}

" Code config {{{
" C
" python
iab ipdb import ipdb; ipdb.set_trace()
map <F5> :w<CR>:!ipython "%"<CR>


" scheme lisp }}}
"

" plugin
" deoplede {{{
let g:deoplete#enable_at_startup = 1
"}}}
" deoplete-jedi
let g:deoplete#sources#jedi#show_docstring =1

" vim-jedi  disable completion
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "1"
let g:jedi#smart_auto_mappings = 0

" nerdtree
map <C-e> :NERDTreeToggle<CR>
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0

" neosnippet
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
"let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

" tagbar
nnoremap <silent> <leader>tt :TagbarToggle<CR>

" rainbow
"let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

"neomake
"let g:neomake_open_list = 0 " Disable cursor stealing.
"let g:neomake_verbose = 2
let g:neomake_python_enabled_makers = ['pep8', 'flake8']
"let g:neomake_python_enabled_makers = ['pep8']
"let g:neomake_python_pep8_maker = {
  "\ 'args': ['--max-line-length 99'],
  "\ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
  "\ }
"let g:neomake_python_flake8_maker = { 'args': ['--max-line-length=99'], }
nnoremap <Leader>m :Neomake<CR>
let g:neomake_error_sign = {
    \ 'text': 'E>',
    \ 'texthl': 'ErrorMsg',
    \ }
let g:neomake_warning_sign = {
    \ 'text': 'W>',
    \ 'texthl': 'WarningMsg',
    \ }
let g:neomake_informational_sign = {
    \ 'text': 'I>',
    \ 'texthl': 'WarningMsg',
    \ }
"autocmd! BufWritePost,BufReadPost * Neomake

" airline
let g:airline_powerline_fonts = 1
if !exists('g:airline_powerline_fonts')
    " Use the default set of separators with a few customizations
    let g:airline_left_sep='›'  " Slightly fancier than '>'
    let g:airline_right_sep='‹' " Slightly fancier than '<'
endif
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

"gitgitter
"let g:gitgutter_sign_column_always=0         " disable gutter" when gitgutter disabled
"let g:gitgutter_enabled=1                    " enable at start
"let g:gitgutter_max_signs=1000               " max signs
"let g:gitgutter_sign_added="\u271a"          " heavy greek cross
"let g:gitgutter_sign_modified="\u279c"       " heavy rounded-tip rightwards arrow
"let g:gitgutter_sign_removed="\u2718"        " heavy ballot X
"let g:gitgutter_sign_modified_removed="►"    " medium right facing triangle
"let g:gitgutter_signs=1                      " enable signs by default
"let g:gitgutter_highlight_lines=0            " enable line highlights
" gitgutter will use Sign Column to set its color, reload it
