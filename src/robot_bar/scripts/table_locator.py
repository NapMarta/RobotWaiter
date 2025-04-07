#!/usr/bin/env python3
"""
    Server del servizio GetTablePosition
"""
import sys
sys.path.append('/home/marta/Desktop/Progetto/ProgettoRP/devel/lib/python3/dist-packages')

import rospy
from robot_bar.srv import GetTablePosition, GetTablePositionResponse

# Mappa fittizia dei tavoli
TAVOLI = {
    1: (1.0, 2.0),
    2: (2.5, 3.0),
    3: (4.0, 1.5),
}

def handle_get_position(req):
    if req.tavolo in TAVOLI:
        x, y = TAVOLI[req.tavolo]
        return GetTablePositionResponse(x, y)
    else:
        rospy.logwarn(f"Tavolo {req.tavolo} non trovato")
        return GetTablePositionResponse(0.0, 0.0)

def table_locator():
    rospy.init_node('table_locator')
    service = rospy.Service('get_table_position', GetTablePosition, handle_get_position)
    rospy.loginfo("Servizio get_table_position pronto")
    rospy.spin()

if __name__ == '__main__':
    table_locator()
