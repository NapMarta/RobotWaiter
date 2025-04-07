#!/usr/bin/env python3
"""
    Nodo che simula il movimento del robot verso il tavolo
"""

import rospy
from robot_bar.msg import RobotMove
from std_msgs.msg import String
import time

def move_callback(msg):
    rospy.loginfo(f"Muovendo il robot verso il tavolo {msg.tavolo} ({msg.x}, {msg.y})")
    
    # Simulazione di movimento
    time.sleep(5)
    
    # Confermare la consegna
    pub = rospy.Publisher('/consegna_completata', String, queue_size=10)
    pub.publish(f"Ordine consegnato al tavolo {msg.tavolo}")
    rospy.loginfo(f"Ordine completato al tavolo {msg.tavolo}")

def robot_controller():
    rospy.init_node('robot_controller', anonymous=True)
    rospy.Subscriber('/movimento_robot', RobotMove, move_callback)
    rospy.spin()

if __name__ == '__main__':
    robot_controller()
