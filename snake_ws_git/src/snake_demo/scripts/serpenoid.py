#!/usr/bin/env python

import rospy
from numpy import sin as sin
import time
from time import sleep
import random
from snake_demo.msg import cmd_angles
import GS_timing as timing
import numpy as np

'''
OPTIMAL VALUES GREY MAT

alpha = 40
frequency = 1
beta = 1

OPTIMAL VALUES GREY TABLE

alpha = 40
frequency = 0.65
beta = 2.2

'''

alpha = 55
frequency = 0.25 
beta = 2


def cmd_publisher():
    pub = rospy.Publisher('cmd_angle_topic', cmd_angles, queue_size=10)
    rospy.init_node('cmd_publisher', anonymous=False)
    rate = rospy.Rate(100) # 1 Hz
    starttime = timing.micros()
    while not rospy.is_shutdown():
        timenow = timing.micros()
        timenow = starttime-timenow
        t1 = timenow/1000000
        angles=cmd_angles()
        angles.angle1=alpha*sin(2*np.pi*frequency*(t1))
        angles.angle2=alpha*sin(2*np.pi*frequency*(t1) + beta)
        angles.angle3=alpha*sin(2*np.pi*frequency*(t1) + 2*beta)
        angles.angle4=alpha*sin(2*np.pi*frequency*(t1) + 3*beta)
        angles.angle5=alpha*sin(2*np.pi*frequency*(t1) + 4*beta)
        pub.publish(angles)
        rate.sleep()

if __name__=="__main__":
    try:
        cmd_publisher()

    except rospy.ROSInterruptException:
        pass
