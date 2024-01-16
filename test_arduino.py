import serial.tools.list_ports
import serial
import time

arduino = serial.Serial("COM6", 9600, timeout=1)

while True:
    print("Mouse move X:")
    mouse_move_x = str(input())
    print("Mouse move y:")
    mouse_move_y = str(input())
    print("Mouse click (0/1):")
    mouse_click = str(input())

    time.sleep(4)

    arduino.write("{}:{}:{}x".format(mouse_move_x, mouse_move_y, mouse_click, 'x').encode())
