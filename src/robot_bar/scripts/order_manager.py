#!/usr/bin/env python3
"""
    Nodo che legge l'ordine e lo invia al delivery_manager
    con un ordine ogni 10 secondi.
"""

import rospy
import rosnode
from robot_bar.msg import Order
from std_msgs.msg import String
import random

def callback_consegna(msg):
    rospy.loginfo(f"[CONFERMA] {msg.data}")

def order_manager():
    rospy.init_node('order_manager', anonymous=True)
    # Attendi che Gazebo sia pronto
    while not rospy.is_shutdown():
        try:
            if '/gazebo' in rosnode.get_node_names():
                break
        except:
            pass
        rospy.sleep(1)

    # 0.5 Hz → 1 ordine ogni 50 secondi
    rate = rospy.Rate(0.5)
    pub = rospy.Publisher("/ordine", Order, queue_size=10)
    rospy.Subscriber("/consegna_completata", String, callback_consegna)

    i = 1
    while not rospy.is_shutdown():
        ordine = Order()
        ordine.id_ordine = f"ORD00{i}"
        ordine.prodotto = "Espresso"
        ordine.tavolo = random.choice([1, 2, 3, 4])

        rospy.loginfo(f"Inviando ordine: \n{ordine}")
        pub.publish(ordine)
        i += 1

        rate.sleep()

if __name__ == '__main__':
    order_manager()
