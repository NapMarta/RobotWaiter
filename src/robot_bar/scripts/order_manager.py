#!/usr/bin/env python3
import rospy
from std_msgs.msg import String

def order_callback(msg):
    rospy.loginfo(f"Nuovo ordine ricevuto: {msg.data}")

def order_manager():
    rospy.init_node('order_manager', anonymous=True)
    rospy.Subscriber('/ordine', String, order_callback)
    rospy.spin()  # Mantiene il nodo in esecuzione

if __name__ == '__main__':
    order_manager()
