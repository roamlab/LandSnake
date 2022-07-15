#!/usr/bin/env python3
import rospy
import numpy as np
from snake_demo.msg import feedback_angles
from snake_demo.msg import calculations

k = 3550 # UNITS: N/m
r = 0.023622 #distance from spring to center, UNITS: m

t = calculations()
pub = rospy.Publisher("Calculations", calculations, queue_size = 10)

timestamps_vector = np.zeros(8)
angle_matrix = np.zeros((5,8))

def callback(data):
    t.timestamp = data.timestamp
    global timestamps_vector
    global angle_matrix 

    timestamps_vector = timestamps_vector[1:]
    timestamps_vector = np.append(timestamps_vector, data.timestamp)

    enc_angle1 = data.enc_angle1
    enc_angle2 = data.enc_angle2
    enc_angle3 = data.enc_angle3
    enc_angle4 = data.enc_angle4
    enc_angle5 = data.enc_angle5

    dxl_angle1 = data.dxl_angle1
    dxl_angle2 = data.dxl_angle2
    dxl_angle3 = data.dxl_angle3
    dxl_angle4 = data.dxl_angle4
    dxl_angle5 = data.dxl_angle5
    
    ### VELOCITY CALCULATION ###
    
    #scale enc_angles down to [-1, 1]

    enc_angle1 = enc_angle1/57.3
    enc_angle2 = enc_angle2/57.3
    enc_angle3 = enc_angle3/57.3
    enc_angle4 = enc_angle4/57.3
    enc_angle5 = enc_angle5/57.3

    new_angle_vector = np.array([enc_angle1, enc_angle2, enc_angle3, enc_angle4, enc_angle5])
    angle_matrix = np.delete(angle_matrix, 0, axis = 1)
    angle_matrix = np.column_stack((angle_matrix, new_angle_vector))
   
    ## Calculated by taking the slope of current and a single previous point 
    time_delta = (timestamps_vector[7] - timestamps_vector[0])/1000000

    t.angvel1 = (angle_matrix[0][7] - angle_matrix[0][0])/time_delta
    t.angvel2 = (angle_matrix[1][7] - angle_matrix[1][0])/time_delta
    t.angvel3 = (angle_matrix[2][7] - angle_matrix[2][0])/time_delta
    t.angvel4 = (angle_matrix[3][7] - angle_matrix[3][0])/time_delta
    t.angvel5 = (angle_matrix[4][7] - angle_matrix[4][0])/time_delta
    
    t.enc_angle1 = enc_angle1
    t.enc_angle2 = enc_angle2
    t.enc_angle3 = enc_angle3
    t.enc_angle4 = enc_angle4
    t.enc_angle5 = enc_angle5

    if not rospy.is_shutdown():
        pub.publish(t)

def main():

    rospy.init_node("calculator", anonymous = False)
    rospy.Subscriber("feedback_angle_topic", feedback_angles, callback)
    rospy.spin()


if __name__=="__main__":
    try:
        main()
    except rospy.ROSInterrputException:
        pass
