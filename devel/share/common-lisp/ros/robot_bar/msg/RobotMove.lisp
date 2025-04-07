; Auto-generated. Do not edit!


(cl:in-package robot_bar-msg)


;//! \htmlinclude RobotMove.msg.html

(cl:defclass <RobotMove> (roslisp-msg-protocol:ros-message)
  ((tavolo
    :reader tavolo
    :initarg :tavolo
    :type cl:integer
    :initform 0)
   (x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0))
)

(cl:defclass RobotMove (<RobotMove>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RobotMove>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RobotMove)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_bar-msg:<RobotMove> is deprecated: use robot_bar-msg:RobotMove instead.")))

(cl:ensure-generic-function 'tavolo-val :lambda-list '(m))
(cl:defmethod tavolo-val ((m <RobotMove>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_bar-msg:tavolo-val is deprecated.  Use robot_bar-msg:tavolo instead.")
  (tavolo m))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <RobotMove>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_bar-msg:x-val is deprecated.  Use robot_bar-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <RobotMove>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_bar-msg:y-val is deprecated.  Use robot_bar-msg:y instead.")
  (y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RobotMove>) ostream)
  "Serializes a message object of type '<RobotMove>"
  (cl:let* ((signed (cl:slot-value msg 'tavolo)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RobotMove>) istream)
  "Deserializes a message object of type '<RobotMove>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'tavolo) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RobotMove>)))
  "Returns string type for a message object of type '<RobotMove>"
  "robot_bar/RobotMove")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotMove)))
  "Returns string type for a message object of type 'RobotMove"
  "robot_bar/RobotMove")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RobotMove>)))
  "Returns md5sum for a message object of type '<RobotMove>"
  "4483cf2c7cbd5e40cc80bd9b27d40621")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RobotMove)))
  "Returns md5sum for a message object of type 'RobotMove"
  "4483cf2c7cbd5e40cc80bd9b27d40621")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RobotMove>)))
  "Returns full string definition for message of type '<RobotMove>"
  (cl:format cl:nil "int32 tavolo~%float32 x~%float32 y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RobotMove)))
  "Returns full string definition for message of type 'RobotMove"
  (cl:format cl:nil "int32 tavolo~%float32 x~%float32 y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RobotMove>))
  (cl:+ 0
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RobotMove>))
  "Converts a ROS message object to a list"
  (cl:list 'RobotMove
    (cl:cons ':tavolo (tavolo msg))
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
))
