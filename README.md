# About

My personal NeoVim configuration (minimalistic version), written in lua. It contains:
* Lazy
* DAP
* Custom bindings
* Treesitter
* Minimalistic lsp config
* Git plugins and Undotree to work with changes

### Hot to run

backup your old config

```sh
mv ~/.config/nvim ~/.config/nvim_bkp
```

clone repo

```sh
git clone git@github.com:ffff00-korj/nvim_config.git nvim
```

run Neovim

```sh
nvim .
```

Then in neovim type ":Lazy" and "I"(shift-i) to install plugins (it will be uploaded from github)
