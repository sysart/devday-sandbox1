#!/bin/sh

sudo apt-get update

# install ruby depencencies
sudo apt-get install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev

# Install ruby using rbenv
cd
git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

rbenv install 2.1.1
rbenv global 2.1.1

# tell Rubygems not to install the documentation for each package locally
echo "gem: --no-ri --no-rdoc" > ~/.gemrc

# install nodejs
sudo apt-get install -y nodejs

# install rails
gem install rails
rbenv rehash

