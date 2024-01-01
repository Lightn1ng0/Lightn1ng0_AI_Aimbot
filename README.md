# Lightn1ng0_AI_Aimbot
Lightn1ng0's custom code for the rootkit launcher.
The point of this code is being able to change settings and swap models without restarting anything.

![Preview](preview.png)

This custom code aimbot will load the settings and configuration from the launcher.  
The code has all features from the launcher + more. Except for the fov circle.  
The code uses the model files from the launcher.  
Install razer synapse 3 with the macro module if you want to use the razer input method.  

## Features
### Tier 0 (free)
- Everything that is free from the launcher

### Tier 1 (byte and infrequent volunteers)
- Everything that you get with tier 1 from the launcher
- Adjust settings live from the menu

### Tier 2 (kilobyte and frequent volunteers)
- Everything that you get with tier 2 from the launcher
- Hot swapping model
- Hot swapping inference mode
- Hot swapping yolo version
- Hot swapping screenshot size
- Recoil control
- Overlay
- Max move speed
- Keybind configurator
- Mouse input methods (default is win32api, razer)
  
## Issues
- Converting model to onnx on amd or cpu does not work --> use the launcher to do this
- Fov circle not implemented
- Sometimes bettercam stops working
- Code will not detect models that don't start with the prefix v5 or v8. (It will load models without this prefix when passed from the launcher)
