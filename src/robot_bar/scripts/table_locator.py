#!/usr/bin/env python3
"""
    Server del servizio GetTablePosition
"""

import rospy
import rosnode
from robot_bar.srv import GetTablePosition, GetTablePositionResponse

# Mappa dei tavoli
TAVOLI = {
    1: (-1.06, -2.70),
    2: (0.86, -2.70),
    3: (2.32, -1.37),
    4: (2.32, 0.01)
}

def handle_get_position(req):
    if req.tavolo in TAVOLI:
        x, y = TAVOLI[req.tavolo]
        rospy.loginfo(f"[table_locator] Posizione del tavolo {req.tavolo} inviata")
        return GetTablePositionResponse(x, y)
    else:
        rospy.logwarn(f"[table_locator] Tavolo {req.tavolo} non trovato")
        return GetTablePositionResponse(0.0, 0.0)

def table_locator():
    rospy.init_node('table_locator')
    rospy.loginfo("[table_locator] Avvio del nodo table_locator")
    rospy.wait_for_service('/gazebo/set_model_state')
    rospy.loginfo("[table_locator] Il servizio /gazebo/set_model_state è disponibile, proseguo...")

    service = rospy.Service('get_table_position', GetTablePosition, handle_get_position)
    rospy.loginfo("[table_locator] Servizio get_table_position pronto")
    rospy.spin()

if __name__ == '__main__':
    table_locator()
