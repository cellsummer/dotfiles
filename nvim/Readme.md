# Neovim Configuration

## Folder Structure

```
nvim
│   init.lua
│   Readme.md
│
├───lua
│   │   keymappings.lua
│   │   lsp.lua
│   │   myConfigs.vim
│   │   nvim-cmp.lua
│   │   options.lua
│   │   plugins.lua
│   │   treesitter.lua
│   │
│   └───lsp
│           js-ts-ls.lua
│           json-ls.lua
│           lua-ls.lua
│           python-ls.lua
│           sumneko_lua.lua
│
└───plugin
        packer_compiled.lua
```

## Main config files

* init.lua: main entry for all configs
* lua/options: regular neovim options/preferences
* lua/keymappings: custom keybindings
* lua/plugins: Plugin manager
* lua/lsp: language server settings
* lua/nvim-cmp: auto-completion settings
* lua/lsp/*: settings for specific language
