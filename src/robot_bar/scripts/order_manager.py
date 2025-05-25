#!/usr/bin/env python3
"""
    Nodo che legge l'ordine e lo invia al delivery_manager
    con un ordine ogni 2 minuti.
"""

import rospy
import rosnode
from robot_bar.msg import Order
from std_msgs.msg import String
import random
import threading
import time

def callback_consegna(msg):
    rospy.loginfo(f"[CONFERMA] {msg.data}")

def invia_ordini(pub):
    i = 1
    while not rospy.is_shutdown():
        ordine = Order()
        ordine.id_ordine = f"ORD00{i}"
        ordine.prodotto = "Espresso"
        ordine.tavolo = random.choice([1, 2, 3, 4])

        rospy.loginfo(f"Inviando ordine: \n{ordine}")
        pub.publish(ordine)
        i += 1

        time.sleep(120)  # Aspetta 2 minuti prima di inviare un nuovo ordine

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

    pub = rospy.Publisher("/ordine", Order, queue_size=10)
    rospy.Subscriber("/consegna_completata", String, callback_consegna)

    # Avvia il thread per l'invio degli ordini
    threading.Thread(target=invia_ordini, args=(pub,), daemon=True).start()

    rospy.spin()

if __name__ == '__main__':
    order_manager()
