;; Auto-generated. Do not edit!


(when (boundp 'robot_bar::Order)
  (if (not (find-package "ROBOT_BAR"))
    (make-package "ROBOT_BAR"))
  (shadow 'Order (find-package "ROBOT_BAR")))
(unless (find-package "ROBOT_BAR::ORDER")
  (make-package "ROBOT_BAR::ORDER"))

(in-package "ROS")
;;//! \htmlinclude Order.msg.html


(defclass robot_bar::Order
  :super ros::object
  :slots (_id_ordine _prodotto _tavolo ))

(defmethod robot_bar::Order
  (:init
   (&key
    ((:id_ordine __id_ordine) "")
    ((:prodotto __prodotto) "")
    ((:tavolo __tavolo) 0)
    )
   (send-super :init)
   (setq _id_ordine (string __id_ordine))
   (setq _prodotto (string __prodotto))
   (setq _tavolo (round __tavolo))
   self)
  (:id_ordine
   (&optional __id_ordine)
   (if __id_ordine (setq _id_ordine __id_ordine)) _id_ordine)
  (:prodotto
   (&optional __prodotto)
   (if __prodotto (setq _prodotto __prodotto)) _prodotto)
  (:tavolo
   (&optional __tavolo)
   (if __tavolo (setq _tavolo __tavolo)) _tavolo)
  (:serialization-length
   ()
   (+
    ;; string _id_ordine
    4 (length _id_ordine)
    ;; string _prodotto
    4 (length _prodotto)
    ;; int32 _tavolo
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _id_ordine
       (write-long (length _id_ordine) s) (princ _id_ordine s)
     ;; string _prodotto
       (write-long (length _prodotto) s) (princ _prodotto s)
     ;; int32 _tavolo
       (write-long _tavolo s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _id_ordine
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _id_ordine (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _prodotto
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _prodotto (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _tavolo
     (setq _tavolo (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get robot_bar::Order :md5sum-) "423d4314acfad0d1e32fd5c417d3147d")
(setf (get robot_bar::Order :datatype-) "robot_bar/Order")
(setf (get robot_bar::Order :definition-)
      "string id_ordine
string prodotto
int32 tavolo

")



(provide :robot_bar/Order "423d4314acfad0d1e32fd5c417d3147d")


