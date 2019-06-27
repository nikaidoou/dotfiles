## setup macOS

### switch to zsh

```bash
which -a zsh
chsh -s /bin/zsh
source ~/.zshrc
```

### xcode-select

```bash
xcode-select --install
```

### install homebrew

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor
```

### git clone

```bash
git clone https://github.com/nkdn/dotfiles.git ~/.dotfiles
```

### git

```bash
~/.dotfiles/.git-config
```

### .zshrc & .vimrc

```bash
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.vimrc ~/.vimrc
ln -s ~/.dotfiles/.vim ~/.vim
source ~/.zshrc
```

### macOS defaults

```bash
~/.dotfiles/.macos
```

### karabiner-elements

required sudo

```bash
brew cask install karabiner-elements
mkdir -p ~/.config/karabiner
cp ~/.dotfiles/karabiner/karabiner.json ~/.config/karabiner/karabiner.json
```

### brew cask

```bash
~/.dotfiles/.brew-cask
```

### brew

```bash
~/.dotfiles/.brew
```

### android

```bash
~/.dotfiles/.android
```
