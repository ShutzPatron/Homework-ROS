
(cl:in-package :asdf)

(defsystem "robot-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "mod_Header" :depends-on ("_package_mod_Header"))
    (:file "_package_mod_Header" :depends-on ("_package"))
  ))