#!/bin/bash
sudo apt update

# Install Anydesk by DEB repository
#----------------------------------#
sudo wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | apt-key add -
sudo echo "deb http://deb.anydesk.com/ all main" > /etc/apt/sources.list.d/anydesk-stable.list
sudo apt update
#===================================================================================================#
# Install Atom by DEB repository
#----------------------------------#
wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'
sudo apt update
#===================================================================================================#
# Update the system
#------------------#
sudo apt -y full-upgrade
# Install nvidia driver
sudo apt -y install nvidia-settings
sudo apt -y install nvidia-driver nvidia-cuda-toolkit
# Install some useful packages
sudo apt -y install obs-studio filezilla gnome-todo gnome-shell-pomodoro anydesk keepassxc stacer\
 gnome-disk-utility alien caja-admin caja-image-converter caja-mediainfo caja-open-terminal\
 caja-sendto caja-rename thunderbird dia openboard rhythmbox telegram-desktop\
 unzip atom putty putty-tools
#===================================================================================================#
# Install VMware
#--------------#
if [[ -f ./Software/VMware-Workstation-Full-16.2.1-18811642.x86_64.bundle ]]; then
  cd ./Software
  sudo chmod +x VMware-Workstation-Full-16.2.1-18811642.x86_64.bundle
  sudo ./VMware-Workstation-Full-16.2.1-18811642.x86_64.bundle
 else
   echo "VMware not found :("
   echo "Don't worry octa will download it for you :)"
   cd ./Software
   wget https://download3.vmware.com/software/wkst/file/VMware-Workstation-Full-16.2.1-18811642.x86_64.bundle
   sudo chmod +x VMware-Workstation-Full-16.2.1-18811642.x86_64.bundle
   sudo ./VMware-Workstation-Full-16.2.1-18811642.x86_64.bundle
fi
#===================================================================================================#
# Install skype
#-------------#
if [[ -f ./Software/skypeforlinux-64.deb ]]; then
  sudo dpkg -i ./Software/skypeforlinux-64.deb
 else
   echo "Skype not found :("
   echo "Don't worry octa will download it for you :)"
   cd ./Software
   wget https://repo.skype.com/latest/skypeforlinux-64.deb
   sudo chmod +x skypeforlinux-64.deb
   sudo dpkg -i skypeforlinux-64.deb
fi
#===================================================================================================#
# Install GNS3
#-------------#
sudo apt install -y python3-pip python3-pyqt5 python3-pyqt5.qtsvg \
python3-pyqt5.qtwebsockets \
qemu qemu-kvm qemu-utils libvirt-clients libvirt-daemon-system virtinst \
wireshark xtightvncviewer apt-transport-https \
ca-certificates curl gnupg2 software-properties-common
sudo pip3 install gns3-server
sudo pip3 install gns3-gui
#===================================================================================================#
# Install packet tracer
if [[ -f ./Software/CiscoPacketTracer_810_Ubuntu_64bit.deb ]]; then
  sudo dpkg -i ./Software/CiscoPacketTracer_810_Ubuntu_64bit.deb
 else
 echo "Cisco Packet Tracer not found :("
 echo "Don't worry octa will download it for you :)"
 cd ./Software
 #Packet tracer github url
fi
#===================================================================================================#
# Install FreeDownloadManager
if [[ -f ./Software/freedownloadmanager.deb ]]; then
  cd ./Software
  sudo dpkg -i freedownloadmanager.deb
 else
   echo "FreeDownloadManager not found :("
   echo "Don't worry octa will download it for you :)"
   cd ./Software
   wget https://dn3.freedownloadmanager.org/6/latest/freedownloadmanager.deb
   sudo chmod +x freedownloadmanager.deb
   sudo dpkg -i freedownloadmanager.deb
fi
#===================================================================================================#
# clear cache every one min using crontab
echo \
"#!/bin/bash
sync; echo 1 > /proc/sys/vm/drop_caches #Clear PageCache only. [recommended]
#sync; echo 2 > /proc/sys/vm/drop_caches #Clear dentries and inodes.
#sync; echo 3 > /proc/sys/vm/drop_caches # [not recommended]" > $HOME/.clearcache.sh
sudo chmod +x $HOME/.clearcache.sh
crontab -l 2>/dev/null; echo "* * * * * sudo $HOME/.clearcache.sh" | crontab -
#===================================================================================================#
# Install WhiteSur-cursors theme
if [[ -d /usr/share/icons/WhiteSur-cursors ]]; then
  echo "WhiteSur-cursors already installed as root"
  echo "Do you want to install it again? ('y' or 'n')"
  read
    if [[ $REPLY == 'y' ]]; then
      if [[ -d ./Themes/Cursors/WhiteSur-cursors-master ]]; then
        cd ./Themes/Cursors/WhiteSur-cursors-master
        sudo ./install.sh
      else
        unzip ./Themes/Cursors/WhiteSur-cursors-master.zip
        sudo ./Themes/Cursors/WhiteSur-cursors-master/install.sh
      fi
    elif [[ $REPLY == 'n' ]]; then
      echo "The script will contiue"
    fi
  else
    echo "Please type 'y' for yes or 'n' for no"
fi
#===================================================================================================#
# Install Tela-circle-icon-theme-master
if [[ -d ./Themes/Icons/Tela-circle-icon-theme-master ]]; then
  cd ./Themes/Icons/Tela-circle-icon-theme-master
  sudo ./install.sh
else
  unzip ./Themes/Icons/Tela-circle-icon-theme-master.zip
  cd ./Themes/Icons/Tela-circle-icon-theme-master
  sudo ./install.sh
fi
#===================================================================================================#
# Install grub2-themes-master
if [[ -d ./Themes/GRUB/grub2-themes-master ]]; then
  cd ./Themes/GRUB/grub2-themes-master
  sudo ./install.sh
else
  unzip ./Themes/GRUB/grub2-themes-master.zip
  cd ./Themes/GRUB/grub2-themes-master
  sudo ./install.sh -b -t whitesur -i whitesur -s 
fi
#===================================================================================================#
# Install Orchis-theme-master
if [[ -d ./Themes/GTK/Orchis-theme-master ]]; then
  cd ./Themes/GTK/Orchis-theme-master
  sudo ./install.sh
else
  unzip ./Themes/GTK/Orchis-theme-master.zip
  cd ./Themes/GTK/Orchis-theme-master
  sudo ./install.sh
fi
#===================================================================================================#
# Install teamviewer
if [[ -f ./Software/teamviewer_15.25.5_amd64.deb ]]; then
  cd ./Software
  sudo dpkg -i teamviewer_15.25.5_amd64.deb
 else
   echo "FreeDownloadManager not found :("
   echo "Don't worry octa will download it for you :)"
   cd ./Software
   wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
   sudo chmod +x teamviewer_15.25.5_amd64.deb
   sudo dpkg -i teamviewer_15.25.5_amd64.deb
fi
#===================================================================================================#
