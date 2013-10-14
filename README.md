vim
===

vim
Installation:

    git clone https://github.com/alexanderdavidenko32/vim.git ~/.vim

Create symlinks:

    ln -s ~/.vim/vimrc/.vimrc ~/.vimrc

Add submodule

    git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
    git add .
    git commit -m "Install Fugitive.vim bundle as a submodule."

Switch to the `~/.vim` directory, and fetch submodules:

    cd ~/.vim
    git submodule init
    git submodule update

Upgrading all bundled plugins

    git submodule foreach git pull origin master
