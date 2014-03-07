#!/bin/bash

rbenv install 2.1.1
rbenv global 2.1.1
gem install rails
rbenv rehash

ln -s /vagrant/src/syschat ~vagrant/syschat
cd ~vagrant/syschat
bundle install


rake db:migrate RAILS_ENV=development
