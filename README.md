# Lightn1ng0_AI_Aimbot
Free AI Aimbot for any game

![Preview](preview.png)

## Features
- Everything that is free from the launcher
- Everything that you get with tier 1 from the launcher
- Adjust settings live from the menu
- Everything that you get with tier 2 from the launcher
- Hot swapping model
- Hot swapping inference mode
- Hot swapping yolo version
- Hot swapping screenshot size
- Recoil control
- Overlay (testing purposes --> overlay causes detection issues)
- Max move speed
- Keybind configurator
- Mouse input methods (default is win32api, razer, arduino)

## Controller support
- Should work with xbox controllers and playstation controllers (if lucky, maybe a generic one would work)
- Select either dualshock for playstation or xbox for xbox
- You need to install the vigem bus driver --> https://github.com/nefarius/ViGEmBus/releases/download/v1.22.0/ViGEmBus_1.22.0_x64_x86_arm64.exe
- You will also need to install hidhide --> https://github.com/nefarius/HidHide/releases/download/v1.5.212.0/HidHide_1.5.212_x64.exe
- Setup video --> coming soon, for now ask me in discord on how to

## Razer support
- Works only if you have a razer mouse plugged in to your computer
- You need to install razer synapse 3 with the macro module https://www.razer.com/synapse-3
- Credits to https://github.com/0736b/rzctl-py/tree/main for the driver and the python file for it

![Razer](razer.png)

## Arduino support
- You can use any arduino that supports the mouse library --> https://docs.google.com/spreadsheets/d/1VEzH8ou9MyX5zUId5USZp7kFP-7_YiLcAGa4o8niIM4/edit?usp=sharing
- You can use an usb host shield if you want
- Download and upload Mouse.ino or MouseShield.ino file to arduino depending if you have an usb host shield or not
- Automatically tries to find the arduino com port when starting (you can still manually configure it)
- Credits to https://github.com/TrevorSatori/Leonardo/tree/main (for a huge part of the Mouse.ino)
- Thanks to duurtlang on discord for helping me out debugging Mouse.ino (Because I don't have an arduino myself)

## Issues
- No configuration saving atm :/
