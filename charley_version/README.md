# Steno in the middle, Charley version README.md


### Background
* Creator: **Charley stenomod.blogspot.com**, Creator of the TinyMod steno machine.
* Source: Plover Discord server / date: April 7, 2020
    - [Discord starting message](https://discordapp.com/channels/136953735426473984/322442139906736128/697216672335003689)
* Connection method:
    - `Steno kbd(TinyMod) --> USB --> Raspberry Pi 3, running minicom --> "serial to HID converter" --> Host`
* Configuration also includes:
    - 7" screen attached to the Pi 3.

### Project Status
This is Charley's system, which he showed is fundamentally sound. USB in, serial out of the Pi. Charley used a Pi 3, but it seems likely any Pi would work.

Modifiers (Ctrl, Alt, ...) aren't working yet. They are being sent through the Linux minicom program running on the Pi, which is likely striping them out.

Update 4/15/2020: Been using a Raspberry Pi to do Plover-in-the-middle for a couple weeks now, I guess. It's pretty much okay, but I'm going to put it aside now for awhile. I have it in my arsenal in the future if I need to do steno on somebody else's keyboard for some reason. But in that case I'll probably just use my laptop rather than an rPi. The rPi has been a bit of a PITA in that that it regularly loses track of the serial port and I need to reconfigure. This happens on my laptop too, but less often I think.

Update 5/12/2020: Plan is to add blocks to my Forth system for the 328p and build from that. But I haven't wired up the SD card breakout board yet...


### General principals, methods



### Pros
* Works with any USB NKRO keyboard
* Has a 7" monitor to follow character output to the host
* Simple, BOM is: Pi 3, SD card, serial to USB adapter, TinyMod keyboard.

### Cons


### Resources
* [Repository](https://github.com/CharleyShattuck/myforth-arduino/tree/master/flover)
* Credit: Stanley figured out how to install Plover on Raspbian.
* [Linux serial IO notes](https://www.elinux.org/Serial_port_programming), might be of some use.
* **Benoit Pierre** has a version (of Plover?) with support for output plugins. Someone could probably write to serial board output from within Plover.



