
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
    - Use with a "Plover compatible" (Steno) keyboard,
    - connected to an off-board microcomputer,
    - that runs Plover derived software.
    - The other end of the microcomputer connects, through a USB port to any host computer.
    - Portable. (Hopefully not much bigger than 2x2x4".)
    - There are no hardware changes or software installations needed for the keyboard or the host computer
* Add: Save briefs on the go. (A second SD card may be useful)
* Add: Programmable "switch" for 3 "modes"
    - Write to host computer
    - Write to SD card datafile (stand-alone, off-line recording)
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
    - But see below, there may be an alternative to the Raspberry Pi Zero that has a better selection of USB ports.
* 1 USB-A Add-on Board for connecting RPi W to host computer $10. https://www.amazon.com/dp/B07DBL3WYQ
* 1 SD card, 32+GB; 64GB fast (270Mbs) $33;  https://www.amazon.com/dp/B07QM348D9

Later, as needed:

* 1 Raspberry Pi case
* 1 Monitor screen $22.50 for 5" https://www.amazon.com/gp/product/B00YE1E1UQ/
    - Needs short HDMI-mini HDMI cable, hard to find
    - e-ink is another option: seeedstudio.com
* 1 LiPo battery and Charging circuit, or USB power brick
* Additional Raspberry Pi Zero for keyboard USB to UART.

Possible replacements for R Pi Zero:

* Orange Pi PC. Three USB 2.0 HOST, one USB 2.0 OTG. $15.
* Orange Pi Zero LTS. One USB 2.0 HOST, one USB 2.0 OTG. $14.50. 512MB. Ethernet & WiFi.
* Orange Pi One H3 512MB Quad-core Support Ubuntu Linux. One USB 2.0 HOST, one USB 2.0 OTG. $14.30 shipped, China.
* ODROID-C2. 4 x USB 2.0 Host; 1 x USB OTG (power + data capable).
* Libre Computer AML-S905X-CC / ALM-S805X-A. (Le Potato). USB 3.0, 2GB ram. No WiFi or bluetooth.


### OUTSTANDING PROBLEMS TO SOLVE

* I don't see a way to get a Raspberry Pi Zero W to handle 2 USBs, one as host and 1 as client. There may be ways to do it that I am unaware of. The best I can think of at the moment is:
    - Use the main Raspberry Pi Zero W as the client to the host
    - Add a Raspberry Pi Zero to the system. It would be the USB host for the keyboard. It would receive keystrokes and pass them onto the "main" Raspberry Pi Zero W via UARS, SPI, or I2C.
    - This is a huge amount of overhead for the task at hand.

### Software Development Plan

Need to determine:

* Can R Pi handle 2 USBs at the same time? (Keyboard and host) If not then  the R Pi needs to read the keyboard output from the serial I/O, so PS/2 interface.
* Power requirements for R Pi. If "too high" we'll need to power the R Pi separately.

On Mac system:

* (done) Start github repository for the project
* Clone, examine Plover source
* Get Plover running "headless"
* Change input/output to stdin / stdout to test basic logic

### Second USB port?
From here: https://www.element14.com/community/thread/38228/l/raspberry-pi-usb-output-from-gpio?displayFullThread=true

Use the onboard Raspberry Pi UART and connect the FT232 module to read in the serial data, as would be much quicker than doing your own Bit Bang routines.


```
Re: Raspberry pi USB output from GPIO
pthat Level 3: Ampere
pthat Jun 13, 2017 12:40 PM (in response to miksu)

Back in the day of Serial Ports and Parallel Ports on PC's you could connect the TX and RX(Serial) or the D0 (Parallel) lines to GPIO pins via a voltage shifter such as MAX232 and by sending out bytes at a low baud rate, read the Bits in as the pins went high and low, known as Bit Banging.

USB is different as you cannot just simply connect the data lines and do the same. Firstly is the data being sent is probably too fast to monitor the pins and it actually does a lot of other stuff such as handshaking before it even gets to this point.

If you really wanted to send data out of a USB port and read it in by monitoring the GPIO ports then you can setup your own Bit Bang Routines with FTDI modules based on the FT232 chip for serial and FT245 for parallel Data.

Probably easier just to use the onboard Raspberry Pi UART and connect the FT232 module to read in the serial data, as would be much quicker than doing your own Bit Bang routines.

Or just use the USB port on the Raspberry Pi to receive 64byte packets at a even faster speed.
```
