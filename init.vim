" vim: set filetype=vim:

"plugin manage {{{
if &compatible
  set nocompatible               " Be iMproved
endif
set runtimepath^=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim
call dein#begin(expand('~/.config/nvim/dein'))
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
" code
call dein#add('Shougo/deoplete.nvim')
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('honza/vim-snippets')
"call dein#add('matthewsimo/angular-vim-snippets')

" main config
call dein#add('scrooloose/nerdtree')
call dein#add('scrooloose/nerdcommenter')
call dein#add('majutsushi/tagbar')

" color
call dein#add('vim-airline/vim-airline')
call dein#add('tpope/vim-surround')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('flazz/vim-colorschemes')
call dein#add('powerline/fonts')

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
"let g:python_host_prog = '/usr/bin/python'
"let g:python3_host_prog = '/usr/bin/python3'
"let g:python3_host_prog = '/usr/local/opt/pyenv/shims/python3'
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
set showmatch                   " Show matching brackets/parenthesis
set ignorecase
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

" config end --------------------------------- }}}

" Code config {{{
" C
" python
" scheme lisp }}}
"

" plugin
" deoplede {{{
let g:deoplete#enable_at_startup = 1
"}}}
"
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

" SuperTab like snippets behavior.
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
