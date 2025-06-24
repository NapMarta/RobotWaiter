#!/usr/bin/env python3
"""
    Nodo che legge l'ordine e lo invia al delivery_manager
    uno alla volta, solo dopo che il precedente è stato consegnato.
"""

import rospy
from robot_bar.msg import Order
from std_msgs.msg import String
import random
import threading
import time

ordine_consegnato_event = threading.Event()

def callback_consegna(msg):
    rospy.loginfo(f"[order_manager] - [CONFERMA] {msg.data}")
    ordine_consegnato_event.set()

def invia_ordini(pub):
    i = 1
    while not rospy.is_shutdown():
        ordine_consegnato_event.wait()

        # Attendi 10 secondi prima di inviare il prossimo ordine
        rospy.loginfo("[order_manager] Attendo 10 secondi prima di inviare il prossimo ordine...")
        time.sleep(10)

        ordine = Order()
        ordine.id_ordine = f"ORD00{i}"
        ordine.prodotto = "Beer"
        ordine.tavolo = random.choice([1, 2, 3, 4])

        rospy.loginfo(f"[order_manager] Inviando ordine:\n{ordine}")
        pub.publish(ordine)
        i += 1

        ordine_consegnato_event.clear()

def order_manager():
    rospy.init_node('order_manager', anonymous=True)
    rospy.loginfo("[order_manager] Avvio del nodo order_manager")

    rospy.wait_for_service('/gazebo/set_model_state')
    rospy.loginfo("[order_manager] Il servizio /gazebo/set_model_state è disponibile, proseguo...")

    rospy.sleep(2)

    pub = rospy.Publisher("/ordine", Order, queue_size=10, latch=True)
    rospy.Subscriber("/consegna_completata", String, callback_consegna)

    ordine_consegnato_event.set()  # Per permettere l'invio del primo ordine

    threading.Thread(target=invia_ordini, args=(pub,), daemon=True).start()

    rospy.spin()

if __name__ == '__main__':
    order_manager()
