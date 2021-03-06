# Before running this script clone the directory that contains it.
# cd ~
###### Instead of running stanographer's script,  https://github.com/stanographer/plover-pi.git  use mine.
# git clone https://github.com/babarrett/steno-in-the-middle ~/plover-pi
# -------------------------------------------

# Start in home directory (~)
cd ~

# Update apt.
sudo apt update

# Install Python 3.
sudo apt install 2to3

# Install PyQt5
###### sudo apt install -y python3-babel qt5-qmake qt5-default

# update pip, if needed
pip install -- user --upgrade pip

# Install pip.
sudo apt install pipenv

# Make PyQt5 and SIP.
###### cd /tmp
###### sudo wget https://www.riverbankcomputing.com/static/Downloads/sip/4.19.13/sip-4.19.13.tar.gz
###### sudo wget https://www.riverbankcomputing.com/static/Downloads/PyQt5/5.11.3/PyQt5_gpl-5.11.3.tar.gz

###### sudo tar xzf sip-4.19.13.tar.gz
###### cd sip-4.19.13
###### sudo python3 configure.py --sip-module=PyQt5.sip
###### sudo make
###### sudo make install

###### cd /tmp
###### sudo tar xzf PyQt5_gpl-5.11.3.tar.gz
###### cd PyQt5_gpl-5.11.3
###### sudo python3 configure.py
###### sudo make
###### sudo make install

# Remove native pyqt5. Added.
sudo rm -rf /usr/lib/python3/dist-packages/PyQt5/uic
sudo apt remove python3-pyqt5

# Return to repo dir.
cd ~

# Clone latest Plover repo.
git clone https://github.com/openstenoproject/plover.git plover/

# Get into plover.
cd plover

# Remove req for dbus-python, replace with pydbus
# pi3d.github.io/html/FAQ.html
yes | cp -rf ~/plover-pi/requirements/requirements.txt ~/plover
yes | cp -rf ~/plover-pi/requirements/requirements_plugins.txt ~/plover
yes | cp -rf ~/plover-pi/requirements/requirements_distribution.txt ~/plover

pip3 install pydbus
# Add user pi to 3 groups
sudo usermod -a -G uucp pi
sudo usermod -a -G dialout pi
sudo usermod -a -G staff pi

# Install Plover.
pip3 install --user -r requirements.txt

# Install plugins.
pip3 install --user -e . -r requirements_plugins.txt --no-build-isolation

# Personal plugins.
pip3 install plover-stenograph-usb
pip3 install plover-dict-commands

# Executable permissions.
sudo chmod +x launch.sh test.sh

# /home/pi/.local/lib/python3.7/site-packages
