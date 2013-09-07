#!/bin/bash
################################################################################
# install.sh # This script installs dotfiles
################################################################################

dotdir=~/dotfiles             # dotfiles directory
olddir=~/dotfiles_old         # old dotfiles backup directory
files="vimrc vim bashrc bash"


function BackupAll {
cd $dotdir
backupdir=$1
count=0
while [ -e $backupdir ]
do
  backupdir=$1$count
  let count=count+1
done
mkdir -p $backupdir
echo "Backing up dotfiles into "$backupdir
for file in $files
do
  if [ -e ~/.$file ]
  then
    mv ~/.$file $backupdir/$file
  fi
done
}

function CopyDotFiles {
for file in $files
do
  echo "Linking file " $file
  ln -s $dotdir/$file ~/.$file
done
}

function GetVimThings {
if [ ! -e $dotfiles/vim/indent/python.vim ]
then
  echo "Getting python.vim for inentation"
  mkdir -p $dotfiles/vim/indent
  wget http://www.vim.org/scripts/download_script.php?src_id=4316 -O $dotfiles/vim/indent/python.vim -q
fi
if [ ! -e $dotfiles/vim/bundle/vundle ]
then
  echo "Getting Vundle"
  git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
  echo "Now run :BundleInsttall in  vim"
fi
if [ ! -e $HOME/PowerlineSymbols-Powerline.otf ]
then
  echo "Installing fonts"
  cd $dotfiles/vim/bundle/vim-powerline/fontpatcher
  ./fontpatcher PowerlineSymbols.sfd
  mkdir -p ~/.fonts
  mv PowerlineSymbols-Powerline.otf ~/.fonts/.
  sudo fc-cache -vf
fi
}

BackupAll $olddir
CopyDotFiles
GetVimThings
