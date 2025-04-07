;; Auto-generated. Do not edit!


(when (boundp 'robot_bar::GetTablePosition)
  (if (not (find-package "ROBOT_BAR"))
    (make-package "ROBOT_BAR"))
  (shadow 'GetTablePosition (find-package "ROBOT_BAR")))
(unless (find-package "ROBOT_BAR::GETTABLEPOSITION")
  (make-package "ROBOT_BAR::GETTABLEPOSITION"))
(unless (find-package "ROBOT_BAR::GETTABLEPOSITIONREQUEST")
  (make-package "ROBOT_BAR::GETTABLEPOSITIONREQUEST"))
(unless (find-package "ROBOT_BAR::GETTABLEPOSITIONRESPONSE")
  (make-package "ROBOT_BAR::GETTABLEPOSITIONRESPONSE"))

(in-package "ROS")





(defclass robot_bar::GetTablePositionRequest
  :super ros::object
  :slots (_tavolo ))

(defmethod robot_bar::GetTablePositionRequest
  (:init
   (&key
    ((:tavolo __tavolo) 0)
    )
   (send-super :init)
   (setq _tavolo (round __tavolo))
   self)
  (:tavolo
   (&optional __tavolo)
   (if __tavolo (setq _tavolo __tavolo)) _tavolo)
  (:serialization-length
   ()
   (+
    ;; int32 _tavolo
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _tavolo
       (write-long _tavolo s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _tavolo
     (setq _tavolo (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass robot_bar::GetTablePositionResponse
  :super ros::object
  :slots (_x _y ))

(defmethod robot_bar::GetTablePositionResponse
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:serialization-length
   ()
   (+
    ;; float32 _x
    4
    ;; float32 _y
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _x
       (sys::poke _x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y
       (sys::poke _y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _x
     (setq _x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y
     (setq _y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass robot_bar::GetTablePosition
  :super ros::object
  :slots ())

(setf (get robot_bar::GetTablePosition :md5sum-) "a5958a44ce6db6760f5e6109da65f88b")
(setf (get robot_bar::GetTablePosition :datatype-) "robot_bar/GetTablePosition")
(setf (get robot_bar::GetTablePosition :request) robot_bar::GetTablePositionRequest)
(setf (get robot_bar::GetTablePosition :response) robot_bar::GetTablePositionResponse)

(defmethod robot_bar::GetTablePositionRequest
  (:response () (instance robot_bar::GetTablePositionResponse :init)))

(setf (get robot_bar::GetTablePositionRequest :md5sum-) "a5958a44ce6db6760f5e6109da65f88b")
(setf (get robot_bar::GetTablePositionRequest :datatype-) "robot_bar/GetTablePositionRequest")
(setf (get robot_bar::GetTablePositionRequest :definition-)
      "int32 tavolo  # Input: numero del tavolo
---
float32 x     # Output: coordinata X
float32 y     # Output: coordinata Y

")

(setf (get robot_bar::GetTablePositionResponse :md5sum-) "a5958a44ce6db6760f5e6109da65f88b")
(setf (get robot_bar::GetTablePositionResponse :datatype-) "robot_bar/GetTablePositionResponse")
(setf (get robot_bar::GetTablePositionResponse :definition-)
      "int32 tavolo  # Input: numero del tavolo
---
float32 x     # Output: coordinata X
float32 y     # Output: coordinata Y

")



(provide :robot_bar/GetTablePosition "a5958a44ce6db6760f5e6109da65f88b")


