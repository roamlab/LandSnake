
(cl:in-package :asdf)

(defsystem "snake_demo-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "cmd_angles" :depends-on ("_package_cmd_angles"))
    (:file "_package_cmd_angles" :depends-on ("_package"))
    (:file "feedback_angles" :depends-on ("_package_feedback_angles"))
    (:file "_package_feedback_angles" :depends-on ("_package"))
  ))