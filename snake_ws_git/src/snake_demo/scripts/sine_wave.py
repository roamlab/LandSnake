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
frequency=5*3.1415/2
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
        angles.angle1=amplitude*sin(1*(t1)+np.pi/2)#amplitude*sin(frequency*(time.time()-1*phase_offset))
        angles.angle2=amplitude*sin(1*(t1)+np.pi)#amplitude*sin(frequency*(time.time()-2*phase_offset))
        angles.angle3=amplitude*sin(1*(t1)+3*np.pi/2)#30.*sin(0.3*(t1)+np.pi/8)#amplitude*sin(frequency*(time.time()-3*phase_offset))
        angles.angle4=0.0#28.*sin(0.3*(t1)+np.pi/16)#30.*sin(1.*(t1))
        angles.angle5=0.0#amplitude*sin(frequency*(time.time()-5*phase_offset))
        pub.publish(angles)
        rate.sleep()

if __name__=="__main__":
    try:
        cmd_publisher()

    except rospy.ROSInterruptException:
        pass
