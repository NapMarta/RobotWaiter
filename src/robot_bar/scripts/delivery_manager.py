#!/usr/bin/env python3
"""
    Nodo che riceve l'ordine da order_manager e sposta il robot al tavolo corrispondente
    Client del servizio GetTablePosition
"""

import rospy
import rosnode
from std_msgs.msg import String
from robot_bar.msg import Order, RobotMove
from robot_bar.srv import GetTablePosition

def get_position(tavolo):
    rospy.wait_for_service('get_table_position')
    try:
        get_table_position = rospy.ServiceProxy('get_table_position', GetTablePosition)
        return get_table_position(tavolo)
    except rospy.ServiceException as e:
        rospy.logerr(f"Errore chiamando il servizio: {e}")
    


def order_callback(msg):
    rospy.loginfo(f"Ordine ricevuto: ID={msg.id_ordine}, Prodotto={msg.prodotto}, Tavolo={msg.tavolo}")
    
    # Chiamare il servizio per ottenere la posizione del tavolo
    response = get_position(msg.tavolo)
    rospy.loginfo(f"La posizione del tavolo {msg.tavolo} è (x: {response.x}, y: {response.y})")

    # Pubblicare il comando di movimento
    move_pub = rospy.Publisher('/movimento_robot', RobotMove, queue_size=10, latch=True)
    move_msg = RobotMove(tavolo=msg.tavolo, x=response.x, y=response.y)
    move_pub.publish(move_msg)
    rospy.loginfo(f"Inviato comando al robot per il tavolo {msg.tavolo}")
        


def delivery_manager():
    rospy.init_node('delivery_manager', anonymous=True)
    rospy.loginfo("Avvio del nodo delivery_manager")
    rospy.wait_for_service('/gazebo/set_model_state')
    rospy.loginfo("Il servizio /gazebo/set_model_state è disponibile, proseguo...")


    rospy.Subscriber("/ordine", Order, order_callback)
    rospy.loginfo("delivery_manager in ascolto su /ordine...")
    rospy.spin()

if __name__ == '__main__':
    delivery_manager()
