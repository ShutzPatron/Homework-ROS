#!/usr/bin/env python3
import rospy
from geometry_msgs.msg import Twist
from std_msgs.msg import String
from geometry_msgs.msg import Pose2D
from math import pi
from robot.msg import mod_Header
from numpy import sin, cos

L = 0.5
r = 0.1
N = 4096
beta = 17.2 / (1.5 + 17.2)

def SpeedReceiver():
    
    vel_msg = Twist()

    print("Enter linear speed and distance")
    l_speed = float(input("Input your speed: "))

    print("Enter angular speed and angle")
    a_speed = float(input("Input your speed (degrees/sec): "))

    rad_a_speed = a_speed*2*pi/360

    if (l_speed >= 0):
        vel_msg.linear.x = abs(l_speed)
    elif (l_speed < 0):
        vel_msg.linear.x = -abs(l_speed)

    if (rad_a_speed >= 0):
        vel_msg.angular.z = -abs(rad_a_speed)
    elif (rad_a_speed < 0):
        vel_msg.angular.z = abs(rad_a_speed)
        
    vel_msg.linear.y=0
    vel_msg.linear.z=0
    vel_msg.angular.x = 0
    vel_msg.angular.y = 0

    return vel_msg.linear.x, vel_msg.angular.z


def encoder():
    rospy.init_node("EncoderAndPoseTransmitter", anonymous=True)
    vel_pub = rospy.Publisher("Encoder", mod_Header, queue_size=10)
    vel_msg = mod_Header()

    pos_pub = rospy.Publisher("Pose", Pose2D, queue_size=10)
    pos_msg = Pose2D()

    rate = rospy.Rate(10)
    
    V, Omega = SpeedReceiver()
    R = V / Omega
    v = [Omega * (R - L / 2), Omega * (R + L / 2)]
    w_target = [v[0] / r, v[1] / r]
    w = [0, 0]
    W = [0, 0]

    t0 = rospy.Time.now().to_sec()

    Exit = String()
    Exit.data = ""

    while not rospy.is_shutdown():
        t1 = rospy.Time.now().to_sec()
        dt = t1 - t0
        
        w[0] = w[0] * beta + (1 - beta) * w_target[0]
        w[1] = w[1] * beta + (1 - beta) * w_target[1]

        encL = int(w[0] * dt / 360 * N)
        encR = int(w[1] * dt / 360 * N)

        W[0], W[1] = (encL) * 2*pi / dt / N, (encR) * 2*pi / dt / N
        Omega = r / L * (W[1] - W[0])
        V = r / 2 * (W[0] + W[1])
        Grad =  Omega * t1 - Omega * t0
        y = V * sin(Grad) * t1 - V * sin(Grad) * t0
        x = V * cos(Grad) * t1 - V * cos(Grad) * t0
    
        vel_msg.header.frame_id = str(rospy.Time.now().to_sec())
        vel_msg.encL = encL
        vel_msg.encR = encR

        pos_msg.x = x
        pos_msg.y = y
        pos_msg.theta = Grad
        
        vel_pub.publish(vel_msg)
        pos_pub.publish(pos_msg)
        
        rate.sleep()

        if (dt > 30):
            pub_signal = rospy.Publisher("Signal", String, queue_size=10)
            Exit.data = "Stop!"
            pub_signal.publish(Exit)
            rospy.signal_shutdown("Time limit reached!")
        
if __name__ == '__main__':
    try:
        encoder()
    except rospy.ROSInterruptException:
        pass