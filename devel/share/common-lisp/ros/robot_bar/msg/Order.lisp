; Auto-generated. Do not edit!


(cl:in-package robot_bar-msg)


;//! \htmlinclude Order.msg.html

(cl:defclass <Order> (roslisp-msg-protocol:ros-message)
  ((id_ordine
    :reader id_ordine
    :initarg :id_ordine
    :type cl:string
    :initform "")
   (prodotto
    :reader prodotto
    :initarg :prodotto
    :type cl:string
    :initform "")
   (tavolo
    :reader tavolo
    :initarg :tavolo
    :type cl:integer
    :initform 0))
)

(cl:defclass Order (<Order>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Order>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Order)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_bar-msg:<Order> is deprecated: use robot_bar-msg:Order instead.")))

(cl:ensure-generic-function 'id_ordine-val :lambda-list '(m))
(cl:defmethod id_ordine-val ((m <Order>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_bar-msg:id_ordine-val is deprecated.  Use robot_bar-msg:id_ordine instead.")
  (id_ordine m))

(cl:ensure-generic-function 'prodotto-val :lambda-list '(m))
(cl:defmethod prodotto-val ((m <Order>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_bar-msg:prodotto-val is deprecated.  Use robot_bar-msg:prodotto instead.")
  (prodotto m))

(cl:ensure-generic-function 'tavolo-val :lambda-list '(m))
(cl:defmethod tavolo-val ((m <Order>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_bar-msg:tavolo-val is deprecated.  Use robot_bar-msg:tavolo instead.")
  (tavolo m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Order>) ostream)
  "Serializes a message object of type '<Order>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'id_ordine))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'id_ordine))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'prodotto))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'prodotto))
  (cl:let* ((signed (cl:slot-value msg 'tavolo)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Order>) istream)
  "Deserializes a message object of type '<Order>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id_ordine) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'id_ordine) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'prodotto) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'prodotto) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'tavolo) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Order>)))
  "Returns string type for a message object of type '<Order>"
  "robot_bar/Order")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Order)))
  "Returns string type for a message object of type 'Order"
  "robot_bar/Order")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Order>)))
  "Returns md5sum for a message object of type '<Order>"
  "423d4314acfad0d1e32fd5c417d3147d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Order)))
  "Returns md5sum for a message object of type 'Order"
  "423d4314acfad0d1e32fd5c417d3147d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Order>)))
  "Returns full string definition for message of type '<Order>"
  (cl:format cl:nil "string id_ordine~%string prodotto~%int32 tavolo~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Order)))
  "Returns full string definition for message of type 'Order"
  (cl:format cl:nil "string id_ordine~%string prodotto~%int32 tavolo~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Order>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'id_ordine))
     4 (cl:length (cl:slot-value msg 'prodotto))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Order>))
  "Converts a ROS message object to a list"
  (cl:list 'Order
    (cl:cons ':id_ordine (id_ordine msg))
    (cl:cons ':prodotto (prodotto msg))
    (cl:cons ':tavolo (tavolo msg))
))
