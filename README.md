Simple and effective neovim config which sets up probably everything you need 

# Requirements

```
neovim >= 0.8.0
```

# Installation

```
git clone https://github.com/svenhendrikx/okay-nvim-conf.git ~/.config/nvim
```

Cheatsheet:
```
    # note that the default leader key is <space>
    <leader>hmm Show the readme using Glow (install glow first)

    <leader>gs  git client
    <leader>gv  vertical diffsplit of current file

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

    ys<selectionpattern><surroundpattern>
    example:
    ysiw" > surround word with "
    ys$(  > surround remainder of line with ()
    yst <p> > surround until next space with <p> </p>
    ds"   > remove surrounding ""
    cs"'  > replace surrounding "" with ''
```
