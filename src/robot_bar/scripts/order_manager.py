#!/usr/bin/env python3
"""
    Nodo che legge l'ordine e lo invia al delivery_manager per gestirlo
"""

import rospy
from std_msgs.msg import String
from robot_bar.msg import Order  # Importa il tuo messaggio custom

def order_manager():
    rospy.init_node('order_manager', anonymous=True)
    rate = rospy.Rate(10)
    pub = rospy.Publisher("/ordine", Order, queue_size=10)
    # while not rospy.is_shutdown:
    for i in range(10):
        ordine = Order()
        ordine.id_ordine = "ORD001"
        ordine.prodotto = "Espresso"
        ordine.tavolo = 3

        rospy.loginfo(f"Inviando ordine: {ordine}")
        pub.publish(ordine)
        rate.sleep()  # Mantiene il nodo in esecuzione

if __name__ == '__main__':
    order_manager()
