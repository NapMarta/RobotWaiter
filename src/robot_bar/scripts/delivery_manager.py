#!/usr/bin/env python3
import rospy
from std_msgs.msg import String
from robot_bar.msg import Order

""" def order_callback(msg):
    rospy.loginfo(f"Ricevuto ordine: {msg.id_ordine}")
    
    # Chiamare il servizio per ottenere la posizione del tavolo
    # rospy.wait_for_service('/get_table_position')
    # try:
    #     get_position = rospy.ServiceProxy('/get_table_position', GetTablePosition)
    #     request = GetTablePositionRequest(tavolo=tavolo)
    #     response = get_position(request)
        
    #     # Pubblicare il comando di movimento
    #     move_pub = rospy.Publisher('/movimento_robot', RobotMove, queue_size=10)
    #     move_msg = RobotMove(tavolo=tavolo, x=response.x, y=response.y)
    #     move_pub.publish(move_msg)
    #     rospy.loginfo(f"Inviato comando al robot per il tavolo {tavolo}")
        
    # except rospy.ServiceException as e:
    #     rospy.logerr(f"Errore chiamando il servizio: {e}")

def delivery_manager():
    rospy.init_node('delivery_manager', anonymous=True)
    rospy.Subscriber('/ordine', Order, order_callback)
    rospy.spin()
 """

def callback(msg):
    rospy.loginfo(f"Ordine ricevuto: ID={msg.id_ordine}, Prodotto={msg.prodotto}, Tavolo={msg.tavolo}")

def delivery_manager():
    rospy.init_node('delivery_manager', anonymous=True)
    rospy.Subscriber("/ordine", Order, callback)
    rospy.loginfo("delivery_manager in ascolto su /ordine...")
    rospy.spin()

if __name__ == '__main__':
    delivery_manager()
