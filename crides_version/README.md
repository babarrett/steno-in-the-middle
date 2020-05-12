# Steno in the middle, Crides version README.md


### Background
* Creator: **crides**.
* Source: Plover Discord server, firmware / date: May 12, 2020
    - [Discord starting message](https://discordapp.com/channels/136953735426473984/564203903692832778/709542884453515314)
    - "I can finally handle a subset of all the Plover commands, which means a lot of the punctuations are working, along with caps, numbers, and prefixs and suffixs. And in fact, I'm stenoing without Plover right now!"
    - Except I need to hit enter with another keyboard
* Connection method:
    - `Kbd(SDCard and a solderable SDCard socket/reader/breakout board and a 32u4 based keyboard, with an empty SPI port) --> USB --> Host`
    - That is to say, a keyboard with SD card built in.
    - No Plover! He's emulating the Plover functionality.

* Configuration also includes:
    - None.

### Project Status
* firmware in qmk, dict compiler in compiler, written in Rust
* Requires hitting "enter" on another keyboard.
* I can implement the most used features of Plover on a keyboard, but I still need more time to refine the design.



### General principals, methods
* Currently I'm just turning the whole dict into a tree structure, parse all the strokes to 3-byte integers, parse the entries into raw strings and attributes, and compile it into binary
* I'm not implementing the Plover commands directly on the chip (in fact I don't plan to), but instead turning the whole entry into a single command with a raw string entry and some attributes (is there space before, after, is the next word caps, etc), and use those attributes on the chip.


### Pros
* Minimal hardware solution
* Steno code built into the keyboard

### Cons
* Requires a special-built keyboard, or a HW/SW hack of existing one.

### Resources
* [Repository](https://github.com/crides/steno)



