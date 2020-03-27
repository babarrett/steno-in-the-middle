
# Steno in the middle README.md


### Steno in the middle -- Elevator pitch:
Much of the stenography community uses Plover, open source software, written in Python, that runs on the host computer (Windows, macOS, or Linux) in conjunction with a steno machine or keyboard.
Plover meets most "steno" needs very well, but there are a few places where it cannot be used. They are:

* With "locked-down" systems. Usually corporate host computers where only software approved by, and installed by, IT departments is allowed.
* With smart phones and tablets where Plover cannot be installed.
* With a dedicated, smaller, portable, device used only for collecting text (to be processed later).

"Steno in the middle" is intended to solve these problems by inserting a device between a steno keyboard and the host. The device will run Plover and optionally display status to a separate, local display (phone).

The software can be open source. The hardware inexpensive.

## OVERVIEW

### "Steno in the middle" Goals:
* Create a single, stand-alone, hardware and software interface that attaches between a keyboard and host computer (Windows, macOS, Linux, etc.)
* The interface executes a large subset of Plover code.
* The interface receives steno output from the keyboard, interprets the chords, and sends standard USB HID keyboard keycodes to the host computer (as if the text was typed by an operator).
* The interface can be transfered between any combination of host computers and "Plover compatible" (Steno) keyboards.
* Ideally, works with USB (NKRO), Gemini PR, and TX Bolt protocols. TBD.

### "Steno in the middle" characteristics:
* Minimal viable product:
    - Use with a "Plover compatible" (Steno) keyboard...
    - connected to an off-board microcomputer (Raspberry Pi Zero W)...
    - ...that runs Plover derived software.
    - Some kind of case.
    - The other end of the microcomputer connects, through Bluetooth to any host computer.
    - Portable. (Hopefully microcomputer not much bigger than 2x2x4". Battery, cable, and optional power supply extra.)
    - There are no hardware changes or software installations needed for the keyboard or the host computer.
    The Plover-in-the-middle system is totally independent.
* Add: Save briefs on the go. (A second SD card could be useful, though not required.)
* Add: Programmable "switch" for 3 "modes"
    - Output to host computer
    - Write to SD card datafile (stand-alone, off-line recording)
    - Output to host computer, and write to SD card at the same time
* Add: WiFi access to any smart-phone or tablet and use the display via SSH, VNC, or web server for settings, brief definition, and displaying resultant text when writing to SD or...
* Add: Battery
* Add: ...and charger


### POSSIBLE HARDWARE

Current thinking, single units, for development

* 1 Keyboard that supports TX Bolt or USB(NKRO) protocols. Use your own. For example [Georgi](https://www.gboards.ca/product/georgi), $95, or [TinyMod](https://stenomod.blogspot.com/2019/07/how-to-buy-tinymod.html), $160
* 1 Raspberry Pi Zero W starter pack \~$27. https://www.amazon.com/dp/B0748MPQT4
    - Runs Linux, Python, Apache, and as Linux USB Gadget to simulate a keyboard to host.
    - But there may be alternatives to the Raspberry Pi Zero that have a better selection of USB ports.
* 1 SD card, 32+GB $15.40 https://www.amazon.com/gp/product/B00U77V8AM/ ;
    or 64GB fast (270Mbs) $33;  https://www.amazon.com/dp/B07QM348D9
* Smart phone or tablet (which you already have) for display.

Later, as needed:

* 1 Raspberry Pi case
* 1 LiPo battery and Charging circuit, or USB power brick
* 1 Monitor screen $22.50 for 5" https://www.amazon.com/gp/product/B00YE1E1UQ/
    - Needs short HDMI-mini HDMI cable, hard to find
    - e-ink is another option: seeedstudio.com


### POSSIBLE HARDWARE CONFIGURATION

![Bluetooth configuration](https://github.com/babarrett/steno-in-the-middle/blob/master/bluetooth_config.png)



### HARDWARE ASSUMPTIONS

1. Use one Raspberry Pi Zero W with USB to keyboard via a OTG cable, and Bluetooth to a PC, or

* Possible replacements for Raspberry Pi Zero is Raspberry Pi 4, using 2 USBs. (Unproven.)



### SOFTWARE DEVELOPMENT PLAN

Need to determine:

* Have to power the Raspberry separately anyway as something will need to power the keyboard.

On Mac system, proof of concepts:

* (done) Install Raspberry Pi Zero: OS, SSH over USB, SSH over WiFi, update OS software, install Python3
* (done) Start github repository for the project
* Clone, examine "Bluetooth Keyboard with a Raspberry Pi and Python" source. For background see:
    - [Yet Another Pointless Tech Blog](http://yetanotherpointlesstechblog.blogspot.com/2016/04/emulating-bluetooth-keyboard-with.html),
    and related links
    - Download source from: [github.com/yaptb](https://github.com/yaptb/BlogCode/tree/master/btkeyboard)
* Get "Bluetooth Keyboard with a Raspberry Pi and Python" working (Code is from 2016, likely needs updating)
* Clone, examine [Plover source](https://github.com/openstenoproject/plover)
* Look more at Charley's [Running Plover on a Raspberry Pi](https://stenomod.blogspot.com/2017/03/running-plover-on-raspberry-pi.html) code. Update to current libraries and Python, or use as a guide to redevelop a similar system.
* Get Plover running "headless," perhaps using stdin / stdout to test.
* Test basic Plover features and logic.
* Merge "Bluetooth Keyboard" with "headless Plover."
* Test, test, test, and debug.
* Add features.
* Repeat testing.

