nvim\_custom
---

Setup
---
```
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
nvim +'hi NormalFloat guibg=#1e222a' +PackerSync
 
git clone https://github.com/neevek/nvim_custom ~/.config/nvim/lua/custom

:TSInstall rust
:TSInstall cpp
```

Install Language Servers For lspconfig
---

```
:LspInstall rust-analyzer
:LspInstall clangd
```
