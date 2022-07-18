#!/bin/sh

# Get add-apt-repository command
sudo apt-get update
sudo apt-get install -y software-properties-common dirmngr

# Get a newer version of git
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E1DD270288B4E6030699E45FA1715D88E1DF1F24 > /dev/null
sudo apt-get update
sudo add-apt-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get install -y git

# Do a sparse checkout. Ref https://stackoverflow.com/a/63786181
git clone --filter=blob:none --no-checkout --depth 1 --sparse https://github.com/chromium/chromium.git
cd chromium
git sparse-checkout init --cone
git sparse-checkout add third_party/dpkg-shlibdeps
git checkout