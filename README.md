DotMe [![Gem Version](https://badge.fury.io/rb/dotme.png)](http://badge.fury.io/rb/dotme)
========================

DotMe is a dot files management system for human beings plus a DSL to perform a computer setup with ease.

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
        add                              Append to the dotme archive the specified target.

    Options:
        -T, --targets TARGETS            Files and folders to backup. DEFAULT: .oh-my-zsh, .fonts, .vimrc, .vim, .zshrc, .bashrc
        -O, --output FOLDER              Directory to store your dot files in. DEFAULT: dotfiles
        -B, --backup FOLDER              Backup directory to store existing dot files. DEFAULT: ~/dotfiles.backup
        -P, --prepend COMMAND            Prepend a custom command to the Dotfile, can be use multiple times.
        -A, --append COMMAND             Append a custom command to the Dotfile, can be use multiple times.
        -V, --version                    Show dotme installed version.

Examples
---

Generate your first dotme archive with defaults files and folder ( .oh-my-zsh, .vimrc, .vim, .zshrc, .bashrc ).

    # dotme create

Or with custom comma separated targets.

    # dotme create --targets ".bash_profile, .whatever, Desktop/MyFolder"

Once you have your dotfiles archive, add some new entry to it.

    # dotme add "Library/Application Support/Sublime Text 2"

Want to setup a new computer or a new OS installation?

    # cd dotfiles && dotme

License
---

Released under the BSD license.  
Copyright &copy; 2013, Simone Margaritelli 
<evilsocket@gmail.com>  

<http://www.evilsocket.net/>
All rights reserved.
