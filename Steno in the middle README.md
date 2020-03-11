
# Steno in the middle README.md
## OVERVIEW

### "Plover in the middle" Goals:
* Create a single, stand-alone, hardware interface that attaches between a keyboard and host computer (Windows, macOS, Linux, etc.)
* The interface executes a large subset of Plover code.
* The interface receives steno output from the keyboard, interprets the chords, and sends standard USB HID keycodes to the host computer (as if the text was typed by an operator).
* The interface can be transfered between any combination of host computer and "Plover compatible" (Steno) keyboard.
* Ideally, works with USB (NKRO), Gemini PR, and TX Bolt protocols. TBD.

### "Plover in the middle" characteristics:
* Minimal viable product:
    - Use with a "Plover compatible" (Steno) keyboard,
    - connected to an off-board microcomputer,
    - that runs Plover derived software.
    - The other end of the microcomputer connects, through a USB port to any host computer.
    - Portable. (Hopefully not much bigger than 2x2x4".)
    - There are no hardware changes needed to the keyboard or the host computer
* Add: Save briefs on the go. (2nd SD card may be useful)
* Add: Programmable "switch" for 3 "modes"
    - Write to host computer
    - Write to SD card datafile (off-line recording)
    - Write to both at the same time
* Add: Screen to display resultant text when writing to SD. 3.5" or even less may be enough.
* Add: Some kind of case.
* Add: Battery
* Add: ...and charger


### POSSIBLE HARDWARE

Current thinking, single units, for development

* 1 Keyboard that supports TX Bolt or USB(NKRO) protocols. Use your own.
* 1 Raspberry Pi Zero W starter pack \~$27. https://www.amazon.com/dp/B0748MPQT4
    - Runs Linux, Python, Apache, Linux and USB Gadget to simulate a keyboard to host.
* 1 USB-A Add-on Board for connecting RPi W to host computer $10. https://www.amazon.com/dp/B07DBL3WYQ
* 1 SD card, 32+GB; 64GB fast (270Mbs) $33;  https://www.amazon.com/dp/B07QM348D9

Later, as needed:

* 1 Raspberry Pi case
* 1 Monitor screen $22.50 for 5" https://www.amazon.com/gp/product/B00YE1E1UQ/
    - Needs short HDMI-mini HDMI cable, hard to find
    - e-ink is another option: seeedstudio.com
* 1 LiPo battery or USB power brick
* 1 Charging circuit

### Software Development Plan

On Mac system:

* Clone, examine Plover source
* Get it running "headless"
* change input/output to stdin / stdout to test basic logic

