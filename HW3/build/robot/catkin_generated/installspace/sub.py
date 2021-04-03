#!/usr/bin/env python3
import rospy
from robot.msg import mod_Header
from geometry_msgs.msg import Pose2D
import matplotlib.pyplot as plt
from std_msgs.msg import String


def EncoderCallback(data):
    rospy.loginfo("Time: %s encLeft: %u encRight: %u" % (data.header.frame_id, data.encL, data.encR))

def PoseCallback(data_2):
    rospy.loginfo("Coordinate X %f Coordinate Y %f Direction %f" % (data_2.x, data_2.y, data_2.theta))

def Matplot(signal):
    rospy.loginfo("Signal %s" % (signal.data))

def listener():
    rospy.init_node('EncoderAndPoseReceiver', anonymous=True)
    rospy.Subscriber("Encoder", mod_Header, EncoderCallback)
    rospy.Subscriber("Pose", Pose2D, PoseCallback)
    rospy.Subscriber("Signal", String, Matplot)

    rospy.spin()

if __name__ == '__main__':
    listener()