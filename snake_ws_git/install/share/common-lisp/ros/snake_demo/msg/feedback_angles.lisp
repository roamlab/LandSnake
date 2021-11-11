; Auto-generated. Do not edit!


(cl:in-package snake_demo-msg)


;//! \htmlinclude feedback_angles.msg.html

(cl:defclass <feedback_angles> (roslisp-msg-protocol:ros-message)
  ((timestamp
    :reader timestamp
    :initarg :timestamp
    :type cl:integer
    :initform 0)
   (sea_angle1
    :reader sea_angle1
    :initarg :sea_angle1
    :type cl:float
    :initform 0.0)
   (sea_angle2
    :reader sea_angle2
    :initarg :sea_angle2
    :type cl:float
    :initform 0.0)
   (sea_angle3
    :reader sea_angle3
    :initarg :sea_angle3
    :type cl:float
    :initform 0.0)
   (sea_angle4
    :reader sea_angle4
    :initarg :sea_angle4
    :type cl:float
    :initform 0.0)
   (sea_angle5
    :reader sea_angle5
    :initarg :sea_angle5
    :type cl:float
    :initform 0.0)
   (dxl_angle1
    :reader dxl_angle1
    :initarg :dxl_angle1
    :type cl:float
    :initform 0.0)
   (dxl_angle2
    :reader dxl_angle2
    :initarg :dxl_angle2
    :type cl:float
    :initform 0.0)
   (dxl_angle3
    :reader dxl_angle3
    :initarg :dxl_angle3
    :type cl:float
    :initform 0.0)
   (dxl_angle4
    :reader dxl_angle4
    :initarg :dxl_angle4
    :type cl:float
    :initform 0.0)
   (dxl_angle5
    :reader dxl_angle5
    :initarg :dxl_angle5
    :type cl:float
    :initform 0.0))
)

(cl:defclass feedback_angles (<feedback_angles>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <feedback_angles>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'feedback_angles)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name snake_demo-msg:<feedback_angles> is deprecated: use snake_demo-msg:feedback_angles instead.")))

(cl:ensure-generic-function 'timestamp-val :lambda-list '(m))
(cl:defmethod timestamp-val ((m <feedback_angles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_demo-msg:timestamp-val is deprecated.  Use snake_demo-msg:timestamp instead.")
  (timestamp m))

(cl:ensure-generic-function 'sea_angle1-val :lambda-list '(m))
(cl:defmethod sea_angle1-val ((m <feedback_angles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_demo-msg:sea_angle1-val is deprecated.  Use snake_demo-msg:sea_angle1 instead.")
  (sea_angle1 m))

(cl:ensure-generic-function 'sea_angle2-val :lambda-list '(m))
(cl:defmethod sea_angle2-val ((m <feedback_angles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_demo-msg:sea_angle2-val is deprecated.  Use snake_demo-msg:sea_angle2 instead.")
  (sea_angle2 m))

(cl:ensure-generic-function 'sea_angle3-val :lambda-list '(m))
(cl:defmethod sea_angle3-val ((m <feedback_angles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_demo-msg:sea_angle3-val is deprecated.  Use snake_demo-msg:sea_angle3 instead.")
  (sea_angle3 m))

(cl:ensure-generic-function 'sea_angle4-val :lambda-list '(m))
(cl:defmethod sea_angle4-val ((m <feedback_angles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_demo-msg:sea_angle4-val is deprecated.  Use snake_demo-msg:sea_angle4 instead.")
  (sea_angle4 m))

(cl:ensure-generic-function 'sea_angle5-val :lambda-list '(m))
(cl:defmethod sea_angle5-val ((m <feedback_angles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_demo-msg:sea_angle5-val is deprecated.  Use snake_demo-msg:sea_angle5 instead.")
  (sea_angle5 m))

(cl:ensure-generic-function 'dxl_angle1-val :lambda-list '(m))
(cl:defmethod dxl_angle1-val ((m <feedback_angles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_demo-msg:dxl_angle1-val is deprecated.  Use snake_demo-msg:dxl_angle1 instead.")
  (dxl_angle1 m))

(cl:ensure-generic-function 'dxl_angle2-val :lambda-list '(m))
(cl:defmethod dxl_angle2-val ((m <feedback_angles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_demo-msg:dxl_angle2-val is deprecated.  Use snake_demo-msg:dxl_angle2 instead.")
  (dxl_angle2 m))

(cl:ensure-generic-function 'dxl_angle3-val :lambda-list '(m))
(cl:defmethod dxl_angle3-val ((m <feedback_angles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_demo-msg:dxl_angle3-val is deprecated.  Use snake_demo-msg:dxl_angle3 instead.")
  (dxl_angle3 m))

(cl:ensure-generic-function 'dxl_angle4-val :lambda-list '(m))
(cl:defmethod dxl_angle4-val ((m <feedback_angles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_demo-msg:dxl_angle4-val is deprecated.  Use snake_demo-msg:dxl_angle4 instead.")
  (dxl_angle4 m))

(cl:ensure-generic-function 'dxl_angle5-val :lambda-list '(m))
(cl:defmethod dxl_angle5-val ((m <feedback_angles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_demo-msg:dxl_angle5-val is deprecated.  Use snake_demo-msg:dxl_angle5 instead.")
  (dxl_angle5 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <feedback_angles>) ostream)
  "Serializes a message object of type '<feedback_angles>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'timestamp)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'timestamp)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'timestamp)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'timestamp)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'timestamp)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'timestamp)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'timestamp)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'timestamp)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'sea_angle1))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'sea_angle2))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'sea_angle3))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'sea_angle4))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'sea_angle5))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'dxl_angle1))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'dxl_angle2))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'dxl_angle3))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'dxl_angle4))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'dxl_angle5))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <feedback_angles>) istream)
  "Deserializes a message object of type '<feedback_angles>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'timestamp)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'timestamp)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'timestamp)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'timestamp)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'timestamp)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'timestamp)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'timestamp)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'timestamp)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'sea_angle1) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'sea_angle2) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'sea_angle3) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'sea_angle4) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'sea_angle5) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'dxl_angle1) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'dxl_angle2) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'dxl_angle3) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'dxl_angle4) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'dxl_angle5) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<feedback_angles>)))
  "Returns string type for a message object of type '<feedback_angles>"
  "snake_demo/feedback_angles")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'feedback_angles)))
  "Returns string type for a message object of type 'feedback_angles"
  "snake_demo/feedback_angles")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<feedback_angles>)))
  "Returns md5sum for a message object of type '<feedback_angles>"
  "2e66b029179d9b1560650234dca943c0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'feedback_angles)))
  "Returns md5sum for a message object of type 'feedback_angles"
  "2e66b029179d9b1560650234dca943c0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<feedback_angles>)))
  "Returns full string definition for message of type '<feedback_angles>"
  (cl:format cl:nil "uint64 timestamp~%float32 sea_angle1~%float32 sea_angle2~%float32 sea_angle3~%float32 sea_angle4~%float32 sea_angle5~%float32 dxl_angle1~%float32 dxl_angle2~%float32 dxl_angle3~%float32 dxl_angle4~%float32 dxl_angle5~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'feedback_angles)))
  "Returns full string definition for message of type 'feedback_angles"
  (cl:format cl:nil "uint64 timestamp~%float32 sea_angle1~%float32 sea_angle2~%float32 sea_angle3~%float32 sea_angle4~%float32 sea_angle5~%float32 dxl_angle1~%float32 dxl_angle2~%float32 dxl_angle3~%float32 dxl_angle4~%float32 dxl_angle5~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <feedback_angles>))
  (cl:+ 0
     8
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <feedback_angles>))
  "Converts a ROS message object to a list"
  (cl:list 'feedback_angles
    (cl:cons ':timestamp (timestamp msg))
    (cl:cons ':sea_angle1 (sea_angle1 msg))
    (cl:cons ':sea_angle2 (sea_angle2 msg))
    (cl:cons ':sea_angle3 (sea_angle3 msg))
    (cl:cons ':sea_angle4 (sea_angle4 msg))
    (cl:cons ':sea_angle5 (sea_angle5 msg))
    (cl:cons ':dxl_angle1 (dxl_angle1 msg))
    (cl:cons ':dxl_angle2 (dxl_angle2 msg))
    (cl:cons ':dxl_angle3 (dxl_angle3 msg))
    (cl:cons ':dxl_angle4 (dxl_angle4 msg))
    (cl:cons ':dxl_angle5 (dxl_angle5 msg))
))
