#!/usr/bin/env python3

import rospy
from numpy import sin as sin
import time
from time import sleep
import random
from snake_demo.msg import cmd_angles, feedback_angles
import GS_timing as timing
import numpy as np
import gym
from stable_baselines3 import PPO

models_dir = "models/3Link"

model_name = "Gait"

model_path = f"/home/user2021/LandSnake/snake_ws_git/src/snake_demo/scripts/{models_dir}/{model_name}.zip"

model = PPO.load(model_path)

angles = cmd_angles()

def callback(data):

    #construct observation space
    obs_space = [data.enc_angle1, data.enc_angle2]
    
    #determine next step
    action, _ = model.predict(obs_space)

    #publish angles
    angles.angle1 = action[0]*57.3 #convert back to degrees
    angles.angle2 = action[1]*57.3 #convert back to degrees

def main():

    rospy.init_node("cmd_publisher", anonymous=False)
    rospy.Subscriber("feedback_angle_topic", feedback_angles, callback)
    pub = rospy.Publisher('cmd_angle_topic', cmd_angles, queue_size = 10)
    rate = rospy.Rate(100) #1 hz
    while not rospy.is_shutdown():
        pub.publish(angles)
        rate.sleep()

if __name__ == "__main__":
    try:
        main()
    except rospy.ROSInterruptException:
        pass
            
