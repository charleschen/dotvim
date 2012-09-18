" call pathogen#runtime_append_all_bundles()

" To disable a plugin, add it's bundle name to the following list
let g:pathogen_disabled = []
syntax enable
filetype indent plugin on

" for some reason the csscolor plugin is very slow when run on the terminal
" but not in GVim, so disable it if no GUI is running
if !has('gui_running')
    call add(g:pathogen_disabled, 'headlights')
endif

" disable some plugins which I don't use anymore/not often
" After the clean-up, no more unused plugins left :)
" for future reference:
" call add(g:pathogen_disabled, '<bundle-name>')
if $SUDO_USER != ''
    " neocomplcache doesn't like sudo and gives annoying warnings
    " call add(g:pathogen_disabled, 'neocomplcache')
endif

call pathogen#infect()
call pathogen#helptags()

if !has('gui_running')
    set guifont=Menlo\ for\ Powerline
    let g:Powerline_symbols = 'fancy'
endif

colorscheme pablo

" tab space {{{
set expandtab
set smarttab
set tabstop=4 shiftwidth=4
" }}}
