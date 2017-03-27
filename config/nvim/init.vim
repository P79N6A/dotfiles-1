" vim:
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
call dein#add('tpope/vim-repeat')
call dein#add('mbbill/undotree')

" edit
call dein#add('tpope/vim-surround')
call dein#add('easymotion/vim-easymotion')
call dein#add('tpope/vim-unimpaired')

" color
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('flazz/vim-colorschemes')
call dein#add('luochen1990/rainbow')
"call dein#add('ryanoasis/vim-devicons')
"call dein#add('edkolev/tmuxline.vim')

" programming
call dein#add('scrooloose/nerdcommenter')
call dein#add('tpope/vim-commentary')
call dein#add('tpope/vim-fugitive')
call dein#add('airblade/vim-gitgutter') "show git diff
call dein#add('Shougo/unite.vim')

" neovim syntastic
call dein#add('benekastah/neomake')

"call dein#add('Shougo/neoyank.vim')

" browse
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/unite-outline')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('rizzatti/dash.vim')

" complete
call dein#add('Shougo/deoplete.nvim')
call dein#add('Raimondi/delimitMate')

" snippet
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('honza/vim-snippets')

"call dein#add('matthewsimo/angular-vim-snippets')

" python
call dein#add('zchee/deoplete-jedi')
call dein#add('davidhalter/jedi-vim')
call dein#add('hynek/vim-python-pep8-indent')
call dein#add('pignacio/vim-yapf-format')
call dein#add('heavenshell/vim-pydocstring')
"call dein#add('chase/vim-ansible-yaml')
"call dein#add('drinksober/nvim-yapf-formater')

" go
call dein#add('fatih/vim-go')
call dein#add('zchee/deoplete-go')
call dein#add('uarun/vim-protobuf')

" doc
"call dein#add('vimcn/vimcdoc')
call dein#add('vimcn/NERD_tree.vim.cnx')
call dein#add('vimcn/NERD_commenter.cnx')
call dein#add('vimcn/ctrlp.cnx')
call dein#add('vimcn/tagbar.cnx')

"call dein#add('Shougo/vimshell', { 'rev': '3787e5' })
call dein#add('Shougo/vimshell.vim')

call dein#add('nathangrigg/vim-beancount')

call dein#end()

filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
"End dein Scripts------------------------- }}}
" plugin mange end ---------------------------------

" nvim Config
if has("mac")
    let g:python_host_prog = '/usr/local/bin/python'
    let g:python2_host_prog = '/usr/local/bin/python'
    let g:python3_host_prog = '/usr/local/bin/python3'
else
    let g:python2_host_prog = '/usr/bin/python'
    let g:python3_host_prog = '/usr/bin/python3'
endif
"
" nvim config end ---------------------------------

" General {{{
set visualbell
syntax on
"set helplang=cn
colorscheme molokai
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
set number
"set wrap
"set nospell
set showmatch                   " Show matching brackets/parenthesis
set ignorecase
set smartcase
set scrolloff=3
set scrolljump=3
"set foldenable                  " Auto fold code
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
"set autoread
"set autowrite

" formatting
set pastetoggle=<F3>
set splitright
set splitbelow
set nojoinspaces
set ts=4

autocmd FileType c,cpp,python set cc=121|hi colorcolumn guibg=black
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType beancount setlocal ts=2 sts=2 sw=2 expandtab
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif"'")"'")"'")
let g:bracketed_paste_mode = 0

" key map, hotkey
let mapleader = ","
nmap <silent> <leader>/ :nohlsearch<CR>
nnoremap <silent> <C-l> : <C-u>nohlsearch<CR><C-l>
"nmap Y y$
"map <C-n> :cnext<CR>
"map <C-m> :cprevious<CR>
"nnoremap <leader>a :cclose<CR>
cmap w!! w !sudo tee % > /dev/null
cabbrev h vert h

" programing {{{
" C

" python
map <F5> :w<CR>:!ipython "%"<CR>
"autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr>
"autocmd CompleteDone * pclose " To close preview window of deoplete automagically

" scheme lisp

" programing end }}}


" plugin {{{
" deoplede
let g:deoplete#enable_at_startup = 1

" deoplete-jedi
let g:deoplete#sources#jedi#show_docstring = 0

" vim-jedi disable completion
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
"let NERDTreeShowHidden=1
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

let g:neosnippet#enable_snipmate_compatibility = 1 "add snipmate snippet
let g:neosnippet#snippets_directory='~/dotfile/snippets'

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" tagbar
nnoremap <silent> <leader>tt :TagbarToggle<CR>
let g:tagbar_sort = 0

" rainbow
"let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

"neomake
let g:neomake_open_list = 0 " Disable cursor stealing.
"let g:neomake_verbose = 2
let g:neomake_python_enabled_makers = ['flake8']
"let g:neomake_python_flake8_maker = {
						"\'args': ['--max-line-length=120', '--max-complexity=12'],
						"\ }
let g:neomake_python_flake8_maker = {
						\'args': ['--max-line-length=120', '--max-complexity=12'],
						\ 'errorformat':
						\ '%E%f:%l: could not compile,%-Z%p^,' .
						\ '%A%f:%l:%c: %t%n %m,' .
						\ '%A%f:%l: %t%n %m,' .
						\ '%-G%.%#',
						\ 'postprocess': function('neomake#makers#ft#python#Flake8EntryProcess')
						\ }

nnoremap <Leader>m :Neomake<CR>
"autocmd! BufWritePost,BufReadPost * Neomake

" airline
let g:airline_powerline_fonts = 1
"if !exists('g:airline_powerline_fonts')
	" Use the default set of separators with a few customizations
	"let g:airline_left_sep='›'  " Slightly fancier than '>'
	"let g:airline_right_sep='‹' " Slightly fancier than '<'
"endif


"unite
nnoremap <silent><Leader>b :Unite -silent buffer<CR>
" The prefix key.
nnoremap    [unite]   <Nop>
nmap    <leader>f [unite]

nnoremap <silent> [unite]c  :<C-u>UniteWithCurrentDir
    \ -buffer-name=files buffer bookmark file<CR>
nnoremap <silent> [unite]b  :<C-u>UniteWithBufferDir
    \ -buffer-name=files buffer bookmark file<CR>
nnoremap <silent> [unite]r  :<C-u>Unite
    \ -buffer-name=register register<CR>
nnoremap <silent> [unite]o  :<C-u>Unite outline<CR>
nnoremap <silent> [unite]g  :<C-u>Unite grep:.<CR>
"nnoremap <silent> [unite]f
    "\ :<C-u>Unite -buffer-name=resume resume<CR>
nnoremap <silent> [unite]ma
    \ :<C-u>Unite mapping<CR>
nnoremap <silent> [unite]me
    \ :<C-u>Unite output:message<CR>
nnoremap  [unite]f  :<C-u>Unite source<CR>
nnoremap <silent> [unite]s
    \ :<C-u>Unite -buffer-name=files -no-split
    \ jump_point file_point buffer_tab
    \ file_rec:! file file/new<CR>
nnoremap <silent> [unite]d
        \ :<C-u>Unite -buffer-name=files -default-action=lcd neomru/directory<CR>

if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts =
  \ '-i --vimgrep --hidden --ignore ' .
  \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
endif


" neoyank
"let g:unite_source_history_yank_enable = 1
"nnoremap <space>y :Unite history/yank<cr>

" Start insert.
"call unite#custom#profile('default', 'context', {
"\   'start_insert': 1
"\ })

" Like ctrlp.vim settings.
"call unite#custom#profile('default', 'context', {
"\   'start_insert': 1,
"\   'winheight': 10,
"\   'direction': 'botright',
"\ })

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
" Overwrite settings.

imap <buffer> jj      <Plug>(unite_insert_leave)
"imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)

imap <buffer><expr> j unite#smart_map('j', '')
imap <buffer> <TAB>   <Plug>(unite_select_next_line)
imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)
imap <buffer> '     <Plug>(unite_quick_match_default_action)
nmap <buffer> '     <Plug>(unite_quick_match_default_action)
imap <buffer><expr> x
      \ unite#smart_map('x', "\<Plug>(unite_quick_match_jump)")
nmap <buffer> x     <Plug>(unite_quick_match_jump)
nmap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
imap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
nmap <buffer> <C-j>     <Plug>(unite_toggle_auto_preview)
nmap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
imap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
nnoremap <silent><buffer><expr> l
      \ unite#smart_map('l', unite#do_action('default'))

let unite = unite#get_current_unite()
if unite.profile_name ==# 'search'
nnoremap <silent><buffer><expr> r     unite#do_action('replace')
else
nnoremap <silent><buffer><expr> r     unite#do_action('rename')
endif

nnoremap <silent><buffer><expr> cd     unite#do_action('lcd')
nnoremap <buffer><expr> S      unite#mappings#set_current_sorters(
      \ empty(unite#mappings#get_current_sorters()) ?
      \ ['sorter_reverse'] : [])

" Runs "split" action by <C-s>.
"inoremap <silent><buffer><expr> <C-p>     unite#do_action('split') "c-s use by tmux "
inoremap <silent><buffer><expr> <C-v>     unite#do_action('vsplit')
endfunction"}}}


"gitgutter
let g:gitgutter_enabled=1                    " enable at start
"let g:gitgutter_sign_column_always=0         " disable gutter" when gitgutter disabled
"let g:gitgutter_override_sign_column_highlight = 0
"let g:gitgutter_max_signs=1000               " max signs
"let g:gitgutter_sign_added="\u271a"          " heavy greek cross
"let g:gitgutter_sign_modified="\u279c"       " heavy rounded-tip rightwards arrow
"let g:gitgutter_sign_removed="\u2718"        " heavy ballot X
"let g:gitgutter_sign_modified_removed="►"    " medium right facing triangle
"let g:gitgutter_signs=1                      " enable signs by default
"let g:gitgutter_highlight_lines=0            " enable line highlights
" gitgutter will use Sign Column to set its color, reload it

" python plugin
"" yapf
map <C-y> :YapfFormat<CR>
vmap <C-y> :YapfFormat<CR>
"imap <C-Y> <c-o>:YapfFormat<CR>
"vmap <leader> y :YapfFormat<CR>
"let g:yapf_format_style = "google"

"pydocstring
nmap <silent> <C-m> <Plug>(pydocstring)

"go plugin
"vim-go
au FileType go nmap <leader>gd <Plug>(go-doc)
au FileType go nmap <leader>gv <Plug>(go-doc-vertical)
