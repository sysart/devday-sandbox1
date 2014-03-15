#!/bin/bash

# add the Docker repository key to your local keychain.
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9

# Add the Docker repository to your apt sources list
sudo sh -c "echo deb http://get.docker.io/ubuntu docker main\
> /etc/apt/sources.list.d/docker.list"

sudo apt-get update

# TODO: REPLACE THIS STUFF WITH DOCKER CONTAINER
# install ruby depencencies
sudo apt-get install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev nodejs


# make sure AUFS is installed (Docker)
sudo apt-get install -y linux-image-extra-`uname -r`

# install docker
sudo apt-get install -y lxc-docker

# workaround for Docker issue on Ubuntu (https://github.com/dotcloud/docker/issues/2683)
sudo wget -O /etc/init/docker.conf https://raw.github.com/dotcloud/docker/master/contrib/init/upstart/docker.conf
sudo service docker restart


# TODO: REPLACE RBENV STUFF WITH DOCKER CONTAINER
#Install rbenv
sudo -u vagrant git clone git://github.com/sstephenson/rbenv.git ~vagrant/.rbenv
sudo -u vagrant git clone git://github.com/sstephenson/ruby-build.git ~vagrant/.rbenv/plugins/ruby-build

echo 'export PATH="~vagrant/.rbenv/plugins/ruby-build/bin:~vagrant/.rbenv/bin:$PATH"' >> ~vagrant/.bashrc
echo 'eval "$(rbenv init -)"' >> ~vagrant/.bashrc
sudo -u vagrant echo "gem: --no-ri --no-rdoc" > ~vagrant/.gemrc

