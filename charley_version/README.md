# Steno in the middle, Charley version README.md


### Background
* Creator: **Charley stenomod.blogspot.com**, Creator of the TinyMod steno machine.
* Source: Plover Discord server / date: April 7, 2020
    - [Discord starting message](https://discordapp.com/channels/136953735426473984/322442139906736128/697216672335003689)
* Connnection method:
    - `Steno kbd(TinyMod) --> USB --> Raspberry Pi 3, running minicom --> "serial to HID converter" --> Host`
* Configuration also includes:
    - 7" screen attached to the Pi 3.

### Project Status
This is Charley's system, which he showed is fundamentally sound. USB in, serial out of the Pi. Charley used a Pi 3, but it seems likely any Pi would work.

Modifiers (Ctrl, Alt, ...) aren't working yet. They are being sent through the Linux minicom program running on the Pi, which is likely striping them out.



### General principals, methods



### Pros


### Cons


### Resources
* Credit: Stanley figured out how to install Plover on Raspbian.
* [Linux serial IO notes](https://www.elinux.org/Serial_port_programming), might be of some use.
* **Benoit Pierre** has a version (of Plover?) with support for output plugins. Someone could probably write to serial board output from within Plover.



