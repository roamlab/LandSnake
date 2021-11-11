;; Auto-generated. Do not edit!


(when (boundp 'snake_demo::feedback_angles)
  (if (not (find-package "SNAKE_DEMO"))
    (make-package "SNAKE_DEMO"))
  (shadow 'feedback_angles (find-package "SNAKE_DEMO")))
(unless (find-package "SNAKE_DEMO::FEEDBACK_ANGLES")
  (make-package "SNAKE_DEMO::FEEDBACK_ANGLES"))

(in-package "ROS")
;;//! \htmlinclude feedback_angles.msg.html


(defclass snake_demo::feedback_angles
  :super ros::object
  :slots (_timestamp _sea_angle1 _sea_angle2 _sea_angle3 _sea_angle4 _sea_angle5 _dxl_angle1 _dxl_angle2 _dxl_angle3 _dxl_angle4 _dxl_angle5 ))

(defmethod snake_demo::feedback_angles
  (:init
   (&key
    ((:timestamp __timestamp) 0)
    ((:sea_angle1 __sea_angle1) 0.0)
    ((:sea_angle2 __sea_angle2) 0.0)
    ((:sea_angle3 __sea_angle3) 0.0)
    ((:sea_angle4 __sea_angle4) 0.0)
    ((:sea_angle5 __sea_angle5) 0.0)
    ((:dxl_angle1 __dxl_angle1) 0.0)
    ((:dxl_angle2 __dxl_angle2) 0.0)
    ((:dxl_angle3 __dxl_angle3) 0.0)
    ((:dxl_angle4 __dxl_angle4) 0.0)
    ((:dxl_angle5 __dxl_angle5) 0.0)
    )
   (send-super :init)
   (setq _timestamp (round __timestamp))
   (setq _sea_angle1 (float __sea_angle1))
   (setq _sea_angle2 (float __sea_angle2))
   (setq _sea_angle3 (float __sea_angle3))
   (setq _sea_angle4 (float __sea_angle4))
   (setq _sea_angle5 (float __sea_angle5))
   (setq _dxl_angle1 (float __dxl_angle1))
   (setq _dxl_angle2 (float __dxl_angle2))
   (setq _dxl_angle3 (float __dxl_angle3))
   (setq _dxl_angle4 (float __dxl_angle4))
   (setq _dxl_angle5 (float __dxl_angle5))
   self)
  (:timestamp
   (&optional __timestamp)
   (if __timestamp (setq _timestamp __timestamp)) _timestamp)
  (:sea_angle1
   (&optional __sea_angle1)
   (if __sea_angle1 (setq _sea_angle1 __sea_angle1)) _sea_angle1)
  (:sea_angle2
   (&optional __sea_angle2)
   (if __sea_angle2 (setq _sea_angle2 __sea_angle2)) _sea_angle2)
  (:sea_angle3
   (&optional __sea_angle3)
   (if __sea_angle3 (setq _sea_angle3 __sea_angle3)) _sea_angle3)
  (:sea_angle4
   (&optional __sea_angle4)
   (if __sea_angle4 (setq _sea_angle4 __sea_angle4)) _sea_angle4)
  (:sea_angle5
   (&optional __sea_angle5)
   (if __sea_angle5 (setq _sea_angle5 __sea_angle5)) _sea_angle5)
  (:dxl_angle1
   (&optional __dxl_angle1)
   (if __dxl_angle1 (setq _dxl_angle1 __dxl_angle1)) _dxl_angle1)
  (:dxl_angle2
   (&optional __dxl_angle2)
   (if __dxl_angle2 (setq _dxl_angle2 __dxl_angle2)) _dxl_angle2)
  (:dxl_angle3
   (&optional __dxl_angle3)
   (if __dxl_angle3 (setq _dxl_angle3 __dxl_angle3)) _dxl_angle3)
  (:dxl_angle4
   (&optional __dxl_angle4)
   (if __dxl_angle4 (setq _dxl_angle4 __dxl_angle4)) _dxl_angle4)
  (:dxl_angle5
   (&optional __dxl_angle5)
   (if __dxl_angle5 (setq _dxl_angle5 __dxl_angle5)) _dxl_angle5)
  (:serialization-length
   ()
   (+
    ;; uint64 _timestamp
    8
    ;; float32 _sea_angle1
    4
    ;; float32 _sea_angle2
    4
    ;; float32 _sea_angle3
    4
    ;; float32 _sea_angle4
    4
    ;; float32 _sea_angle5
    4
    ;; float32 _dxl_angle1
    4
    ;; float32 _dxl_angle2
    4
    ;; float32 _dxl_angle3
    4
    ;; float32 _dxl_angle4
    4
    ;; float32 _dxl_angle5
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
     ;; float32 _sea_angle1
       (sys::poke _sea_angle1 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _sea_angle2
       (sys::poke _sea_angle2 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _sea_angle3
       (sys::poke _sea_angle3 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _sea_angle4
       (sys::poke _sea_angle4 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _sea_angle5
       (sys::poke _sea_angle5 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _dxl_angle1
       (sys::poke _dxl_angle1 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _dxl_angle2
       (sys::poke _dxl_angle2 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _dxl_angle3
       (sys::poke _dxl_angle3 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _dxl_angle4
       (sys::poke _dxl_angle4 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _dxl_angle5
       (sys::poke _dxl_angle5 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
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
   ;; float32 _sea_angle1
     (setq _sea_angle1 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _sea_angle2
     (setq _sea_angle2 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _sea_angle3
     (setq _sea_angle3 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _sea_angle4
     (setq _sea_angle4 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _sea_angle5
     (setq _sea_angle5 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _dxl_angle1
     (setq _dxl_angle1 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _dxl_angle2
     (setq _dxl_angle2 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _dxl_angle3
     (setq _dxl_angle3 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _dxl_angle4
     (setq _dxl_angle4 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _dxl_angle5
     (setq _dxl_angle5 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get snake_demo::feedback_angles :md5sum-) "2e66b029179d9b1560650234dca943c0")
(setf (get snake_demo::feedback_angles :datatype-) "snake_demo/feedback_angles")
(setf (get snake_demo::feedback_angles :definition-)
      "uint64 timestamp
float32 sea_angle1
float32 sea_angle2
float32 sea_angle3
float32 sea_angle4
float32 sea_angle5
float32 dxl_angle1
float32 dxl_angle2
float32 dxl_angle3
float32 dxl_angle4
float32 dxl_angle5


")



(provide :snake_demo/feedback_angles "2e66b029179d9b1560650234dca943c0")


