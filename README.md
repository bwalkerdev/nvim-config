# papabryce's nvim (based on kickstart.nvim)

## alex guide (for idiots)
- Leader is `<Space>`
- To figure out what key(s) an action is bound to, do `<Space>sk`. This will [S]earch [K]eymaps
1. clone with `git clone git@github.com:papabryce/nvim-config.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim`
2. install fzf, ripgrep, nodejs, and npm with `sudo pacman -S fzf && sudo pacman -S ripgrep && sudo pacman -S nodejs && sudo pacman -S npm`
3. start up nvim with `nvim`, then let Lazy initialize, exit with `q`, then exit nvim
4. Start nvim and type `:Lazy`, then type a capital `S`, this will install all plugins. When it is done, exit with `q`
5. type `:Mason`, then type a capital `U`, this will install all LSPs. When it is done, exit with `q`
6. uninstall vscode with `sudo pacman -R code` (or whatever godforsaken binary you have installed)
7. profit


## install

Neovim's configurations are located under the following paths, depending on your OS:

| OS | PATH |
| :- | :--- |
| Linux | `$XDG_CONFIG_HOME/nvim`, `~/.config/nvim` |
| macOS | `$XDG_CONFIG_HOME/nvim`, `~/.config/nvim` |
| Windows (cmd)| `%userprofile%\AppData\Local\nvim\` |
| Windows (powershell)| `$env:USERPROFILE\AppData\Local\nvim\` |

Clone:

- on Linux and Mac
```sh
git clone git@github.com:papabryce/nvim-config.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

- on Windows (cmd)
```
git clone git@github.com:papabryce/nvim-config.git %userprofile%\AppData\Local\nvim\ 
```

- on Windows (powershell)
```
git clone git@github.com:papabryce/nvim-config.git $env:USERPROFILE\AppData\Local\nvim\ 
```

- you also need `fzf` and `ripgrep`


### windows install

Installation may require installing build tools, and updating the run command for `telescope-fzf-native`

See `telescope-fzf-native` documentation for [more details](https://github.com/nvim-telescope/telescope-fzf-native.nvim#installation)

This requires:

- Install CMake, and the Microsoft C++ Build Tools on Windows

```lua
{'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
```

