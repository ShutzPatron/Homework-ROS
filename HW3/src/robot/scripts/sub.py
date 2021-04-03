#!/usr/bin/env python
import rospy
from robot.msg import mod_Header
from geometry_msgs.msg import Pose2D
import matplotlib.pyplot as plt
import numpy as np

X = []
Y = []
U = []
V = []

def EncoderCallback(EncoderData):
    rospy.loginfo("Time: %s encLeft: %u encRight: %u" % (EncoderData.header.frame_id, EncoderData.encL, EncoderData.encR))
    

def PoseCallback(PoseData):
    rospy.loginfo("Coordinate X %f Coordinate Y %f Direction %f" % (PoseData.x, PoseData.y, PoseData.theta))
    X.append(PoseData.x)
    Y.append(PoseData.y)
    U.append(np.cos(PoseData.theta))
    V.append(np.sin(PoseData.theta))
    
def listener():
    rospy.init_node('EncoderAndPoseReceiver', anonymous=True)
    rospy.Subscriber("Encoder", mod_Header, EncoderCallback)
    rospy.Subscriber("Pose", Pose2D, PoseCallback)

    rospy.spin()

if __name__ == '__main__':
    try:
        listener()
    except rospy.ROSInterruptException:
        pass
