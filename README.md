# Lightn1ng0_AI_Aimbot
Free AI Aimbot for any game

<p align="center">
  <img src="imgs/preview.png" height="400px" />
</p>

## Features
- Yolov5 and Yolov8
- Sensitivity
- Confidence
- Triggerbot
- Recoil control
- Aim shake
- Toggle or hold activation
- Keybind configurator
- Max fps
- Max move speed
- Preview
- Overlay
- Mask left/right or both
- Model size (detection area)
- Inference modes: pytorch (cpu), onnx (cpu, directml = any gpu), openvino (cpu, intel gpu) and tensorrt (nvidia gpu)
- No restart needed to apply settings

## Controller support
- Should work with xbox controllers and playstation controllers (if lucky, maybe a generic one would work)
- Select either dualshock for playstation or xbox for xbox
- You need to install the vigem bus driver -->  
https://github.com/nefarius/ViGEmBus/releases/download/v1.22.0/ViGEmBus_1.22.0_x64_x86_arm64.exe
- You will also need to install hidhide -->  
https://github.com/nefarius/HidHide/releases/download/v1.5.212.0/HidHide_1.5.212_x64.exe
- Setup video --> coming soon, for now ask me in discord on how to

<p align="center">
  <img src="imgs/dualshock.png" height="250px" />
</p>

## Razer support
- Works only if you have a razer mouse connected to your computer when starting the code
- You need to install razer synapse 3 with the macro module https://www.razer.com/synapse-3
- Credits to https://github.com/0736b/rzctl-py/tree/main for the driver and the python file for it

<p align="center">
  <img src="imgs/razersetup.png" height="250px" />
  <img src="imgs/razer.png" width="75%" />
</p>

## Arduino support
- You can use any arduino that supports the mouse library -->  
https://docs.google.com/spreadsheets/d/1VEzH8ou9MyX5zUId5USZp7kFP-7_YiLcAGa4o8niIM4/edit?usp=sharing
- You can use an usb host shield if you want
- Download and upload Mouse.ino or MouseShield.ino file to arduino depending if you have an usb host shield or not
- Automatically tries to find the arduino com port when starting (you can still manually configure it)
- Credits to https://github.com/TrevorSatori/Leonardo/tree/main (for a huge part of the Mouse.ino)
- Thanks to duurtlang on discord for helping me out debugging Mouse.ino (Because I don't have an arduino myself)

<p align="center">
  <img src="imgs/arduino.png" height="250px" />
</p>

## Issues
- No configuration saving atm :/
