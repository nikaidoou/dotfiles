#!/bin/zsh

brew install openssl
brew install nkf fontconfig sl watch jq fswatch
brew install hub colordiff git-secrets pre-commit
brew install gpg2
brew install libxml2 libxslt libiconv libtool
brew link --force libxml2 
brew link --force libxslt
brew install gettext
brew link --force gettext

brew install terraform@0.11
ln -s /usr/local/Cellar/terraform@0.11/0.11.14/bin/terraform /usr/local/bin

# docker
brwe install docker
source ~/.zshrc

# ruby
brew install rbenv ruby-build
source ~/.zshrc
rbenv install 2.4.6
rbenv global 2.4.6
rbenv rehash

# gem
gem install bundler
gem install cocoapods
gem install rubocop
gem install nokogiri -- --use-system-libraries --with-iconv-dir="$(brew --prefix libiconv)" --with-xml2-config="$(brew --prefix libxml2)/bin/xml2-config" --with-xslt-config="$(brew --prefix libxslt)/bin/xslt-config"
gem install docker-sync
source ~/.zshrc

# npm
brew install nodebrew yarn
source ~/.zshrc
mkdir -p ~/.nodebrew
mkdir -p ~/.nodebrew/src
nodebrew install-binary stable
nodebrew use stable

# python
brew install pyenv
source ~/.zshrc
CFLAGS="-I$(xcrun --show-sdk-path)/usr/include" pyenv install -v 2.7.11
pyenv global 2.7.11
pyenv rehash

# pip
pip install awscli
pip install docker-compose
source ~/.zshrc

# mac appstore
brew install mas
source ~/.zshrc
mas install 539883307 # LINE
mas install 409183694 # Keynote
mas install 409203825 # Numbers
mas install 497799835 # Xcode

source ~/.zshrc
