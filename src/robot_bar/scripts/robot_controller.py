#!/usr/bin/env python3
"""
  Nodo che simula il movimento del robot e il trasporto di un oggetto Beer,
  partendo dalla posizione corrente e gestendo internamente anche lo spawn di Beer.
"""

import rospy
import os
import tf
import math
import time

from robot_bar.msg import RobotMove
from std_msgs.msg import String
from gazebo_msgs.msg import ModelState
from gazebo_msgs.srv import (
    SetModelState,
    GetModelState,
    SpawnModel
)
from geometry_msgs.msg import Pose

# Percorso al file SDF di Beer
BEER_SDF = os.path.expanduser('~/.gazebo/models/beer/model.sdf')
BEER_NAME = 'Beer'

spawned_beer = False  # flag per spawnare una volta sola

def spawn_beer():
    global spawned_beer
    if spawned_beer:
        return

    rospy.wait_for_service('/gazebo/spawn_sdf_model')
    with open(BEER_SDF, 'r') as f:
        xml = f.read()

    spawn = rospy.ServiceProxy('/gazebo/spawn_sdf_model', SpawnModel)
    initial_pose = Pose()
    initial_pose.position.x = -1.5
    initial_pose.position.y = -1.5
    initial_pose.position.z = 0.1
    try:
        spawn(model_name=BEER_NAME,
              model_xml=xml,
              robot_namespace='',
              initial_pose=initial_pose,
              reference_frame='world')
        rospy.loginfo("Beer spawnata correttamente in (-2, -1).")
        spawned_beer = True
    except rospy.ServiceException as e:
        rospy.logerr(f"Errore spawn Beer: {e}")

def get_current_position(model_name='robot_waiter'):
    rospy.wait_for_service('/gazebo/get_model_state')
    try:
        get_state = rospy.ServiceProxy('/gazebo/get_model_state', GetModelState)
        resp = get_state(model_name, '')
        if resp.success:
            p = resp.pose.position
            return p.x, p.y
    except rospy.ServiceException as e:
        rospy.logerr(f"Errore get_model_state({model_name}): {e}")
    return 0.0, 0.0

def set_model_position(model_name, x, y, z=0.1, yaw=0.0):
    rospy.wait_for_service('/gazebo/set_model_state')
    try:
        set_state = rospy.ServiceProxy('/gazebo/set_model_state', SetModelState)
        msg = ModelState()
        msg.model_name = model_name
        msg.pose.position.x = x
        msg.pose.position.y = y
        msg.pose.position.z = z
        q = tf.transformations.quaternion_from_euler(0, 0, yaw)
        msg.pose.orientation.x = q[0]
        msg.pose.orientation.y = q[1]
        msg.pose.orientation.z = q[2]
        msg.pose.orientation.w = q[3]
        set_state(msg)
    except rospy.ServiceException as e:
        rospy.logerr(f"Errore set_model_state({model_name}): {e}")

def move_robot_and_cargo(x_dest, y_dest, cargo_name=None,
                         steps=60, delay=0.03, cargo_offset_z=0.5):
    x0, y0 = get_current_position('robot_waiter')
    dx = (x_dest - x0) / steps
    dy = (y_dest - y0) / steps

    rospy.wait_for_service('/gazebo/set_model_state')
    set_state = rospy.ServiceProxy('/gazebo/set_model_state', SetModelState)

    for i in range(steps+1):
        x = x0 + dx * i
        y = y0 + dy * i
        yaw = math.atan2(dy, dx)

        # Muovo robot
        robot_msg = ModelState()
        robot_msg.model_name = 'robot_waiter'
        robot_msg.pose.position.x = x
        robot_msg.pose.position.y = y
        robot_msg.pose.position.z = 0.1
        q = tf.transformations.quaternion_from_euler(0, 0, yaw)
        robot_msg.pose.orientation.x = q[0]
        robot_msg.pose.orientation.y = q[1]
        robot_msg.pose.orientation.z = q[2]
        robot_msg.pose.orientation.w = q[3]
        try:
            set_state(robot_msg)
        except rospy.ServiceException as e:
            rospy.logerr(f"Errore spostamento robot: {e}")
            break

        # Muovo cargo se presente
        if cargo_name and spawned_beer:
            cargo_msg = ModelState()
            cargo_msg.model_name = cargo_name
            cargo_msg.pose.position.x = x
            cargo_msg.pose.position.y = y
            cargo_msg.pose.position.z = cargo_offset_z
            cargo_msg.pose.orientation = robot_msg.pose.orientation
            try:
                set_state(cargo_msg)
            except rospy.ServiceException as e:
                rospy.logerr(f"Errore spostamento {cargo_name}: {e}")
                break

        time.sleep(delay)

def move_callback(msg):
    global spawned_beer
    rospy.loginfo("=== Consegna BEER in corso ===")

    # spawn Beer la prima volta
    spawn_beer()

    # Vai al frigorifero
    rospy.loginfo("Spostamento al frigo (-2, -1)…")
    move_robot_and_cargo(-2, -1)

    # Carica Beer
    rospy.loginfo("Carico BEER sul robot")
    x_b, y_b = get_current_position('robot_waiter')
    set_model_position(BEER_NAME, x_b, y_b, z=0.5)

    # Porta al tavolo
    rospy.loginfo(f"Spostamento al tavolo {msg.tavolo} ({msg.x}, {msg.y})…")
    move_robot_and_cargo(msg.x, msg.y, cargo_name=BEER_NAME, cargo_offset_z=0.5)

    # Rilascio Beer sul tavolo
    rospy.loginfo("Posiziono BEER sul tavolo")
    set_model_position(BEER_NAME, msg.x, msg.y, z=0.78)

    time.sleep(10)

    # conferma ordine
    pub = rospy.Publisher('/consegna_completata', String, queue_size=10, latch=True)
    pub.publish(f"Ordine consegnato al tavolo {msg.tavolo}")
    rospy.loginfo(f"Ordine completato al tavolo {msg.tavolo}")

def robot_controller():
    rospy.init_node('robot_controller', anonymous=True)
    rospy.loginfo("Avvio nodo robot_controller")
    rospy.wait_for_service('/gazebo/spawn_sdf_model')
    rospy.wait_for_service('/gazebo/get_model_state')
    rospy.wait_for_service('/gazebo/set_model_state')
    rospy.Subscriber('/movimento_robot', RobotMove, move_callback)
    rospy.spin()

if __name__ == '__main__':
    robot_controller()
