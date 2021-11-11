;; Auto-generated. Do not edit!


(when (boundp 'snake_demo::cmd_angles)
  (if (not (find-package "SNAKE_DEMO"))
    (make-package "SNAKE_DEMO"))
  (shadow 'cmd_angles (find-package "SNAKE_DEMO")))
(unless (find-package "SNAKE_DEMO::CMD_ANGLES")
  (make-package "SNAKE_DEMO::CMD_ANGLES"))

(in-package "ROS")
;;//! \htmlinclude cmd_angles.msg.html


(defclass snake_demo::cmd_angles
  :super ros::object
  :slots (_angle1 _angle2 _angle3 _angle4 _angle5 ))

(defmethod snake_demo::cmd_angles
  (:init
   (&key
    ((:angle1 __angle1) 0.0)
    ((:angle2 __angle2) 0.0)
    ((:angle3 __angle3) 0.0)
    ((:angle4 __angle4) 0.0)
    ((:angle5 __angle5) 0.0)
    )
   (send-super :init)
   (setq _angle1 (float __angle1))
   (setq _angle2 (float __angle2))
   (setq _angle3 (float __angle3))
   (setq _angle4 (float __angle4))
   (setq _angle5 (float __angle5))
   self)
  (:angle1
   (&optional __angle1)
   (if __angle1 (setq _angle1 __angle1)) _angle1)
  (:angle2
   (&optional __angle2)
   (if __angle2 (setq _angle2 __angle2)) _angle2)
  (:angle3
   (&optional __angle3)
   (if __angle3 (setq _angle3 __angle3)) _angle3)
  (:angle4
   (&optional __angle4)
   (if __angle4 (setq _angle4 __angle4)) _angle4)
  (:angle5
   (&optional __angle5)
   (if __angle5 (setq _angle5 __angle5)) _angle5)
  (:serialization-length
   ()
   (+
    ;; float32 _angle1
    4
    ;; float32 _angle2
    4
    ;; float32 _angle3
    4
    ;; float32 _angle4
    4
    ;; float32 _angle5
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _angle1
       (sys::poke _angle1 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _angle2
       (sys::poke _angle2 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _angle3
       (sys::poke _angle3 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _angle4
       (sys::poke _angle4 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _angle5
       (sys::poke _angle5 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _angle1
     (setq _angle1 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _angle2
     (setq _angle2 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _angle3
     (setq _angle3 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _angle4
     (setq _angle4 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _angle5
     (setq _angle5 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get snake_demo::cmd_angles :md5sum-) "b55ed2e9fa1052eea0ca3ebe1016bcf9")
(setf (get snake_demo::cmd_angles :datatype-) "snake_demo/cmd_angles")
(setf (get snake_demo::cmd_angles :definition-)
      "float32 angle1
float32 angle2
float32 angle3
float32 angle4
float32 angle5



")



(provide :snake_demo/cmd_angles "b55ed2e9fa1052eea0ca3ebe1016bcf9")


