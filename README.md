DotMe [![Gem Version](https://badge.fury.io/rb/dotme.png)](http://badge.fury.io/rb/dotme)
========================

DotMe is a dot files management system for human beings.

<http://rubygems.org/gems/dotme>

Installation and Usage
------------------------

You can verify your installation using this piece of code:

    gem install dotme

And

    # dotme --help

You will be presented with the following output:

    Usage: dotme ACTION [options]
    
    Actions:
        create                           Create your dot files archive. 
        install                          Use the Dotfile in current directory to install your dot files, this is the default action.
    
    Options:
        -T, --targets TARGETS            Files and folders to backup. DEFAULT: .oh-my-zsh, .vimrc, .vim, .zshrc, .bashrc
        -O, --output FOLDER              Directory to store your dot files in. DEFAULT: dotfiles
        -B, --backup FOLDER              Backup directory to store existing dot files. DEFAULT: ~/dotfiles.backup
        -P, --prepend COMMAND            Prepend a custom command to the Dotfile, can be use multiple times.
        -A, --append COMMAND             Append a custom command to the Dotfile, can be use multiple times.

License
---

Released under the BSD license.  
Copyright &copy; 2013, Simone Margaritelli 
<evilsocket@gmail.com>  

<http://www.evilsocket.net/>
All rights reserved.
