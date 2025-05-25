#!/usr/bin/env python3
"""
    Nodo che simula il movimento del robot verso il tavolo in modo realistico, partendo dalla posizione corrente
"""

import rospy
from robot_bar.msg import RobotMove
from std_msgs.msg import String
import tf
from gazebo_msgs.msg import ModelState
from gazebo_msgs.srv import SetModelState, GetModelState
import math
import time

def get_current_position(model_name='robot_waiter'):
    """
    Ottiene la posizione corrente del robot da Gazebo
    """
    rospy.wait_for_service('/gazebo/get_model_state')
    try:
        get_state = rospy.ServiceProxy('/gazebo/get_model_state', GetModelState)
        response = get_state(model_name, '')
        if response.success:
            pos = response.pose.position
            return pos.x, pos.y
        else:
            rospy.logwarn("Impossibile ottenere la posizione corrente del robot.")
            return 0.0, 0.0
    except rospy.ServiceException as e:
        rospy.logerr(f"Errore nel recupero posizione: {e}")
        return 0.0, 0.0

def move_robot_gradually(x_dest, y_dest, steps=50, delay=0.1):
    """
    Muove il robot in modo graduale dalla posizione attuale a (x_dest, y_dest)
    """
    x_curr, y_curr = get_current_position()

    dx = (x_dest - x_curr) / steps
    dy = (y_dest - y_curr) / steps

    rospy.wait_for_service('/gazebo/set_model_state')
    set_state = rospy.ServiceProxy('/gazebo/set_model_state', SetModelState)

    for i in range(steps + 1):
        x = x_curr + dx * i
        y = y_curr + dy * i

        state_msg = ModelState()
        state_msg.model_name = 'robot_waiter'
        state_msg.pose.position.x = x
        state_msg.pose.position.y = y
        state_msg.pose.position.z = 0.1

        yaw = math.atan2(dy, dx)
        quat = tf.transformations.quaternion_from_euler(0, 0, yaw)
        state_msg.pose.orientation.x = quat[0]
        state_msg.pose.orientation.y = quat[1]
        state_msg.pose.orientation.z = quat[2]
        state_msg.pose.orientation.w = quat[3]

        try:
            set_state(state_msg)
        except rospy.ServiceException as e:
            rospy.logerr(f"Errore nel movimento graduale: {e}")
            break

        time.sleep(delay)

def move_callback(msg):
    rospy.loginfo(f"Muovendo il robot verso il tavolo {msg.tavolo} ({msg.x}, {msg.y})")

    move_robot_gradually(msg.x, msg.y)

    rospy.loginfo(f"Robot arrivato al tavolo {msg.tavolo}")

    time.sleep(10)
    # Confermare la consegna
    pub = rospy.Publisher('/consegna_completata', String, queue_size=10, latch=True)
    pub.publish(f"Ordine consegnato al tavolo {msg.tavolo}")
    rospy.loginfo(f"Ordine completato al tavolo {msg.tavolo}")

def robot_controller():
    rospy.init_node('robot_controller', anonymous=True)
    rospy.loginfo("Avvio del nodo robot_controller")

    rospy.wait_for_service('/gazebo/get_model_state')
    rospy.loginfo("Servizi disponibili, in attesa di richieste...")

    rospy.Subscriber('/movimento_robot', RobotMove, move_callback)
    rospy.spin()

if __name__ == '__main__':
    robot_controller()
