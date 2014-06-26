
(cl:in-package :asdf)

(defsystem "aibo_server-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :sensor_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Bumper" :depends-on ("_package_Bumper"))
    (:file "_package_Bumper" :depends-on ("_package"))
    (:file "IRArray" :depends-on ("_package_IRArray"))
    (:file "_package_IRArray" :depends-on ("_package"))
    (:file "Joints" :depends-on ("_package_Joints"))
    (:file "_package_Joints" :depends-on ("_package"))
    (:file "Sound" :depends-on ("_package_Sound"))
    (:file "_package_Sound" :depends-on ("_package"))
    (:file "Accel" :depends-on ("_package_Accel"))
    (:file "_package_Accel" :depends-on ("_package"))
    (:file "TouchArray" :depends-on ("_package_TouchArray"))
    (:file "_package_TouchArray" :depends-on ("_package"))
    (:file "BumperArray" :depends-on ("_package_BumperArray"))
    (:file "_package_BumperArray" :depends-on ("_package"))
  ))