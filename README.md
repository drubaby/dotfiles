# Dotfiles

My configurations for git, zsh, and tmux

## Installation

**Pre-Requisite**
GNU Stow is used to create symlinks from sub-directories. Install this with `brew install stow` on OSX or `apt install stow` on Debian.

1. Clone repo and set up symlinks

```bash
# Clone repo
git clone https://github.com/drubaby/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Set up symlinks
stow zsh git tmux
```

2. To identify yourself with git, create a `~/.gitconfig.local` with the following structure:

```bash
[user]
  name = Replace Me
  email = replaceme@example.com
```
