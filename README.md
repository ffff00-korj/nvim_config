# About

My personal NeoVim configuration (minimalistic version), written in lua. It contains:
* Lazy
* DAP
* Custom bindings
* Treesitter
* Minimalistic lsp config
* Git plugins and Undotree to work with changes

## How to run

Backup your old config

```bash
mv ~/.config/nvim ~/.config/nvim_bkp
```

Clone repo

```bash
git clone git@github.com:ffff00-korj/nvim_config.git nvim
```

Run Neovim

```bash
nvim .
```

Then in neovim type ":Lazy" and "I"(shift-i) to install plugins (it will be uploaded from github)
