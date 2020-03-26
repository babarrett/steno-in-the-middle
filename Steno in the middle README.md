
# Steno in the middle README.md
## OVERVIEW

### "Plover in the middle" Goals:
* Create a single, stand-alone, hardware and software interface that attaches between a keyboard and host computer (Windows, macOS, Linux, etc.)
* The interface executes a large subset of Plover code.
* The interface receives steno output from the keyboard, interprets the chords, and sends standard USB HID keyboard keycodes to the host computer (as if the text was typed by an operator).
* The interface can be transfered between any combination of host computers and "Plover compatible" (Steno) keyboards.
* Ideally, works with USB (NKRO), Gemini PR, and TX Bolt protocols. TBD.

### "Plover in the middle" characteristics:
* Minimal viable product:
    - Use with a "Plover compatible" (Steno) keyboard...
    - connected to an off-board microcomputer...
    - that runs Plover derived software.
    - The other end of the microcomputer connects, through a USB port to any host computer.
    - Portable. (Hopefully not much bigger than 2x2x4".)
    - There are no hardware changes or software installations needed for the keyboard or the host computer.
    The Plover-in-the-middle system is totally independant.
* Add: Save briefs on the go. (A second SD card could be useful, though not required.)
* Add: Programmable "switch" for 3 "modes"
    - Output to host computer
    - Write to SD card datafile (stand-alone, off-line recording)
    - Output to host computer, ane write to SD card at the same time
* Add: WiFi access to any smart-phone or tablet and use the display via SSH, VNC, or web server for setings, brief definition, and displaying resultant text when writing to SD or...
* Add: ...Screen to display resultant text when writing to SD. A 3.5" screen, or even less, may be enough.
* Add: Some kind of case.
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
* Smart phone or tablet (which you alreqaddy have) for display.

Later, as needed:

* 1 Raspberry Pi case
* 1 LiPo battery and Charging circuit, or USB power brick
* 1 Monitor screen $22.50 for 5" https://www.amazon.com/gp/product/B00YE1E1UQ/
    - Needs short HDMI-mini HDMI cable, hard to find
    - e-ink is another option: seeedstudio.com


### POSSIBLE HARDWARE CONFIGURATIONS

![Ideal configuration](https://github.com/babarrett/steno-in-the-middle/blob/master/ideal_config.png)

![Bluetooth configuration](https://github.com/babarrett/steno-in-the-middle/blob/master/bluetooth_config.png)

![Two Raspberry Pis](https://github.com/babarrett/steno-in-the-middle/blob/master/2pis_config.png)



### OUTSTANDING PROBLEMS TO SOLVE

* Can Raspberry Pi handle 2 USBs at the same time? (Keyboard and host) If not then
the Raspberry Pi needs to read the keyboard output from the serial I/O, so PS/2 interface.

* I don't see a way to get a Raspberry Pi Zero W to handle 2 USBs, one as host and 1 as client.
There may be ways to do it that I am unaware of. The best I can think of at the moment is:
    1. Use one Raspberry Pi Zero W with USB to keyboard via a OTG cable, and Bluetooth toa PC, or
    2. Use the main Raspberry Pi Zero W as the client to the host,
    add a second Raspberry Pi Zero to the system. It would be the USB host for the keyboard.
    It would receive keystrokes and pass them onto the "main" Raspberry Pi Zero W via UART,
    SPI, or I2C. This is a huge amount of overhead for the task at hand.

* Possible replacements for Raspberry Pi Zero that may support a host and device USB at the same time:

    * Additional Raspberry Pi Zero for keyboard USB to UART.
    * Orange Pi PC. Three USB 2.0 HOST, one USB 2.0 OTG. $15.
    * Orange Pi Zero LTS. One USB 2.0 HOST, one USB 2.0 OTG. $14.50. 512MB. Ethernet & WiFi.
    * Orange Pi One H3 512MB Quad-core Support Ubuntu Linux. One USB 2.0 HOST, one USB 2.0 OTG. $14.30 shipped, China.
    * ODROID-C2. 4 x USB 2.0 Host; 1 x USB OTG (power + data capable).
    * Libre Computer AML-S905X-CC / ALM-S805X-A. (Le Potato). USB 3.0, 2GB ram. No WiFi or bluetooth.



### SOFTWARE DEVELOPMENT PLAN

Need to determine:

* Power requirements for Raspberry Pi + keyboard. If "too high" we'll need to
power the Raspberry Pi separately. Likely have to power the Raspberry seperatly
anyway as something will need to power the keyboard.

On Mac system, proof of concepts:

* (done) Install Raspberry Pi Zero: OS, SSH over USB, SSH over WiFi, update OS software, install Python3
* (done) Start github repository for the project
* Clone, examine "Bluetooth Keyboard with a Raspberry Pi and Python" source. For background see:
    - [Yet Another Pointless Tech Blog](http://yetanotherpointlesstechblog.blogspot.com/2016/04/emulating-bluetooth-keyboard-with.html),
    and related links
    - Download source from: [github.com/yaptb](https://github.com/yaptb/BlogCode/tree/master/btkeyboard)
* Get "Bluetooth Keyboard with a Raspberry Pi and Python" working (Code is from 2016, likely needs updating)
* Clone, examine [Plover source](https://github.com/openstenoproject/plover)
* Get Plover running "headless," perhaps using stdin / stdout to test.
* Test basic Plover features and logic.
* Merge "Bluetooth Keyboard" with "headless Plover."
* Test, test, tst, and debug.

