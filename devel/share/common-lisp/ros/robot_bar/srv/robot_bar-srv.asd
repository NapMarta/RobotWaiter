
(cl:in-package :asdf)

(defsystem "robot_bar-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "GetTablePosition" :depends-on ("_package_GetTablePosition"))
    (:file "_package_GetTablePosition" :depends-on ("_package"))
  ))