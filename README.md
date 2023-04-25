A pretty complete vim config written in lua

# Requirements

```
ctags
```

# Installation

```
install packer:
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

git clone git@github.com:svenhendrikx/okay-nvim-conf.git ~/.config/nvim

<in vim>
    :PackerSync
    restart

# The first time treesitter might take some time to download parsers
# Also, you might have to run PackerSync a few times and restart in between for everything to get installed correctly
```

For tag support, install ctags and run `ctags -R .` in the project root.

Cheatsheet:
```
    # note that the default leader key is <space>

     <leader>gs  git client

    <leader>ff  fuzzy find files
    <leader>fg  fuzzy find string

    <leader>u   undotree

    <leader>id  toggle indentation lines

    <leader>ma  mason (install language servers)

    <C-a>       toggle Neotree
    <C-s>       toggle tagbar

    <leader>bp  python breakpoint
    <leader>bi  python interpreter

    <leader>gl  Render markdown
    
    <C-^>       goto previous file
    <C-]>       follow tag
    <C-o>       go back up the tagstack
```
