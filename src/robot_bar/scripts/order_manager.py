#!/usr/bin/env python3
"""
    Nodo che legge l'ordine e lo invia al delivery_manager
    con un ordine ogni 70 secondi.
"""

import rospy
import rosnode
from robot_bar.msg import Order
from std_msgs.msg import String
import random
import threading
import time

def callback_consegna(msg):
    rospy.loginfo(f"[order_manager] - [CONFERMA] {msg.data}")

def invia_ordini(pub):
    i = 1
    while not rospy.is_shutdown():
        ordine = Order()
        ordine.id_ordine = f"ORD00{i}"
        ordine.prodotto = "Beer"
        ordine.tavolo = random.choice([1, 2, 3, 4])

        rospy.loginfo(f"[order_manager] Inviando ordine:\n{ordine}")
        pub.publish(ordine)
        i += 1

        time.sleep(70)  # Aspetta 70 secondi prima di inviare un nuovo ordine

def order_manager():
    rospy.init_node('order_manager', anonymous=True)
    rospy.loginfo("[order_manager] Avvio del nodo order_manager")

    # Attendi che Gazebo sia pronto
    rospy.wait_for_service('/gazebo/set_model_state')
    rospy.loginfo("[order_manager] Il servizio /gazebo/set_model_state è disponibile, proseguo...")

    rospy.sleep(2)   # <-- aspetto che gli altri nodi si registrino

    pub = rospy.Publisher("/ordine", Order, queue_size=10, latch=True)
    rospy.Subscriber("/consegna_completata", String, callback_consegna)

    # Avvia il thread per l'invio degli ordini
    threading.Thread(target=invia_ordini, args=(pub,), daemon=True).start()

    rospy.spin()

if __name__ == '__main__':
    order_manager()
