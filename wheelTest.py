import io_wrapper as hw
from picamera import PiCamera
from time import sleep

wheel = 0

camera = 0

if wheel == 0:
    print("Move Wheel...")
    while wheel != 1000:
        hw.motor_one_speed(-100)
        hw.motor_two_speed(-100)
        wheel = wheel + 1
        print(wheel)
        camera = PiCamera()
        camera.rotation = 180
        camera.resolution = (2592, 1944)
        camera.start_preview()
        sleep(5)
        camera.capture('/home/pi/Desktop/image.jpg')
        camera.stop_preview()

    print("Wheel Test Complete")
    hw.motor_one_speed(0)
    hw.motor_two_speed(0)
    
if camera == 0:
    print("Camera Test...")
    camera = PiCamera()
    camera.rotation = 180
    camera.resolution = (2592, 1944)
    camera.start_preview()
    sleep(5)
    camera.capture('/home/pi/Desktop/image.jpg')
    camera.stop_preview()

if camera == 1:
    camera = PiCamera()
    camera.rotation = 180
    camera.start_preview()
    camera.start_recording('/home/pi/Desktop/video.h264')
    sleep(15)
    camera.stop_recording()
    camera.stop_preview()

