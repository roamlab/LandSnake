#!/usr/bin/env python

import rospy
from time import sleep
import random
from snake_demo.msg import cmd_angles

ANGLE = 10

def cmd_publisher():
    pub = rospy.Publisher('cmd_angle_topic', cmd_angles, queue_size=3)
    rospy.init_node('cmd_publisher', anonymous=False)
    rate = rospy.Rate(100) # 1 Hz

    angles=cmd_angles()
    angles.angle1=0
    angles.angle2=0
    angles.angle3=0
    angles.angle4=0
    angles.angle5=0
    pub.publish(angles)

    sleep(5)
    
    angles=cmd_angles()
    angles.angle1=ANGLE
    angles.angle2=ANGLE
    angles.angle3=ANGLE
    angles.angle4=ANGLE
    angles.angle5=ANGLE
    pub.publish(angles)

    

if __name__=="__main__":
    try:
        cmd_publisher()

    except rospy.ROSInterruptException:
        pass