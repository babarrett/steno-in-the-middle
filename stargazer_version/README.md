# Steno in the middle, StarGazer version README.md


### Background
* Creator: **StarGazer1258**
* Source: Plover Discord server / date: April 10, 2020
* [Discord starting message](https://discordapp.com/channels/136953735426473984/322442139906736128/698289629249667162)
* Connnection method:
    - `TinyMod steno kbd via Plover plugin > to Raspberry Pi Zero (W) > Plover plugin > HID --> Host`

### Project Status
* This is StarGazer1258's system. It runs Plover 4 on the Pi Zero (W)
* The Pi is wired to the Feather 32u4 IO pins, in parallel.
* Using Python 3.7.3, Plover 4.0.0.dev8
* The firmware of the 32u4 is now set to do nothing when the switch is on NKRO. So use NKRO when you want to use the Pi and Serial when you want to use the 32u4.
* Modifiers (Ctrl, Alt, ...) aren't working yet.


### General principals, methods
* StarGazer wrote a plugin for Plover that imitates Charley's Arduino firmware as a steno machine. This replaces the matrix scanning, and the Steno chord processing code that was in the "Arduino" (Feather 32u4, ATmega32u4).
* He wrote another plugin that takes the output of Plover and sends it out the USB port as an HID keyboard.
* The NKRO/Serial switch is used to pick which processor to use. Use the NKRO to use the Pi, or Serial to use the Feather 32u4 (ATmega32u4). He modified the firmware of the 32u4 to do nothing when the switch is in NKRO position.
* Plover is running in headless mode.
* Pi Zero is running Raspbian lite, headless.

### Project file notes
* plover_tinymod4_main.py -- scan keyboard, and write to HID out.
* setup.sh and start.sh -- run in that order using systemd when the pi starts up. setup.sh initializes the HID device, then start.sh starts plover.
* reinstall.sh is a utility script to reinstall the plugin during development.


### Pros


### Cons
* Pi takes nearly 2 minutes to boot, though this may be a universal issue with Pis for now.

### Resources
* A carrying case for the TinyMod, on [Amazon](https://www.amazon.com/dp/B07KM943K4).
* [Github](https://github.com/StarGazer1258/plover-tinymod4)
* [TinyMod](https://stenomod.blogspot.com/)
* Benoit Pierre tested Plover on the Pi 0, using Arch Linux. [GIthub](https://gist.github.com/anonymous/14eb7dc40b9624432ca0dbafb28d3f1a)
* [How to improve Pi boot times]( https://raspberrypi.stackexchange.com/questions/14763/how-to-improve-boot-time-for-raspberry-pi)

