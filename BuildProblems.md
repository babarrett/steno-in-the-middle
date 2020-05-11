### Plover Discord / #software / May 10, 2020 (edited)

https://discordapp.com/channels/136953735426473984/144999734254370816/708977907095306332

[5:21 AM] chara: When trying to build from git I get the following error :

ERROR: Could not find a version that satisfies the requirement PyQt5-sip==4.19.13 (from -r requirements_distribution.txt (line 9)) (from versions: 4.19.17, 4.19.18, 4.19.19, 12.7.0, 12.7.1, 12.7.2)
ERROR: No matching distribution found for PyQt5-sip==4.19.13 (from -r requirements_distribution.txt (line 9))

[5:21 AM] chara: I already tried pip install PyQt5-sip==4.19.13, but there's also an error: 

ERROR: Could not find a version that satisfies the requirement PyQt5-sip==4.19.13 (from versions: 4.19.17, 4.19.18, 4.19.19, 12.7.0, 12.7.1, 12.7.2)
ERROR: No matching distribution found for PyQt5-sip==4.19.13

[5:23 AM] chara: (I run the most recent python version (3.8.2) on Windows 10.)
[6:11 AM] nimble: What command are you running to install the requirements?
[6:36 AM] a3947: From the error, it should be possible to manually edit the requirements/setup.cfg file to change the version (in the requirements_distribution.txt file) to a newer one...
[6:36 AM] a3947: Not sure what's happening. I think it's because pip does not preserve old package versions. https://stackoverflow.com/questions/5226311/
[6:39 AM] a3947: @Plover Developer Perhaps use >= or ~= instead?
[6:42 AM] nimble: Those are specific versions for reproducible builds.
[6:43 AM] nimble: See https://discordapp.com/channels/136953735426473984/136953809409802240/706262759687585864

[6:48 AM] chara: || What command are you running to install the requirements?
@nimble python -m pip install -r requirements.txt

[6:50 AM] chara: I changed the line to "PyQt5-sip>=4.19.13" and now it's running
[6:52 AM] nimble: You should run pip install .[gui_qt]. There's more information in that link.
[6:55 AM] chara: Hmm.. with this command I get "FileNotFoundError: [WinError 2] Das System kann die angegebene Datei nicht finden: 'c:\users\[usrname]\appdata\local\programs\python\python38\lib\site-packages\plover-4.0.0.dev8-py3.8.egg'
[6:57 AM] chara:
See https://discordapp.com/channels/136953735426473984/136953809409802240/706262759687585864
@nimble As it's already mentioned in that link.. I also discover that it's not simply done with running the install script :frowning2: I guess you have to familiarize deeper with (at least) Python

[7:02 AM] nimble: Ah, I don't know enough about pip to help with that. Sorry.
[7:05 AM] chara: No problem, thank you for the link! 
    "pip install ." lead to "Successfully installed plover-4.0.0.dev8" :slight_smile:
[7:05 AM] chara: (at least)
[7:21 AM] chara: :smiley: I'm absolutely happy: It really worked to build Plover from git, even as standalone distribution.
Thank you for your help!!

