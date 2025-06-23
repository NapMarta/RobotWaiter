# Robot Waiter 🍺🤖

Robot cameriere per la consegna di birre in un bar, sviluppato con **ROS Noetic**, **Gazebo** e **RViz**.  
Il progetto simula un ambiente in cui un robot riceve un ordine, determina la posizione del tavolo e vi si dirige per consegnare la birra.

---

## 🛠 Tecnologie utilizzate

- **ROS Noetic** su Ubuntu 20.04
- **Gazebo** per la simulazione dell’ambiente del bar
- **RViz** per la visualizzazione dello stato del robot
- **rqt_graph** per visualizzare la comunicazione tra i nodi
- Linguaggio: **Python**

---

## 📦 Nodi principali

### `order_manager.py`
- Riceve un ordine (es. "una birra al tavolo 3")
- Invia l’ordine al nodo `delivery_manager`

### `delivery_manager.py`
- Riceve l’ordine e chiama il **servizio ROS** `GetTablePosition`
- Comanda il robot a muoversi verso la posizione del tavolo

### `robot_controller.py`
- Simula il movimento del robot nella mappa
- Comunica con RViz per la visualizzazione della posizione

### `table_locator.py`
- Server del servizio `GetTablePosition`
- Restituisce la posizione (x, y) del tavolo richiesto

---

## 🔁 Comunicazione tra i nodi

- **Topic**
  - `/ordine`: trasmette l’ordine da `order_manager` a `delivery_manager`
  - `/movimento_robot`: comando di movimento per `robot_controller`
  - `/consegna_completata`: conferma la consegna dell'ordine da `delivery_manager` a `order_manager`

- **Service**
  - `/get_table_position`: fornisce la posizione di un tavolo dato il suo ID

---

## 🧪 Come eseguire il progetto

1. Assicurati di avere ROS Noetic installato su Ubuntu 20.04
2. Clona la repo nella tua workspace ROS:

   ```bash
   git clone https://github.com/NapMarta/ProgettoRP.git
   catkin_make
   source devel/setup.bash

3. Esegui il progstto:
  
  ```bash
  roslaunch robot_bar robot_bar_system.launch

