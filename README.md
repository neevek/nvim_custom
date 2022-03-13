nvim\_custom
---

My custom NeoVim setup based on [NvChad](https://github.com/NvChad/NvChad).

Prerequisite
---

Install Nerd Font

```
brew tap homebrew/cask-fonts
brew install --cask font-victor-mono-nerd-font
```

Setup
---
```
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
nvim +'hi NormalFloat guibg=#1e222a' +PackerSync
 
git clone https://github.com/neevek/nvim_custom ~/.config/nvim/lua/custom

:PackerSync
:qa<CR>

:TSInstall rust
:TSInstall cpp
```

Install Language Servers For lspconfig
---

```
:LspInstall rust_analyzer
:LspInstall clangd
```
