#!/usr/bin/env python3
"""
    Nodo che legge l'ordine e lo invia al delivery_manager per gestirlo
"""

import rospy
from robot_bar.msg import Order  # Importa il tuo messaggio custom
from std_msgs.msg import String
import random

def callback_consegna(msg):
    rospy.loginfo(f"[CONFERMA] {msg.data}")

def order_manager():
    rospy.init_node('order_manager', anonymous=True)
    rate = rospy.Rate(2)
    pub = rospy.Publisher("/ordine", Order, queue_size=10)
    rospy.Subscriber("/consegna_completata", String, callback_consegna)

    i = 1
    while not rospy.is_shutdown():
    # for i in range(5):
        ordine = Order()
        ordine.id_ordine = f"ORD00{i}"
        ordine.prodotto = "Espresso"
        ordine.tavolo = random.choice([1, 2, 3])

        rospy.loginfo(f"Inviando ordine: \n {ordine}")
        pub.publish(ordine)
        i += 1
        # rospy.sleep(10)  # Mantiene il nodo in esecuzione
        rate.sleep()

if __name__ == '__main__':
    order_manager()
