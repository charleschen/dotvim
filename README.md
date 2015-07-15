# Vim configuration

- Using Vundle to bundle plugins

## Installation Instructions:

1.  Clone git repository into ~/.vim:
    git clone https://github.com/charleschen/dotvim.git ~/.vim
2.  Update git submodule: git submodule update --init
3.  Link the vimrc file from the repository to your root folder:
    cd ~
    ln -s ~/.vim/vimrc .vimrc
4.  Start vim, run the command :BundleInstall.  All bundle should install

5. (optional) for macvim there is a gvimrc config.  This is used to config macvim config, specificall
    to change mac key bindings.  vimrc is read too early so (un)mappings will not work there.

## Customization:

-   Can load multiple vim config file, look for "Loading seperate vim configs".  Add/remove/modify
    extra vim configuration files here.
-   By default will try to look for "~/.vim/{USERNAME}_vimrc" for personal vim config
-   

branch | meh 
--- | ---
werd | werd
