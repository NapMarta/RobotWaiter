#!/usr/bin/env python3
"""
    Nodo che simula il movimento del robot verso il tavolo
"""

import rospy
from robot_bar.msg import RobotMove
from std_msgs.msg import String
import tf   # Transform Library
from gazebo_msgs.msg import ModelState
from gazebo_msgs.srv import SetModelState
import math


def move_callback(msg):
    rospy.loginfo(f"Muovendo il robot verso il tavolo {msg.tavolo} ({msg.x}, {msg.y})")
    
    # Simulazione di movimento
    state_msg = ModelState()
    state_msg.model_name = 'robot_waiter'  # Il nome del modello in Gazebo
    state_msg.pose.position.x = msg.x
    state_msg.pose.position.y = msg.y
    state_msg.pose.position.z = 0.1  # Altezza leggermente sopra il suolo
    yaw = math.atan2(msg.y, msg.x)
    quat = tf.transformations.quaternion_from_euler(0, 0, yaw)
    state_msg.pose.orientation.x = quat[0]
    state_msg.pose.orientation.y = quat[1]
    state_msg.pose.orientation.z = quat[2]
    state_msg.pose.orientation.w = quat[3]

    rospy.wait_for_service('/gazebo/set_model_state')
    try:
        set_state = rospy.ServiceProxy('/gazebo/set_model_state', SetModelState)
        resp = set_state(state_msg)
        if resp.success:
            rospy.loginfo("Robot spostato con successo.")
        else:
            rospy.logwarn("Errore nello spostamento del robot.")
    except rospy.ServiceException as e:
        rospy.logerr(f"Chiamata al servizio fallita: {e}")
    
    # Confermare la consegna
    pub = rospy.Publisher('/consegna_completata', String, queue_size=10)
    pub.publish(f"Ordine consegnato al tavolo {msg.tavolo}")
    rospy.loginfo(f"Ordine completato al tavolo {msg.tavolo}")

def robot_controller():
    rospy.init_node('robot_controller', anonymous=True)
    # Attendi che Gazebo sia pronto
    rospy.loginfo("Aspetto che /gazebo/set_model_state sia disponibile...")
    rospy.wait_for_service('/gazebo/set_model_state')
    rospy.loginfo("Servizio disponibile, avvio del nodo...")
    rospy.Subscriber('/movimento_robot', RobotMove, move_callback)
    rospy.spin()

if __name__ == '__main__':
    robot_controller()
