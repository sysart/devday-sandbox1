#!/bin/bash

sudo apt-get update

# install ruby depencencies
sudo apt-get install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev nodejs


# Install rbenv
sudo -u vagrant git clone git://github.com/sstephenson/rbenv.git ~vagrant/.rbenv
sudo -u vagrant git clone git://github.com/sstephenson/ruby-build.git ~vagrant/.rbenv/plugins/ruby-build

echo 'export PATH="~vagrant/.rbenv/plugins/ruby-build/bin:~vagrant/.rbenv/bin:$PATH"' >> ~vagrant/.bashrc
echo 'eval "$(rbenv init -)"' >> ~vagrant/.bashrc
sudo -u vagrant echo "gem: --no-ri --no-rdoc" > ~vagrant/.gemrc

