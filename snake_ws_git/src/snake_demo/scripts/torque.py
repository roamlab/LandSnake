#!/usr/bin/env python3
import rospy
import numpy as np
from snake_demo.msg import feedback_angles
from snake_demo.msg import calculations

k = 3550 # UNITS: N/m
r = 0.023622 #distance from spring to center, UNITS: m

t = calculations()
pub = rospy.Publisher("Calculations", torques, queue_size = 10)

timestamps_vector = np.zeros(4)
timestamps_difference = np.zeros(3)
angle_matrix = np.zeros((5,4))
velocity_matrix = np.zeros((5,3))

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
    
    t.torque1 = calculate_torque(enc_angle1, dxl_angle1)
    t.torque2 = calculate_torque(enc_angle2, dxl_angle2)
    t.torque3 = calculate_torque(enc_angle3, dxl_angle3)
    t.torque4 = calculate_torque(enc_angle4, dxl_angle4)
    t.torque5 = calculate_torque(enc_angle5, dxl_angle5)

    ### VELOCITY CALCULATION ###

    new_angle_vector = np.array([enc_angle1, enc_angle2, enc_angle3, enc_angle4, enc_angle5])
    angle_matrix = np.delete(angle_matrix, 0, axis = 1)
    angle_matrix = np.column_stack((angle_matrix, new_angle_vector))

    calculate_velocities()
    
    t.angvel1 = np.mean(velocity_matrix[0,:])
    t.angvel2 = np.mean(velocity_matrix[1,:])
    t.angvel3 = np.mean(velocity_matrix[2,:])
    t.angvel4 = np.mean(velocity_matrix[3,:])
    t.angvel5 = np.mean(velocity_matrix[4,:])

    if not rospy.is_shutdown():
        pub.publish(t)

def main():

    rospy.init_node("calculator", anonymous = False)
    rospy.Subscriber("feedback_angle_topic", feedback_angles, callback)
    rospy.spin()

def calculate_torque(enc_angle, dxl_angle):
    dtheta = enc_angle - dxl_angle
    F = -2*k*r*np.sin(np.deg2rad(dtheta/2))
    torque = r*F*np.sin(np.deg2rad(90-dtheta/2))
    return torque

def calculate_velocities():
    #calculate differences between current iter and past iter encoder angle
    timestamps_difference[0] = (timestamps_vector[1] - timestamps_vector[0])/1000000
    timestamps_difference[1] = (timestamps_vector[2] - timestamps_vector[1])/1000000
    timestamps_difference[2] = (timestamps_vector[3] - timestamps_vector[2])/1000000
    velocity_matrix[:,0] = (angle_matrix[:,1]-angle_matrix[:,0])/timestamps_difference[0]
    velocity_matrix[:,1] = (angle_matrix[:,2]-angle_matrix[:,1])/timestamps_difference[1]
    velocity_matrix[:,2] = (angle_matrix[:,3]-angle_matrix[:,2])/timestamps_difference[2]


if __name__=="__main__":
    try:
        main()
    except rospy.ROSInterrputException:
        pass
