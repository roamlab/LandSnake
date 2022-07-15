;; Auto-generated. Do not edit!


(when (boundp 'snake_demo::torques)
  (if (not (find-package "SNAKE_DEMO"))
    (make-package "SNAKE_DEMO"))
  (shadow 'torques (find-package "SNAKE_DEMO")))
(unless (find-package "SNAKE_DEMO::TORQUES")
  (make-package "SNAKE_DEMO::TORQUES"))

(in-package "ROS")
;;//! \htmlinclude torques.msg.html


(defclass snake_demo::torques
  :super ros::object
  :slots (_timestamp _torque1 _torque2 _torque3 _torque4 _torque5 _angvel1 _angvel2 _angvel3 _angvel4 _angvel5 _enc_angle1 _enc_angle2 _enc_angle3 _enc_angle4 _enc_angle5 ))

(defmethod snake_demo::torques
  (:init
   (&key
    ((:timestamp __timestamp) 0)
    ((:torque1 __torque1) 0.0)
    ((:torque2 __torque2) 0.0)
    ((:torque3 __torque3) 0.0)
    ((:torque4 __torque4) 0.0)
    ((:torque5 __torque5) 0.0)
    ((:angvel1 __angvel1) 0.0)
    ((:angvel2 __angvel2) 0.0)
    ((:angvel3 __angvel3) 0.0)
    ((:angvel4 __angvel4) 0.0)
    ((:angvel5 __angvel5) 0.0)
    ((:enc_angle1 __enc_angle1) 0.0)
    ((:enc_angle2 __enc_angle2) 0.0)
    ((:enc_angle3 __enc_angle3) 0.0)
    ((:enc_angle4 __enc_angle4) 0.0)
    ((:enc_angle5 __enc_angle5) 0.0)
    )
   (send-super :init)
   (setq _timestamp (round __timestamp))
   (setq _torque1 (float __torque1))
   (setq _torque2 (float __torque2))
   (setq _torque3 (float __torque3))
   (setq _torque4 (float __torque4))
   (setq _torque5 (float __torque5))
   (setq _angvel1 (float __angvel1))
   (setq _angvel2 (float __angvel2))
   (setq _angvel3 (float __angvel3))
   (setq _angvel4 (float __angvel4))
   (setq _angvel5 (float __angvel5))
   (setq _enc_angle1 (float __enc_angle1))
   (setq _enc_angle2 (float __enc_angle2))
   (setq _enc_angle3 (float __enc_angle3))
   (setq _enc_angle4 (float __enc_angle4))
   (setq _enc_angle5 (float __enc_angle5))
   self)
  (:timestamp
   (&optional __timestamp)
   (if __timestamp (setq _timestamp __timestamp)) _timestamp)
  (:torque1
   (&optional __torque1)
   (if __torque1 (setq _torque1 __torque1)) _torque1)
  (:torque2
   (&optional __torque2)
   (if __torque2 (setq _torque2 __torque2)) _torque2)
  (:torque3
   (&optional __torque3)
   (if __torque3 (setq _torque3 __torque3)) _torque3)
  (:torque4
   (&optional __torque4)
   (if __torque4 (setq _torque4 __torque4)) _torque4)
  (:torque5
   (&optional __torque5)
   (if __torque5 (setq _torque5 __torque5)) _torque5)
  (:angvel1
   (&optional __angvel1)
   (if __angvel1 (setq _angvel1 __angvel1)) _angvel1)
  (:angvel2
   (&optional __angvel2)
   (if __angvel2 (setq _angvel2 __angvel2)) _angvel2)
  (:angvel3
   (&optional __angvel3)
   (if __angvel3 (setq _angvel3 __angvel3)) _angvel3)
  (:angvel4
   (&optional __angvel4)
   (if __angvel4 (setq _angvel4 __angvel4)) _angvel4)
  (:angvel5
   (&optional __angvel5)
   (if __angvel5 (setq _angvel5 __angvel5)) _angvel5)
  (:enc_angle1
   (&optional __enc_angle1)
   (if __enc_angle1 (setq _enc_angle1 __enc_angle1)) _enc_angle1)
  (:enc_angle2
   (&optional __enc_angle2)
   (if __enc_angle2 (setq _enc_angle2 __enc_angle2)) _enc_angle2)
  (:enc_angle3
   (&optional __enc_angle3)
   (if __enc_angle3 (setq _enc_angle3 __enc_angle3)) _enc_angle3)
  (:enc_angle4
   (&optional __enc_angle4)
   (if __enc_angle4 (setq _enc_angle4 __enc_angle4)) _enc_angle4)
  (:enc_angle5
   (&optional __enc_angle5)
   (if __enc_angle5 (setq _enc_angle5 __enc_angle5)) _enc_angle5)
  (:serialization-length
   ()
   (+
    ;; uint64 _timestamp
    8
    ;; float32 _torque1
    4
    ;; float32 _torque2
    4
    ;; float32 _torque3
    4
    ;; float32 _torque4
    4
    ;; float32 _torque5
    4
    ;; float32 _angvel1
    4
    ;; float32 _angvel2
    4
    ;; float32 _angvel3
    4
    ;; float32 _angvel4
    4
    ;; float32 _angvel5
    4
    ;; float32 _enc_angle1
    4
    ;; float32 _enc_angle2
    4
    ;; float32 _enc_angle3
    4
    ;; float32 _enc_angle4
    4
    ;; float32 _enc_angle5
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint64 _timestamp
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _timestamp (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _timestamp) (= (length (_timestamp . bv)) 2)) ;; bignum
              (write-long (ash (elt (_timestamp . bv) 0) 0) s)
              (write-long (ash (elt (_timestamp . bv) 1) -1) s))
             ((and (class _timestamp) (= (length (_timestamp . bv)) 1)) ;; big1
              (write-long (elt (_timestamp . bv) 0) s)
              (write-long (if (>= _timestamp 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _timestamp s)(write-long (if (>= _timestamp 0) 0 #xffffffff) s)))
     ;; float32 _torque1
       (sys::poke _torque1 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _torque2
       (sys::poke _torque2 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _torque3
       (sys::poke _torque3 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _torque4
       (sys::poke _torque4 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _torque5
       (sys::poke _torque5 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _angvel1
       (sys::poke _angvel1 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _angvel2
       (sys::poke _angvel2 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _angvel3
       (sys::poke _angvel3 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _angvel4
       (sys::poke _angvel4 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _angvel5
       (sys::poke _angvel5 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _enc_angle1
       (sys::poke _enc_angle1 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _enc_angle2
       (sys::poke _enc_angle2 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _enc_angle3
       (sys::poke _enc_angle3 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _enc_angle4
       (sys::poke _enc_angle4 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _enc_angle5
       (sys::poke _enc_angle5 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint64 _timestamp
     
#+(or :alpha :irix6 :x86_64)
      (setf _timestamp (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _timestamp (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; float32 _torque1
     (setq _torque1 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _torque2
     (setq _torque2 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _torque3
     (setq _torque3 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _torque4
     (setq _torque4 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _torque5
     (setq _torque5 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _angvel1
     (setq _angvel1 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _angvel2
     (setq _angvel2 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _angvel3
     (setq _angvel3 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _angvel4
     (setq _angvel4 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _angvel5
     (setq _angvel5 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _enc_angle1
     (setq _enc_angle1 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _enc_angle2
     (setq _enc_angle2 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _enc_angle3
     (setq _enc_angle3 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _enc_angle4
     (setq _enc_angle4 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _enc_angle5
     (setq _enc_angle5 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get snake_demo::torques :md5sum-) "0391199eca786947ffc0b714f855b349")
(setf (get snake_demo::torques :datatype-) "snake_demo/torques")
(setf (get snake_demo::torques :definition-)
      "uint64 timestamp
float32 torque1
float32 torque2
float32 torque3
float32 torque4
float32 torque5
float32 angvel1
float32 angvel2
float32 angvel3
float32 angvel4
float32 angvel5
float32 enc_angle1
float32 enc_angle2
float32 enc_angle3
float32 enc_angle4
float32 enc_angle5

")



(provide :snake_demo/torques "0391199eca786947ffc0b714f855b349")


