#!/usr/bin/env python
import io_wrapper as hw
import explorerhat as eh
from picamera import PiCamera
import sys
import json

with open('/home/pi/direction.json','r') as g:
    direction = json.load(g)

    print(direction)

    input = direction
    wheel = 1

def moveForward():
    hw.motor_one_speed(100)
    hw.motor_two_speed(100)

def moveBackwards():
    hw.motor_one_speed(-100)
    hw.motor_two_speed(-100)

def moveLeft():
    hw.motor_one_speed(0)
    hw.motor_two_speed(100)
    
def moveRight():
    hw.motor_one_speed(100)
    hw.motor_two_speed(0)

def stop():
    hw.motor_stop


if wheel == 1:
    while wheel != 20000:

        if(input =='F'):    
            moveForward()
            wheel= wheel+1

        if(input == 'B'):
            moveBackwards()
            wheel=wheel+1
            

        if(input == 'L'):
            moveLeft()
            wheel = wheel+1
            

        if(input == 'R'):
            moveRight()
            wheel = wheel+1
