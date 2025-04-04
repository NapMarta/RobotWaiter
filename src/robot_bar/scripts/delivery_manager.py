#!/usr/bin/env python3
import sys
sys.path.append('/home/marta/Desktop/Progetto/ProgettoRP/devel/lib/python3/dist-packages')

import rospy
from std_msgs.msg import String

def order_callback(msg):
    rospy.loginfo(f"Ricevuto ordine: {msg.data}")
    
    # Simulazione di decodifica dell'ordine
    order_data = msg.data.split(",")  # Es: "caffè,3"
    prodotto = order_data[0]
    tavolo = int(order_data[1])
    
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
    rospy.Subscriber('/ordine', String, order_callback)
    rospy.spin()

if __name__ == '__main__':
    delivery_manager()
