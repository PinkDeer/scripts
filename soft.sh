#!/bin/bash

# Installation Chrome
echo "\033[02;31mInstallation Chrome\033[00m"
echo "\033[02;33mDownloading the repository key...\033[00m"
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo "\033[02;33mAdding a repository...\033[00m"
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
echo "\033[02;33mUpdating the list of packages...\033[00m"
sudo apt-get update
echo "\033[02;33mInstalling a stable version...\033[00m"
sudo apt-get install google-chrome-stable
echo "\033[02;32mChrome was installed\033[00m"
echo ""

# Installation Atom
echo "\033[02;31mInstallation Atom\033[00m"
echo "\033[02;33mDownloading the repository key...\033[00m"
curl -L https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
echo "\033[02;33mAdding a repository...\033[00m"
sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'
echo "\033[02;33mUpdating the list of packages...\033[00m"
sudo apt-get update
echo "\033[02;33mInstalling Atom...\033[00m"
sudo apt-get install atom
echo "\033[02;32mAtom was installed\033[00m"
echo ""

# Installation DeaDBeeF
echo "\033[02;31mInstallation DeaDBeeF\033[00m"
echo "\033[02;33mAdding PPA..\033[00m"
sudo add-apt-repository ppa:starws-box/deadbeef-player
echo "\033[02;33mUpdating the list of packages...\033[00m"
sudo apt-get update
echo "\033[02;33mInstalling DeaDBeeF...\033[00m"
sudo apt-get install deadbeef
echo "\033[02;32mDeaDBeeF was installed\033[00m"
echo ""

# Installation Deluge
echo "\033[02;31mInstallation Deluge\033[00m"
sudo apt-get install deluge
echo "\033[02;32mDeluge was installed\033[00m"

#  Installation FileZilla

echo "\033[02;31mInstallation FileZilla\033[00m"
sudo sh -c 'echo "deb http://archive.getdeb.net/ubuntu xenial-getdeb apps" >> /etc/apt/sources.list.d/getdeb.list'
wget -q -O - http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add -
sudo apt update
sudo apt install filezilla
echo "\033[02;32mFileZilla was installed\033[00m"
# Remove FileZilla
# sudo apt-get remove filezilla

echo "\033[01;32mAll software was installed\033[00m"
