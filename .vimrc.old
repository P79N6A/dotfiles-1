" ge4los's vimrc use vundle, as a link file from dotfile/.vimrc
" vim: set ft=vim foldmethod=marker:

" vundle config {{{
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
"let path = '~/.vim/bundle'
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

"brower, view
Plugin 'bling/vim-airline'
Plugin 'tomasr/molokai'
Plugin 'scrooloose/syntastic'
Plugin 'edkolev/tmuxline.vim'
" Plugin 'edkolev/promptline.vim'
"Plugin 'vim-scripts/proc.vim' " for .pc 

"edit, code
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
" Plugin 'vimwiki/vimwiki'
" Plugin 'c.vim'
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
Plugin 'scrooloose/nerdcommenter'
Plugin 'fatih/vim-go'
" Plugin 'tpope/vim-unimpaired'
Plugin 'mattn/emmet-vim'

" other
" Plugin 'mattn/zencoding-vim'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
" Plugin 'rstacruz/sparkup'
Plugin 'DoxygenToolkit.vim'

call vundle#end()            " required
filetype plugin indent on    " required
" }}} 

"get os style
if(has("win32") || has("win95") || has("win64") || has("win16"))
    let g:iswindows=1
else
    let g:iswindows=0
endif

"general config vimrc {{{
let mapleader = ","
let g:mapleader = ","
set runtimepath+=~/.vim " set vimfile path 
map <silent> <leader>ss :source $MYVIMRC<cr>  
map <silent> <leader>ee :e $MYVIMRC<cr> 
autocmd! bufwritepost $MYVIMRC source $MYVIMRC 
" }}}

" cmd statuline
set wildmenu 
set wildignore+=*.o,*.obj,*~,*.pyc
set shortmess=at
set cmdheight=2
set laststatus=2
language messages en_US.utf-8  

" view browse
set scrolloff=4
" set lazyredraw
set showmatch
set matchtime=2
set number
set showmode
set wrap 
set linebreak
" set timeoutlen=4000
set noerrorbells
set novisualbell
set t_vb=
if &term =~ '256color'
    set t_ut= 
endif
set foldmethod=manual
set backspace=eol,start,indent

" color sytax
colorscheme molokai
set background=dark
set t_Co=256
set cursorline
autocmd FileType c,cpp,python set cc=81|hi colorcolumn guibg=black
" au BufRead,BufNewFile *.go set filetype=go
syntax enable


" search config
set ignorecase
set smartcase
set hlsearch
set incsearch
set magic
nnoremap <silent> <C-l> : <C-u>nohlsearch<CR><C-l>

" font encoding gui
set mouse=a
set termencoding=utf-8
set guioptions-=e
set guifont=Dejavu_Sans_Mono_for_Powerline:h11:cANSI  
set encoding=utf-8
set fileencoding=utf-8 
set fileencodings=utf-8,ucs-bom,cp936,gb18030,big5,euc-jp,gbk,gb2312,latin1
set helplang=cn
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" files read
set nobackup
set nowritebackup
set noswapfile
set autoread
set browsedir=buffer " 设定文件浏览器目录为当前目录
set viminfo^=% " TODO 作用不明
set viminfo='100,<50,s10,rA:,rB:

" code indent
set expandtab 
set smarttab 
set shiftwidth=4 
set tabstop=4 
set softtabstop=4 
set cindent 
" set cinoptions=b1
" set cinkeys+=0=break;
set autoindent 
set smartindent 
"set complete +=.,w,b,k
"set dict +=   " dict 
set tags+=./ctags;

" quick hotkey
" Smart way to move between windows
map <leader>bd :Bclose<cr>
" Close all the buffers
map <leader>ba :1,1000 bd!<cr>
" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>
" open file
if has("unix") 
    map ,e :e <C-R>=expand("%:p:h") . "/" <CR> 
else 
    map ,e :e <C-R>=expand("%:p:h") . "\" <CR> 
endif

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif
" => vimgrep searching and cope displaying

" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Open vimgrep and put the cursor in the right position
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

"map <leader>cc :botright cope<cr> " 需要修改 
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg ""
map <leader>n :cn<cr>
map <leader>p :cp<cr>

" quick input
iab idate <c-r>=strftime("%Y-%m-%d")<CR> 
iab itime <c-r>=strftime("%H:%M")<CR>
iab igmail ge4los@gmail.com
iab iname levi

" code & compiler hotkey
map <F5> :call Makeonefile()<CR>
map <F6> :call Runonefile()<CR>
" noremap <A-1> :w<CR>:set ch=5<CR>:make<CR>
" noremap <A-4> :ccl<CR>
function! Makeonefile()
    w
    if &filetype == "c"
        if(g:iswindows == 1)
            set makeprg=gcc\ -Wall\ -g\ -o\ %<.exe\ %
        else 
            set makeprg=gcc\ -Wall\ -g\ -o\ %<\ %
        endif
    elseif &filetype == 'cpp'
        if(g:iswindows == 1)
            set makeprg=g++\ -Wall\ -g\ -std=c++11\ -o\ %<.exe\ %
        else 
            set makeprg=g++\ -Wall\ -g\ -std=c++11\ -o\ %<\ %
        endif
    elseif &filetype == 'java'
            set makeprg=java\ %
    else
        echohl WarningMsg | echo "this filetype can't to make" | echohl None
        return
    endif
    silent! make
    cwindow
    redraw!
    set makeprg=make
endfunction

function! Runonefile()
    if &filetype == 'c' || &filetype == 'cpp'
        if(g:iswindows == 1)
            exec "!./%<.exe"
        else
            exec "!./%<"
    endif
    elseif &filetype == 'go'
        exec "!go run %"
    elseif &filetype == 'java'
        exec "!java %<"
    elseif &filetype == 'sh'
        exec "!sh %"
    elseif &filetype == 'python'
        exec "!python %"
    elseif &filetype == 'lua'
        exec "!lua %"
    else
        echohl WarningMsg | echo "no file can to run" | echohl None
    endif
endfunction

"   解决quickfix 乱码问题,用于windows, 来源于quickfix的帮助章节
" function! QfMakeConv()
" let qflist = getqflist()
" for i in qflist
" let i.text = iconv(i.text, "cp936", "utf-8")
" endfor
" call setqflist(qflist)
" endfunction
" au QuickfixCmdPost make call QfMakeConv()

"cscope config 
if has("cscope") && !has("gui_running")
    set cscopequickfix=s-,c-,d-,i-,t-,e-,g-,f- 
    set cscopetag
    set cscopepathcomp=2
    set nocsverb          
    if filereadable("cscope.out")  
        cs add cscope.out
    endif
    set csverb          
endif

" cscope hotkey
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>   
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>    
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>    
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>    
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>    
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>    
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>	
nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>	
nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>	
nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>	
nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>	
nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>	
nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>

nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>f :vert scscopetag cs find f <C-R>=expand("<cfile>")<CR><CR> 
nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR> 
nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>

"=====================================================================
" plugin
" tagbar
let g:tagbar_sort=0
nmap <F4> :TagbarToggle<CR>
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

" NERD_tree
let NERDTreeWinPos='left'
let NERDTreeSortOrder=['\.vim$', '\.c$', '\.h$', '*', 'foobar']
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC>:NERDTreeToggle<CR>

" NERD_commenter
let NERDSpaceDelims=1       
let NERDCompactSexyComs=1   
" let NERD_c_alt_style=1
let NERD_h_alt_style=1

"ultisnips ,snippet tools
let g:UltiSnipsSnippetDirectories=['UltiSnips']
let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'
let g:UltiSnipsExpandTrigger = '<Tab>'
let g:UltiSnipsListSnippets = '<C-Tab>'
let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'

" DoxygenToolkit  
map <leader>da : DoxAuthor<cr>
map <leader>df : Dox<cr>
map <leader>db : DoxBlock<cr>
map <leader>dl : DoxLic<cr>
let g:DoxygenToolkit_commentType = "C"
let g:DoxygenToolkit_authorName="levi:ge4los@gmail.com"
let g:DoxygenToolkit_licenseTag="My own license\<enter>"
let g:DoxygenToolkit_undocTag="DOXIGEN_SKIP_BLOCK"
let g:DoxygenToolkit_briefTag_pre = "@brief "
let g:DoxygenToolkit_paramTag_pre = "@param "
let g:DoxygenToolkit_returnTag = "@return "
let g:DoxygenToolkit_briefTag_funcName = "yes" " add funcname
" let g:DoxygenToolkit_compactOneLineDoc = "yes"   " one line
let g:DoxygenToolkit_compactDoc = "yes" " delete spaceline
" let g:DoxygenToolkit_blockHeader="---------------------------------------------------------------------------" 
" let g:DoxygenToolkit_blockFooter="---------------------------------------------------------------------------"
" let g:DoxygenToolkit_startCommentTag ="/*********************************************************************//**"
" let g:DoxygenToolkit_endCommentTag =  "*/"
" let g:DoxygenToolkit_ignoreForReturn = "yes"
" let g:DoxygenToolkit_maxFunctionProtoLines = 30

"syntastic 
let g:syntastic_cpp_compiler_options = ' -std=c++11'

" vimwiki
" let g:vimwki_camel_case = 0
" let g:vimwiki_list_ignore_newline = 0

" if (iswindows || has("win32unix")) 
    " let g:vimwiki_list = [{'path': '~/../Dropbox/vimwiki/',
                " \ 'path_html': '~/../Dropbox/vimwiki/html/',
                " \ 'template_path': '~/../Dropbox/vimwiki/template/',
                " \ 'nested_syntaxes' : {'python': 'python', 'c++': 'cpp', 'c': 'c',
                " \ 'sh':'sh', 'make' : 'make'},
                " \ 'template_default': 'template',
                " \ 'template_ext': '.html'}]
" else
    " let g:vimwiki_list = [{'path': '~/data/Dropbox/vimwiki/',
                " \ 'path_html': '~/vimwiki/html/',
                " \ 'template_path': '~/vimwiki/template/',
                " \ 'nested_syntaxes' : {'python': 'python', 'c++': 'cpp', 'c': 'c',
                " \ 'sh':'sh', 'make' : 'make'},
                " \ 'template_default': 'template',
                " \ 'template_ext': '.html'}]
" endif
" \ 'nested_syntaxes' = '{'python': 'python', 'c++': 'cpp', 'c': 'c'}',
" let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'c': 'c'}

" Gist
if has("win32unix")  " cygwin 
    let g:gist_clip_command = 'putclip'
else 
    let g:gist_clip_command = 'xclip -selection clipboard'
end

" airline
let g:airline_theme='molokai'
let g:airline_powerline_fonts = 1 
let g:airline_detect_whitespace          = 0 "关闭空白符检测
let g:airline#extensions#tabline#enabled = 1 "顶部tab栏显示
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif

