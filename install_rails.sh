#!/bin/bash

# Ruby 2.5.0
# Rails 5.1.4
# PostgreSQL 9.5

#--------------------------------------------------------------------

# Install Ruby

echo "\033[02;31mInstallation Ruby\033[00m"
echo "\033[02;31mAdding the Node.js and Yarnby...\033[00m"
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev nodejs yarn

#--------------------------------------------------------------------

# Using rbenv

echo "\033[02;31mInstalling with rbenv...\033[00m"

cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

printf 'Select version Ruby: (1) 2.5.0, (2)  2.4.3, (3) 2.3.6, (4) 2.2.9, (5) 2.1.10, (6) 2.0.0-p648? '
read ruby
case $ruby in
     1)
          echo "\033[02;31mInstalling Ruby 2.5.0....\033[00m"
          rbenv install 2.5.0
          rbenv global 2.5.0
          ;;
     2)
          echo "\033[02;31mInstalling Ruby 2.4.3....\033[00m"
          rbenv install 2.4.3
          rbenv global 2.4.3
          ;;
     3)
          echo "\033[02;31mInstalling Ruby 2.3.6....\033[00m..."
          rbenv install 2.3.6
          rbenv global 2.3.6
          ;;
     4)
          echo "\033[02;31mInstalling Ruby 2.2.9....\033[00m..."
          rbenv install 2.2.9
          rbenv global 2.2.9
          ;;
     5)
          echo "\033[02;31mInstalling Ruby 2.1.10....\033[00m..."
          rbenv install 2.1.10
          rbenv global 2.1.10
          ;;
     6)
          echo "\033[02;31mInstalling Ruby 2.0.0-p648....\033[00m..."
          rbenv install 2.0.0-p648
          rbenv global 2.0.0-p648
          ;;
     *)
          echo "There is no such option"
          ;;
esac

gem install bundler
rbenv rehash

#--------------------------------------------------------------------

# Configuring Git

git config --global color.ui true
echo "Github name:"
read name
git config --global user.name $name
echo "Github email:"
read email
git config --global user.email $email

ssh-keygen -t rsa -b 4096 -C $email

#cat ~/.ssh/id_rsa.pub

#ssh -T git@github.com

#--------------------------------------------------------------------

# Rails

echo "\033[02;31mInstalling Rails...\033[00m"

curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs

printf 'Select version Rails: (1) 5.1.4, (2)  5.0.6 (3) 4.2.9, (4) 4.1.16, (5) 4.0.13, (6) 3.2.22.5? '
read rails
case $rails in
     1)
          echo "\033[02;31mInstalling Rails 5.1.4....\033[00m"
          gem install rails -v 5.1.4
          ;;
     2)
          echo "\033[02;31mInstalling Rails 5.0.6....\033[00m"
          rbenv install 5.0.6
          ;;
     3)
          echo "\033[02;31mInstalling Rails 4.2.9....\033[00m..."
          rbenv install 4.2.9
          ;;
     4)
          echo "\033[02;31mInstalling Rails 4.1.16....\033[00m..."
          rbenv install 4.1.16
          ;;
     5)
          echo "\033[02;31mInstalling Rails 4.0.13....\033[00m..."
          rbenv install 4.0.13
          ;;
     6)
          echo "\033[02;31mInstalling Rails 3.2.22.5....\033[00m..."
          rbenv install 3.2.22.5
          ;;
     *)
          echo "There is no such option"
          ;;
esac

rbenv rehash

#--------------------------------------------------------------------

# Setting Up PostgreSQL
echo "\033[02;31mSetting Up PostgreSQL...\033[00m"

sudo sh -c "echo 'deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main' > /etc/apt/sources.list.d/pgdg.list"
wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get install postgresql-common
sudo apt-get install postgresql-9.5 libpq-dev

echo "User name:"
read postgres
sudo -u postgres createuser $postgres -s

# If you would like to set a password for the user, you can do the following
#sudo -u postgres psql
#postgres=# \password chris

#--------------------------------------------------------------------

# Finaly

echo "\033[01;32mRails and Ruby was installed\033[00m"
ruby -v
rails -v

# source https://gorails.com/setup/ubuntu/1 by Chris Oliver
