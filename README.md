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
  if [ -f ~/.bash_git ]; then
    . ~/.bash_git
  fi
  ```

3. `~/.zshrc`
  ```sh
  if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
  fi
  if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
  fi
  if [ -f ~/.zsh_git ]; then
    . ~/.zsh_git
  fi
  ```
