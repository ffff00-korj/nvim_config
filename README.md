# Neovim config

My NeoVim config. It contains:
* Lazy package manager
* DAP or Debug agapter or Debugger
* Custom bindings
* Minimalistic lsp config
* Git intergration and Undotree to work with changes
* AI features (ollama)

## Dependencies

// TODO

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
