#!/bin/bash

######################################################
# Bash script to install apps on a new system (Ubuntu)
######################################################
# To run:
#>>> chmod +x install_all.sh
#>>> ./install_all.sh

## Update packages and Upgrade system
sudo apt-get update -y

# Git Configuration
echo '###Congigure Git..'

echo "Enter the Global Username for Git:";
read GITUSER;
git config --global user.name "${GITUSER}"

echo "Enter the Global Email for Git:";
read GITEMAIL;
git config --global user.email "${GITEMAIL}"

#########
#  Git  #
#########
echo '###Installing Git..'
sudo apt-get install git -y

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

echo 'Jupyter Extentions'
pip install jupyter_contrib_nbextensions
jupyter contrib nbextension install --user

#############
#  General  #
#############
DIR="Università"
if [! -d "$DIR" ]; then
  # Take action if $DIR exists. #
  echo "Create Folder ${DIR}..."
  mkdir Università
fi

DIR="$HOME/.inputrc"
if [! -d "$DIR" ]; then
  # Take action if $DIR exists. #
  echo "Create ${DIR}..."
  cp .inputrc $HOME
else
  echo "Update ${DIR}..."
  cat .inputrc >> $HOME/.inputrc
fi

echo "Install vlc fom snap"
sudo snap install vlc
echo "Install inkscape fom snap"
sudo snap install inkscape

##############################################
#  Lecturenotes (inkscape-shortcut-manager)  #
##############################################
sudo apt-get install pdf2svg -y
sudo apt-get install xclip -y
sudo apt-get install rofi -y
git clone https://github.com/gillescastel/inkscape-shortcut-manager.git ~/Università/
mkdir ~/.config/inkscape-shortcut-manager
cp ink-short_config.py ~/.config/inkscape-shortcut-manager/config.py
sudo apt-get install rxvt
cp .Xdefaults ~/
sed  -i '1i #!/usr/bin/python3' ~/Università/inkscape-shortcut-manager/main.py
chmod +x ~/Università/inkscape-shortcut-manager/main.py
sudo cp ink-on-boot /etc/init.d/
sudo chmod ugo+x /etc/init.d/ink-on-boot
update-rc.d ink-on-boot defaults
