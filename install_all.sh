#!/bin/bash

######################################################
# Bash script to install apps on a new system (Ubuntu)
######################################################

## Update packages and Upgrade system
sudo apt-get update -y

#########
#  Git  #
#########
echo '###Installing Git..'
sudo apt-get install git -y

# Git Configuration
echo '###Congigure Git..'

echo "Enter the Global Username for Git:";
read GITUSER;
git config --global user.name "${GITUSER}"

echo "Enter the Global Email for Git:";
read GITEMAIL;
git config --global user.email "${GITEMAIL}"

echo 'Git has been configured!'
git config --list

###########
#  Latex  #
###########
echo '###Configure Tex-Live'
sudo apt-get install texlive-full -y

#########
#  Vim  #
#########
echo '###Configure Vim'
sudo apt-get install vim -y

echo 'Cloning my configuration'
cd ~
git clone https://github.com/dodogabrie/vimconfig.git 
mv -rf vimconfig .vim

echo 'Getting bundle'
git clone https://github.com/gmarik/Vundle.vim ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

############
#  Python  #
############
echo '###Configure Python'
echo 'Getting pip and jupyter'
sudo apt-get install pip -y
sudo apt-get install jupyter -y

echo 'Installing Python packages'
pip install -r python_package.txt
