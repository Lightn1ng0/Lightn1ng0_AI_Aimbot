import serial.tools.list_ports
import serial
import time

arduino = None
ports = list(serial.tools.list_ports.comports())
for port in ports:
    if "Arduino" in port.description:
        arduino = serial.Serial(port, 9600, timeout=1)

while True:
    print("Mouse move X:")
    mouse_move_x = str(input())
    print("Mouse move y:")
    mouse_move_y = str(input())
    print("Mouse click (0/1):")
    mouse_click = str(input())

    time.sleep(4)

    arduino.write("{}:{}:{}x".format(mouse_move_x, mouse_move_y, 1).encode())
