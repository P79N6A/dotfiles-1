" vim:
"plugin manage {{{
if &compatible
  set nocompatible               " Be iMproved
endif
" set runtimepath^=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

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
"call dein#add('Shougo/units.vim')
"call dein#add('Shougo/denite.nvim')
call dein#add('junegunn/fzf.vim')
call dein#add('/usr/local/opt/fzf')
call dein#add('editorconfig/editorconfig-vim')

" neovim syntastic lint
"call dein#add('benekastah/neomake')
"call dein#add('neomake/neomake')
call dein#add('w0rp/ale')

"call dein#add('Shougo/neoyank.vim')

" browse
call dein#add('Shougo/neomru.vim') " for unite
"call dein#add('Shougo/unite-outline') " for unite
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('rizzatti/dash.vim')

" complete
call dein#add('Shougo/deoplete.nvim')
if !has('nvim')
  call dein#add('roxma/nvim-yarp')
  call dein#add('roxma/vim-hug-neovim-rpc')
endif
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
"call dein#add('Chiel92/vim-autoformat')
call dein#add('heavenshell/vim-pydocstring')

" go
call dein#add('fatih/vim-go')
call dein#add('sebdah/vim-delve')
call dein#add('zchee/deoplete-go', {'build': 'make'})
call dein#add('uarun/vim-protobuf')

" groovy
"call dein#add('thanethomson/vim-jenkinsfile')
call dein#add('modille/groovy.vim')

" doc
"call dein#add('vimcn/vimcdoc')
"call dein#add('vimcn/NERD_tree.vim.cnx')
"call dein#add('vimcn/NERD_commenter.cnx')
"call dein#add('vimcn/tagbar.cnx')

"call dein#add('Shougo/vimshell', { 'rev': '3787e5' })
call dein#add('Shougo/vimshell.vim')

"other
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
    let g:python_host_prog = '/usr/local/opt/python@2/bin/python2'
    let g:python2_host_prog = '/usr/local/opt/python@2/bin/python2'
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
let g:rehash256 = 1
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme molokai
set termguicolors
set number
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
set autowrite

" formatting
set pastetoggle=<F3>
set splitright
set splitbelow
set nojoinspaces
set ts=4
set shiftwidth=4
set expandtab
"set mouse=a

autocmd FileType c,cpp,python set cc=121|hi colorcolumn guibg=black
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
"autocmd FileType beancount setlocal ts=2 sts=2 sw=2 expandtab
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif"'")"'")"'")
let g:bracketed_paste_mode = 0

" key map & hotkey
let mapleader = ","
nmap <silent> <leader>/ :nohlsearch<CR>
nnoremap <silent> <C-l> : <C-u>nohlsearch<CR><C-l>
" quick cut search
map ,* *<C-O>:%s///gn<CR>``
"nmap Y y$
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
cmap w!! w !sudo tee % > /dev/null
cabbrev h vert h


" programing {{{
" C

" python
map <F5> :w<CR>:!ipython "%"<CR>
"autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr>
"autocmd CompleteDone * pclose " To close preview window of deoplete automagically

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


"deoplete-go
let g:deoplete#sources#go#gocode_binary = '$GOPATH/bin/gocode'

" nerdtree
map <C-e> :NERDTreeToggle<CR>
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>
let NERDTreeShowBookmarks=0
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
"let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0

" neosnippet
" " Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

let g:neosnippet#enable_snipmate_compatibility = 1 "add snipmate snippet
let g:neosnippet#snippets_directory='~/.dotfiles/snippets'

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" tagbar
nnoremap <silent> <leader>tt :TagbarToggle<CR>
let g:tagbar_sort = 0

" rainbow
"let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

" ale
let g:ale_sign_column_always = 1
let g:ale_linters = {
\   'python': ['flake8'],
\}
let g:ale_fixers = {
\   'python': ['yapf', 'isort', 'trim_whitespace'],
\}

let g:ale_fixers = {
\ 'python': ['add_blank_lines_for_python_control_statements','autopep8','isort','yapf','remove_trailing_lines','trim_whitespace'],
\}
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)


" airline
let g:airline_powerline_fonts = 1

" fzf
" TODO: need use fzf in all pattern
let g:fzf_buffers_jump = 1
" map
nnoremap <silent><Leader>b :Buffers<CR>
nnoremap <silent><Leader>fg :Ag<CR>
nnoremap <silent><Leader>h :HelpTags<CR>

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

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
"nmap <silent> <C-i> <Plug>(pydocstring)

"go plugin
"vim-go
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

augroup go
  autocmd!
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

  autocmd FileType go nmap <leader>t  <Plug>(go-test)
  autocmd FileType go nmap <leader>r  <Plug>(go-run)
  autocmd FileType go nmap <leader>gd <Plug>(go-doc)
  autocmd FileType go nmap <leader>gv <Plug>(go-doc-vertical)
  "autocmd FileType go nmap <leader>d  <Plug>(go-def)
    " :GoDef but opens in a vertical split
  autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
  " :GoDef but opens in a horizontal split
  autocmd FileType go nmap <Leader>s <Plug>(go-def-split)

  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

augroup END

