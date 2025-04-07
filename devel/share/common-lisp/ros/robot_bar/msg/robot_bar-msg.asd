
(cl:in-package :asdf)

(defsystem "robot_bar-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Order" :depends-on ("_package_Order"))
    (:file "_package_Order" :depends-on ("_package"))
    (:file "RobotMove" :depends-on ("_package_RobotMove"))
    (:file "_package_RobotMove" :depends-on ("_package"))
  ))