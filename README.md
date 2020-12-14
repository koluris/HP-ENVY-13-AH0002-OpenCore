# HP-ENVY-13-AH0002-OpenCore
Attempt to Hackintosh a 13" HP ultrabook

### Overall
So far the build is awesome, cold boot time to Mac in 16 seconds!

### Specifications

* Processor: Core i5-8250U 1.6GHz (Turbo Boost up to 3.4GHz)
* Graphics: Intel HD620 (Up to 2GB of shared mem) / 1080p 24bit
* RAM: 8GB DDR3 2133MHz
* Hard Disk: PCI NVMe 256GB SSD
* Wifi & Bluetooth: Intel Dual Band Wireless-AC 7265

![About](https://raw.githubusercontent.com/dkoluris/HP-ENVY-13-AH0002-OpenCore/master/Screenshots/About.jpg)

### What is near 100% completed

* HD620 2GB / Metal / Fixed RGB Banding / DRM works on Chrome
* Touchscreen with Gestures
* USB-C DP to 4K Monitor/TV (Sleep laptop at least once on a cold boot to make this work)
* ALC285 Speaker (4 speakers) / Mic / Headphones
* Brightness, KB Backlit, Volume shortcuts
* Trackpad Gestures / Doesn't stall after KB press
* USB Ports USB2/3/C
* Webcam
* SD Card
* Batt. indicator
* Proper CPU PM (Balanced)
* Sleep

![Trackpad](https://raw.githubusercontent.com/dkoluris/HP-ENVY-13-AH0002-OpenCore/master/Screenshots/Trackpad.jpg)

### Audio fix for 4 speakers
* Make a new aggregate device on MIDI Setup app which will contain both available output devices (Tweeter & B&O Bass speakers)
* Go to Sound Preferences and select that new aggregate device for main audio output
* In order to be able to adjust the volume for that new aggregate audio device, please make use of: <a href="https://github.com/rlxone/MultiSoundChanger/releases">MultiSoundChanger</a>

### Bonus
* Wifi & Bluetooth work, but with experimental driver and HeliPort app (expect some problems)
* ICC Profile that improves the screen's native color

![Bluetooth](https://raw.githubusercontent.com/dkoluris/HP-ENVY-13-AH0002-OpenCore/master/Screenshots/Bluetooth.jpg)

### What doesn't work
* Apple TV DRM

![Geekbench](https://raw.githubusercontent.com/dkoluris/HP-ENVY-13-AH0002-OpenCore/master/Screenshots/Scores.jpg)

### Notes
* Use HeliPort to facilitate Intel Wifi usage
* Use QuickESP to mount EFI partitions with ease (status bar app)

[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/ErfofIAxkd4/0.jpg)](https://www.youtube.com/watch?v=ErfofIAxkd4)

A big thanks to contribution of https://github.com/rholelaw and for the 4 Speakers fix, congratulations to https://github.com/djimc!
