### README_Install_plover-pi.md

## Install and run Plover on a Raspberry Pi -- Instructions

These instructions were developed on a Raspberry Pi Zero, although they should be fairly easily modified for other Pis.

If you can run a Raspberian OS on an ARM emulator, on a reasonably powered computer, rather than doing the install on a Raspberry Pi (especially the Zero) I recommend that you do that. The sip and PyQt5 makes take, literally, hours.

Your second option is to not use PyQt5, but rather run the Pi "headless." In this case PyQt will not be needed or used. (This option is untested.)


1. Install Raspian on your microSD card.
    - Make sure it's set up for "headless" operations.
    - Make sure ssh is enabled.
    - I configured my Pi Zero for wifi access so I can ssh in over wifi. Eventually you'll need to use the only available USB for a keyboard anyway.
    - ```uname -a```
    - my system returns: Linux raspberrypi 4.19.97+ #1294 Thu Jan 30 13:10:54 GMT 2020 armv6l GNU/Linux
2. ssh to your pi
3. ```python3 --version``` # If python ver < 3.5 install update (mine was at 3.7.3)
4. update the OS:
    - ```sudo apt-get update```
    - ```git clone https://github.com/openstenoproject/plover.git```
 4. git clone (https://github.com/stanographer/plover-pi.git)

4. git clone plover from the Open Steno Project github.
    - ```cd```
    - ```git clone https://github.com/openstenoproject/plover.git```
5. ```cd plover```
6. Change the requirements by ommiting Qt and sip
    - ```nano requirements_distribution.txt```
    - Comment out these 2 lines:
```
        # dbus-python==1.2.4; "linux" in sys_platform
        # PyQt5-sip==4.19.13
        # PyQt5==5.11.3
```
7. ```pip3 install -r requirements.txt``` # this will take a while.

8. Run Plover
        - ```cd ~/plover```
        - ```./launch.sh```



## Virtual Machine Development system (untested)

Steps:

1. Install VirtualBox
2. Install Debian
3. Install git
4. Install xclip
5. Clone repository
    - \# install git
    - cd ~/development # or wherever you want the repository
    - git clone (https://github.com/stanographer/plover-pi.git)
6. change working directory
    * cd ~/development/plover-pi
7. Configure GitHub ssh keys by running
    * sudo bash config_git.sh




## Bruce's Local Development Plan

1. Connect wireless keyboard
1. Connect monitor
1.   with:
    - apt-get install
1. Install the python version of evtest, found here:
    - https://github.com/gvalkov/python-evdev
    - https://github.com/gvalkov/python-evdev/blob/master/bin/evtest.py
1. Monitor HID keyboard with:
    - python -m evdev.evtest
1. Back-up SD card to Mac.
1. Create a USB (HID) to Bluetooth pass-through app.













## Miscellaneous

Charley cannot run Plover:
https://discordapp.com/channels/136953735426473984/322442139906736128/701919092126253056

Plover docs:
https://github.com/openstenoproject/plover/blob/master/linux/README.md

Plover is in Python3. Use pip3 for "pip."

StarGazer1258: I managed to run from source on a raspberry pi zero.

StarGazer1258: If memory serves me right, you can run plover headless without Qt5, but if you want a GUI, you might have to compile it from source for your system.
