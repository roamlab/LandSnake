#!/usr/bin/env python

import rospy
from numpy import sin as sin
import time
from time import sleep
import random
from snake_demo.msg import cmd_angles
import GS_timing as timing
import numpy as np
amplitude=25
frequency=1
phase_offset=.05

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
        angles.angle1=amplitude*sin(frequency*(t1)+1*np.pi/4)
        angles.angle2=amplitude*sin(frequency*(t1)+2*np.pi/4)
        angles.angle3=amplitude*sin(frequency*(t1)+3*np.pi/4)
        angles.angle4=amplitude*sin(frequency*(t1)+4*np.pi/4)
        angles.angle5=amplitude*sin(frequency*(t1)+5*np.pi/4)
        pub.publish(angles)
        rate.sleep()

if __name__=="__main__":
    try:
        cmd_publisher()

    except rospy.ROSInterruptException:
        pass
