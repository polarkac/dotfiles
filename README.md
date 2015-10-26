# Polarkac's dotfiles

Repository where I have my important dotfiles such as Git or Neovim configuration.
Feel free to use it as source of inspiration :).

## How to use
### Neovim
#### Before commit [Neovim#0f9dea2](https://github.com/neovim/neovim/commit/0f9dea2a0e344ded3bd4f8664acfed4fd3381c8e)
Create a `.nvimrc` in your home folder with content

```VimL
so /path/to/your/repository/nvim/nvimrc
```

#### After commit [Neovim#0f9dea2](https://github.com/neovim/neovim/commit/0f9dea2a0e344ded3bd4f8664acfed4fd3381c8e)
Create a `init.vim` in your `$XDG\_CONFIG\_HOME/nvim/` with content

```bash
so /path/to/your/repository/nvim/nvimrc
```

### Zsh
Create a `.zshrc` in your home folder with content

```bash
source /path/to/your/repository/zsh/zshrc
```

### Git
Create a `.gitconfig` in your home folder with content

```bash
[include]
    path = /path/to/your/repository/git/gitconfig
```

### Tmux
Create a `.tmux.conf` in your home folder with content

```bash
source /path/to/your/repository/tmux/tmux.conf
```
