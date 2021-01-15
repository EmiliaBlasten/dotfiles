#!/bin/sh

mkdir -p origs

if [ -e ~/.nanorc ]
then
  # Back up old file?
  if [ -e origs/nanorc ]
  then
    echo -e "\n\nThe backup origs/nanorc already exists."
    read -p "Do you want to overwrite it with a more recent backup? (y/n) " rebackup
    if [[ $rebackup =~ ^[Yy]$ ]]
    then
      echo -e "Backing up ~/.nanorc to origs/nanorc\n"
      cp -a ~/.nanorc origs/nanorc
    fi
  else
    echo -e "Backing up  ~/.nanorc to origs/nanorc\n"
    cp -a ~/.nanorc origs/nanorc
  fi

  # Overwrite old file?
  read -p "Overwrite old .nanorc file? (y/n) " overwrite
  if [[ $overwrite =~ ^[Yy]$ ]]
  then
    echo -e "Overwriting ~/.nanorc\n"
    cp nanorc ~/.nanorc
  fi
else
  echo -e "Installing nanorc to ~/.nanorc"
  cp nanorc ~/.nanorc
fi






if [ -e ~/.screenrc ]
then
  # Back up old file?
  if [ -e origs/screenrc ]
  then
    echo -e "\n\nThe backup origs/screenrc already exists."
    read -p "Do you want to overwrite it with a more recent backup? (y/n) " rebackup
    if [[ $rebackup =~ ^[Yy]$ ]]
    then
      echo -e "Backing up ~/.screenrc to origs/screenrc\n"
      cp -a ~/.screenrc origs/screenrc
    fi
  else
    echo -e "Backing up  ~/.screenrc to origs/screenrc\n"
    cp -a ~/.screenrc origs/screenrc
  fi

  # Overwrite old file?
  read -p "Overwrite old .screenrc file? (y/n) " overwrite
  if [[ $overwrite =~ ^[Yy]$ ]]
  then
    echo -e "Overwriting ~/.screenrc\n"
    cp screenrc ~/.screenrc
  fi
else
  echo -e "Installing screenrc to ~/.screenrc\n"
  cp screenrc ~/.screenrc
fi





if [ -e ~/.gitconfig ]
then
  # Back up old file?
  if [ -e origs/gitconfig ]
  then
    echo -e "\n\nThe backup origs/gitconfig already exists."
    read -p "Do you want to overwrite it with a more recent backup? (y/n) " rebackup
    if [[ $rebackup =~ ^[Yy]$ ]]
    then
      echo -e "Backing up ~/.gitconfig to origs/gitconfig\n"
      cp -a ~/.gitconfig origs/gitconfig
    fi
  else
    echo -e "Backing up  ~/.gitconfig to origs/gitconfig\n"
    cp -a ~/.gitconfig origs/gitconfig
  fi

  # Overwrite old file?
  read -p "Overwrite old .gitconfig file? (y/n) " overwrite
  if [[ $overwrite =~ ^[Yy]$ ]]
  then
    echo -e "Overwriting ~/.gitconfig\n"
    cp gitconfig ~/.gitconfig
  fi
else
  echo -e "Installing gitconfig to ~/.gitconfig\n"
  cp gitconfig ~/.gitconfig
fi






if [ -e ~/.emacs ]
then
  # Back up old file?
  if [ -e origs/emacs ]
  then
    echo -e "\n\nThe backup origs/emacs already exists."
    read -p "Do you want to overwrite it with a more recent backup? (y/n) " rebackup
    if [[ $rebackup =~ ^[Yy]$ ]]
    then
      echo -e "Backing up ~/.emacs to origs/emacs\n"
      cp -a ~/.emacs origs/emacs
    fi
  else
    echo -e "Backing up  ~/.emacs to origs/emacs\n"
    cp -a ~/.emacs origs/emacs
  fi

  # Overwrite old file?
  read -p "Overwrite old .emacs file? (y/n) " overwrite
  if [[ $overwrite =~ ^[Yy]$ ]]
  then
    echo -e "Overwriting ~/.emacs\n"
    cp emacs ~/.emacs
  fi
else
  echo -e "Installing emacs to ~/.emacs\n"
  cp emacs ~/.emacs
fi


