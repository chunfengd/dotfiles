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

3. `~/.profile`
  ```sh
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
  ```

4. `~/.zshrc`
  ```sh
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
  export PS1="%n %1~ %# "
  ```

5. `~/.zprofile`
  ```sh
  if [ -f ~/.zshrc ]; then
    . ~/.zshrc
  fi
  ```
