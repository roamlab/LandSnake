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
  :slots (_timestamp _enc_angle1 _enc_angle2 _enc_angle3 _enc_angle4 _enc_angle5 _xvel1 _yvel1 _xvel2 _yvel2 _xvel3 _yvel3 _xvel4 _yvel4 _xvel5 _yvel5 ))

(defmethod snake_demo::feedback_angles
  (:init
   (&key
    ((:timestamp __timestamp) 0)
    ((:enc_angle1 __enc_angle1) 0.0)
    ((:enc_angle2 __enc_angle2) 0.0)
    ((:enc_angle3 __enc_angle3) 0.0)
    ((:enc_angle4 __enc_angle4) 0.0)
    ((:enc_angle5 __enc_angle5) 0.0)
    ((:xvel1 __xvel1) 0)
    ((:yvel1 __yvel1) 0)
    ((:xvel2 __xvel2) 0)
    ((:yvel2 __yvel2) 0)
    ((:xvel3 __xvel3) 0)
    ((:yvel3 __yvel3) 0)
    ((:xvel4 __xvel4) 0)
    ((:yvel4 __yvel4) 0)
    ((:xvel5 __xvel5) 0)
    ((:yvel5 __yvel5) 0)
    )
   (send-super :init)
   (setq _timestamp (round __timestamp))
   (setq _enc_angle1 (float __enc_angle1))
   (setq _enc_angle2 (float __enc_angle2))
   (setq _enc_angle3 (float __enc_angle3))
   (setq _enc_angle4 (float __enc_angle4))
   (setq _enc_angle5 (float __enc_angle5))
   (setq _xvel1 (round __xvel1))
   (setq _yvel1 (round __yvel1))
   (setq _xvel2 (round __xvel2))
   (setq _yvel2 (round __yvel2))
   (setq _xvel3 (round __xvel3))
   (setq _yvel3 (round __yvel3))
   (setq _xvel4 (round __xvel4))
   (setq _yvel4 (round __yvel4))
   (setq _xvel5 (round __xvel5))
   (setq _yvel5 (round __yvel5))
   self)
  (:timestamp
   (&optional __timestamp)
   (if __timestamp (setq _timestamp __timestamp)) _timestamp)
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
  (:xvel1
   (&optional __xvel1)
   (if __xvel1 (setq _xvel1 __xvel1)) _xvel1)
  (:yvel1
   (&optional __yvel1)
   (if __yvel1 (setq _yvel1 __yvel1)) _yvel1)
  (:xvel2
   (&optional __xvel2)
   (if __xvel2 (setq _xvel2 __xvel2)) _xvel2)
  (:yvel2
   (&optional __yvel2)
   (if __yvel2 (setq _yvel2 __yvel2)) _yvel2)
  (:xvel3
   (&optional __xvel3)
   (if __xvel3 (setq _xvel3 __xvel3)) _xvel3)
  (:yvel3
   (&optional __yvel3)
   (if __yvel3 (setq _yvel3 __yvel3)) _yvel3)
  (:xvel4
   (&optional __xvel4)
   (if __xvel4 (setq _xvel4 __xvel4)) _xvel4)
  (:yvel4
   (&optional __yvel4)
   (if __yvel4 (setq _yvel4 __yvel4)) _yvel4)
  (:xvel5
   (&optional __xvel5)
   (if __xvel5 (setq _xvel5 __xvel5)) _xvel5)
  (:yvel5
   (&optional __yvel5)
   (if __yvel5 (setq _yvel5 __yvel5)) _yvel5)
  (:serialization-length
   ()
   (+
    ;; uint64 _timestamp
    8
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
    ;; int16 _xvel1
    2
    ;; int16 _yvel1
    2
    ;; int16 _xvel2
    2
    ;; int16 _yvel2
    2
    ;; int16 _xvel3
    2
    ;; int16 _yvel3
    2
    ;; int16 _xvel4
    2
    ;; int16 _yvel4
    2
    ;; int16 _xvel5
    2
    ;; int16 _yvel5
    2
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
     ;; int16 _xvel1
       (write-word _xvel1 s)
     ;; int16 _yvel1
       (write-word _yvel1 s)
     ;; int16 _xvel2
       (write-word _xvel2 s)
     ;; int16 _yvel2
       (write-word _yvel2 s)
     ;; int16 _xvel3
       (write-word _xvel3 s)
     ;; int16 _yvel3
       (write-word _yvel3 s)
     ;; int16 _xvel4
       (write-word _xvel4 s)
     ;; int16 _yvel4
       (write-word _yvel4 s)
     ;; int16 _xvel5
       (write-word _xvel5 s)
     ;; int16 _yvel5
       (write-word _yvel5 s)
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
   ;; int16 _xvel1
     (setq _xvel1 (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _yvel1
     (setq _yvel1 (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _xvel2
     (setq _xvel2 (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _yvel2
     (setq _yvel2 (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _xvel3
     (setq _xvel3 (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _yvel3
     (setq _yvel3 (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _xvel4
     (setq _xvel4 (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _yvel4
     (setq _yvel4 (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _xvel5
     (setq _xvel5 (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _yvel5
     (setq _yvel5 (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get snake_demo::feedback_angles :md5sum-) "efca087178a4608ce59813f65425d68e")
(setf (get snake_demo::feedback_angles :datatype-) "snake_demo/feedback_angles")
(setf (get snake_demo::feedback_angles :definition-)
      "uint64 timestamp
float32 enc_angle1
float32 enc_angle2
float32 enc_angle3
float32 enc_angle4
float32 enc_angle5
int16 xvel1
int16 yvel1
int16 xvel2
int16 yvel2
int16 xvel3
int16 yvel3
int16 xvel4
int16 yvel4
int16 xvel5
int16 yvel5

")



(provide :snake_demo/feedback_angles "efca087178a4608ce59813f65425d68e")


