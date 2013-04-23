" vim:foldmethod=marker
syntax enable
filetype indent plugin on
set ofu=syntaxcomplete#Complete
set backspace=indent,eol,start
set nocompatible        " sets all config to default ones whether is vi or vim

""" Vundle Stuff: """
" Vundle setup {{{
set rtp+=~/.vim/vundle/
call vundle#rc()
" }}}
" Bundle installed by Vundle {{{
Bundle "gmarik/vundle"
Bundle "charleschen/Pychimp-vim"
Bundle "chmllr/vim-colorscheme-elrodeo"
Bundle "git://git.wincent.com/command-t.git"
Bundle "tpope/vim-fugitive"
Bundle "Lokaltog/vim-powerline"
Bundle "mileszs/ack.vim"
Bundle "duganchen/vim-soy"
Bundle "sjl/clam.vim"
Bundle "kien/tabman.vim"
Bundle "scrooloose/nerdtree"
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/vim-snippets"
Bundle "charleschen/vim-snipmate"
Bundle "tpope/vim-surround"
Bundle "mattn/zencoding-vim"
Bundle "orestis/pysmell"
Bundle "charleschen/minibufexpl.vim"
Bundle "AndrewRadev/switch.vim"
Bundle "zeekay/python.vim"
Bundle "nvie/vim-flake8"
Bundle "majutsushi/tagbar"
Bundle "maxbrunsfeld/vim-yankstack"
Bundle "vim-scripts/vimwiki"
Bundle "Valloric/YouCompleteMe"
Bundle "vim-scripts/rdark"
Bundle "mhinz/vim-signify"
Bundle "lepture/vim-jinja"
" }}}

" Key Mappings: {{{
    let mapleader = ","
    let g:mapleader = ","
    " Quickly access and refresh vim config:
    nmap <silent> <leader>ev :e $MYVIMRC<cr>
    nmap <silent> <leader>sv :so $MYVIMRC<cr>
    " Smart way to move btw. windows
    map <C-j> <C-W>j
    map <C-k> <C-W>k
    map <C-h> <C-W>h
    map <C-l> <C-W>l
" }}}

" Indentation/wrap customization {{{
    set ai              " sets autoindent on
    set si              " sets smartindent on
    set expandtab
    set smarttab
    set tabstop=4 shiftwidth=4
    set wrap            " wraps lines longer than the window
    set backspace=eol,start,indent
    set whichwrap+=<,>,h,l " allow specified keys to move the cursor move to the next line
    set lbr
" }}}

" Vim user interface {{{
    set t_Co=256
    set number          " turns on line numbers
    set colorcolumn=100 
    set laststatus=2    " always shows status line for the last window
    set gfn=Menlo:h12   
    set shell=/bin/bash
    set history=700
    set wildmenu        " invokes tab completion for command-line
    set showmatch       " jump to matching bracket
    set mat=2           " sets the match time for brackets
    set scrolloff=7
    set cmdheight=2     " set command line height
    set hid             " hides buffers when abandoned
    set nolazyredraw    
    set encoding=utf8   " sets encoding of vim
    set splitbelow splitright " splits new verticle split to the right and new horizontal to the bottom
    try
        lang en_US      " tries to set language
    catch
    endtry
" }}}

" Search Configuration {{{
    set ignorecase      " case is ignored when searching lower case
    set smartcase       " uses case to search when there is something upper case
    set hlsearch 
    set incsearch       " high search term as you type
    set magic           " characters are taken literally (ex: . matches any character, not \.)
" }}}

" Vim file system configuration {{{
    set ffs=unix,dos,mac
    set nowb
    set noswapfile
    set tw=500          " max with of text that is being inserted
    set autoread            " auto reread file openned in vim that is modified outside of vim
    try
        set undodir=~/.vim/undodir
        set undofile
    catch
    endtry
" }}}

""" Language Related Stuff: """
" Python Section {{{
    let python_highlight_all = 1
    au FileType python syn keyword pythonDecorator True None False self
    au BufNewFile,BufRead *.jinja set ft=jinja
    au BufNewFile,BufRead *.mako set ft=mako
    au FileType python inoremap <buffer> $r return
    au FileType python inoremap <buffer> $i import
    au FileType python inoremap <buffer> $p print
    au FileType python inoremap <buffer> $f #--- PH ----------------------------------------------<esc>FP2xi
    au FileType python map <buffer> <leader>1 /class
    au FileType python map <buffer> <leader>2 /def
    au FileType python map <buffer> <leader>C ?class
    au FileType python map <buffer> <leader>D ?def
    " Run current program
    au FileType python map <f9> :w<CR>:!python %<CR>
    " Python Mode Stuff
    let g:pymode_lint_ignore = ""
" }}}
" JavaScript section {{{
    au FileType javascript call JavaScriptFold()
    au FileType javascript setl fen
    au FileType javascript setl nocindent
    au FileType javascript imap <c-t> AJS.log();<esc>hi
    au FileType javascript imap <c-a> alert();<esc>hi
    au FileType javascript inoremap <buffer> $r return
    au FileType javascript inoremap <buffer> $f //--- PH ----------------------------------------------<esc>FP2xi
    function! JavaScriptFold()
        setl foldmethod=syntax
        setl foldlevelstart=1
        syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend
        function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
        endfunction
        setl foldtext=FoldText()
    endfunction
" }}}

""" Cool Configurations/shortcuts: """
" Deleting Trailing White Spaces {{{
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite {*.py,*.json} :call DeleteTrailingWS()
" }}}
" paste {{{
function! HasPaste()
    if &paste
        return 'PASTE MODE'
    else
        return ''
    endif
endfunction
" }}}

""" Loading seperate vim configs: {{{
    exe "source" "~/.vim/vimrc.$USER"
" }}}
