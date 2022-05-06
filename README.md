dotfiles
========

my dotfiles

# usage

1. run `init.sh`

  ```sh
  ./init.sh
  ```

2. `~/.bashrc`

  ```sh
  if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
  fi
  ```

3. `~/.zshrc`
  ```sh
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
  if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
  fi
  ```
