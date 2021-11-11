#!/usr/bin/env python

import rospy
from time import sleep
import random
from snake_demo.msg import cmd_angles

def cmd_publisher():
    pub = rospy.Publisher('cmd_angle_topic', cmd_angles, queue_size=3)
    rospy.init_node('cmd_publisher', anonymous=False)
    rate = rospy.Rate(100) # 1 Hz
    while not rospy.is_shutdown():
        angles=cmd_angles()
        angles.angle1=10.
        angles.angle2=10.
        angles.angle3=10.
        angles.angle4=0.
        angles.angle5=0
        pub.publish(angles)
        rate.sleep()

if __name__=="__main__":
    try:
        cmd_publisher()

    except rospy.ROSInterruptException:
        pass
