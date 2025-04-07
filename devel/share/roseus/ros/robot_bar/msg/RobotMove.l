;; Auto-generated. Do not edit!


(when (boundp 'robot_bar::RobotMove)
  (if (not (find-package "ROBOT_BAR"))
    (make-package "ROBOT_BAR"))
  (shadow 'RobotMove (find-package "ROBOT_BAR")))
(unless (find-package "ROBOT_BAR::ROBOTMOVE")
  (make-package "ROBOT_BAR::ROBOTMOVE"))

(in-package "ROS")
;;//! \htmlinclude RobotMove.msg.html


(defclass robot_bar::RobotMove
  :super ros::object
  :slots (_tavolo _x _y ))

(defmethod robot_bar::RobotMove
  (:init
   (&key
    ((:tavolo __tavolo) 0)
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    )
   (send-super :init)
   (setq _tavolo (round __tavolo))
   (setq _x (float __x))
   (setq _y (float __y))
   self)
  (:tavolo
   (&optional __tavolo)
   (if __tavolo (setq _tavolo __tavolo)) _tavolo)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:serialization-length
   ()
   (+
    ;; int32 _tavolo
    4
    ;; float32 _x
    4
    ;; float32 _y
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _tavolo
       (write-long _tavolo s)
     ;; float32 _x
       (sys::poke _x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y
       (sys::poke _y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _tavolo
     (setq _tavolo (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _x
     (setq _x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y
     (setq _y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get robot_bar::RobotMove :md5sum-) "4483cf2c7cbd5e40cc80bd9b27d40621")
(setf (get robot_bar::RobotMove :datatype-) "robot_bar/RobotMove")
(setf (get robot_bar::RobotMove :definition-)
      "int32 tavolo
float32 x
float32 y

")



(provide :robot_bar/RobotMove "4483cf2c7cbd5e40cc80bd9b27d40621")


