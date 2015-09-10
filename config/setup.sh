#! /usr/bin/env bash
base_dir="$(pwd)/.."
#######################################################_INSTALL_CHROME_#######################################################
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt-get update
sudo apt-get install google-chrome-stable
##############################################################################################################################

########################################################_INSTALL_LIBS_########################################################
sudo apt-get install curl
sudo apt-get install libcurl3 libcurl3-gnutls libcurl4-openssl-dev
sudo apt-get install libqt4-dev
sudo apt-get install xvfb
##############################################################################################################################

########################################################_INSTALL_RUBY_########################################################
sudo apt-get update
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties

cd
git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

rbenv install 2.1.4
rbenv global 2.1.4

echo "gem: --no-ri --no-rdoc" > ~/.gemrc
##############################################################################################################################

########################################################_INSTALL_GEMS_########################################################
cd $base_dir
gem install bundler --no-rdoc --no-ri
bundle install
selenium install
##############################################################################################################################
