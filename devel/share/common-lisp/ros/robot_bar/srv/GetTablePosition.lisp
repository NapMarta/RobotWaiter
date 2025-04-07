; Auto-generated. Do not edit!


(cl:in-package robot_bar-srv)


;//! \htmlinclude GetTablePosition-request.msg.html

(cl:defclass <GetTablePosition-request> (roslisp-msg-protocol:ros-message)
  ((tavolo
    :reader tavolo
    :initarg :tavolo
    :type cl:integer
    :initform 0))
)

(cl:defclass GetTablePosition-request (<GetTablePosition-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetTablePosition-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetTablePosition-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_bar-srv:<GetTablePosition-request> is deprecated: use robot_bar-srv:GetTablePosition-request instead.")))

(cl:ensure-generic-function 'tavolo-val :lambda-list '(m))
(cl:defmethod tavolo-val ((m <GetTablePosition-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_bar-srv:tavolo-val is deprecated.  Use robot_bar-srv:tavolo instead.")
  (tavolo m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetTablePosition-request>) ostream)
  "Serializes a message object of type '<GetTablePosition-request>"
  (cl:let* ((signed (cl:slot-value msg 'tavolo)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetTablePosition-request>) istream)
  "Deserializes a message object of type '<GetTablePosition-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'tavolo) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetTablePosition-request>)))
  "Returns string type for a service object of type '<GetTablePosition-request>"
  "robot_bar/GetTablePositionRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetTablePosition-request)))
  "Returns string type for a service object of type 'GetTablePosition-request"
  "robot_bar/GetTablePositionRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetTablePosition-request>)))
  "Returns md5sum for a message object of type '<GetTablePosition-request>"
  "a5958a44ce6db6760f5e6109da65f88b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetTablePosition-request)))
  "Returns md5sum for a message object of type 'GetTablePosition-request"
  "a5958a44ce6db6760f5e6109da65f88b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetTablePosition-request>)))
  "Returns full string definition for message of type '<GetTablePosition-request>"
  (cl:format cl:nil "int32 tavolo  # Input: numero del tavolo~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetTablePosition-request)))
  "Returns full string definition for message of type 'GetTablePosition-request"
  (cl:format cl:nil "int32 tavolo  # Input: numero del tavolo~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetTablePosition-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetTablePosition-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetTablePosition-request
    (cl:cons ':tavolo (tavolo msg))
))
;//! \htmlinclude GetTablePosition-response.msg.html

(cl:defclass <GetTablePosition-response> (roslisp-msg-protocol:ros-message)
  ((x
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

(cl:defclass GetTablePosition-response (<GetTablePosition-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetTablePosition-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetTablePosition-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_bar-srv:<GetTablePosition-response> is deprecated: use robot_bar-srv:GetTablePosition-response instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <GetTablePosition-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_bar-srv:x-val is deprecated.  Use robot_bar-srv:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <GetTablePosition-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_bar-srv:y-val is deprecated.  Use robot_bar-srv:y instead.")
  (y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetTablePosition-response>) ostream)
  "Serializes a message object of type '<GetTablePosition-response>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetTablePosition-response>) istream)
  "Deserializes a message object of type '<GetTablePosition-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetTablePosition-response>)))
  "Returns string type for a service object of type '<GetTablePosition-response>"
  "robot_bar/GetTablePositionResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetTablePosition-response)))
  "Returns string type for a service object of type 'GetTablePosition-response"
  "robot_bar/GetTablePositionResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetTablePosition-response>)))
  "Returns md5sum for a message object of type '<GetTablePosition-response>"
  "a5958a44ce6db6760f5e6109da65f88b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetTablePosition-response)))
  "Returns md5sum for a message object of type 'GetTablePosition-response"
  "a5958a44ce6db6760f5e6109da65f88b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetTablePosition-response>)))
  "Returns full string definition for message of type '<GetTablePosition-response>"
  (cl:format cl:nil "float32 x     # Output: coordinata X~%float32 y     # Output: coordinata Y~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetTablePosition-response)))
  "Returns full string definition for message of type 'GetTablePosition-response"
  (cl:format cl:nil "float32 x     # Output: coordinata X~%float32 y     # Output: coordinata Y~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetTablePosition-response>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetTablePosition-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetTablePosition-response
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetTablePosition)))
  'GetTablePosition-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetTablePosition)))
  'GetTablePosition-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetTablePosition)))
  "Returns string type for a service object of type '<GetTablePosition>"
  "robot_bar/GetTablePosition")