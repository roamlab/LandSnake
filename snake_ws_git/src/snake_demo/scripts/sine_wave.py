#!/usr/bin/env python

import rospy
from numpy import sin as sin
import time
from time import sleep
import random
from snake_demo.msg import cmd_angles
amplitude=15
frequency=3.1415/2
phase_offset=.05

def cmd_publisher():
    pub = rospy.Publisher('cmd_angle_topic', cmd_angles, queue_size=10)
    rospy.init_node('cmd_publisher', anonymous=False)
    rate = rospy.Rate(1) # 1 Hz
    while not rospy.is_shutdown():
        angles=cmd_angles()
        angles.angle1=amplitude*sin(frequency*(time.time()-1*phase_offset))
        angles.angle2=amplitude*sin(frequency*(time.time()-2*phase_offset))
        angles.angle3=amplitude*sin(frequency*(time.time()-3*phase_offset))
        angles.angle4=amplitude*sin(frequency*(time.time()-4*phase_offset))
        angles.angle5=amplitude*sin(frequency*(time.time()-5*phase_offset))
        pub.publish(angles)
        rate.sleep()

if __name__=="__main__":
    try:
        cmd_publisher()

    except rospy.ROSInterruptException:
        pass
