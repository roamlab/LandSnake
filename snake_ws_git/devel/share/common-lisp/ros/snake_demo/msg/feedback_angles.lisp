; Auto-generated. Do not edit!


(cl:in-package snake_demo-msg)


;//! \htmlinclude feedback_angles.msg.html

(cl:defclass <feedback_angles> (roslisp-msg-protocol:ros-message)
  ((timestamp
    :reader timestamp
    :initarg :timestamp
    :type cl:integer
    :initform 0)
   (enc_angle1
    :reader enc_angle1
    :initarg :enc_angle1
    :type cl:float
    :initform 0.0)
   (enc_angle2
    :reader enc_angle2
    :initarg :enc_angle2
    :type cl:float
    :initform 0.0)
   (enc_angle3
    :reader enc_angle3
    :initarg :enc_angle3
    :type cl:float
    :initform 0.0)
   (enc_angle4
    :reader enc_angle4
    :initarg :enc_angle4
    :type cl:float
    :initform 0.0)
   (enc_angle5
    :reader enc_angle5
    :initarg :enc_angle5
    :type cl:float
    :initform 0.0)
   (xvel1
    :reader xvel1
    :initarg :xvel1
    :type cl:fixnum
    :initform 0)
   (yvel1
    :reader yvel1
    :initarg :yvel1
    :type cl:fixnum
    :initform 0)
   (xvel2
    :reader xvel2
    :initarg :xvel2
    :type cl:fixnum
    :initform 0)
   (yvel2
    :reader yvel2
    :initarg :yvel2
    :type cl:fixnum
    :initform 0)
   (xvel3
    :reader xvel3
    :initarg :xvel3
    :type cl:fixnum
    :initform 0)
   (yvel3
    :reader yvel3
    :initarg :yvel3
    :type cl:fixnum
    :initform 0)
   (xvel4
    :reader xvel4
    :initarg :xvel4
    :type cl:fixnum
    :initform 0)
   (yvel4
    :reader yvel4
    :initarg :yvel4
    :type cl:fixnum
    :initform 0)
   (xvel5
    :reader xvel5
    :initarg :xvel5
    :type cl:fixnum
    :initform 0)
   (yvel5
    :reader yvel5
    :initarg :yvel5
    :type cl:fixnum
    :initform 0))
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

(cl:ensure-generic-function 'enc_angle1-val :lambda-list '(m))
(cl:defmethod enc_angle1-val ((m <feedback_angles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_demo-msg:enc_angle1-val is deprecated.  Use snake_demo-msg:enc_angle1 instead.")
  (enc_angle1 m))

(cl:ensure-generic-function 'enc_angle2-val :lambda-list '(m))
(cl:defmethod enc_angle2-val ((m <feedback_angles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_demo-msg:enc_angle2-val is deprecated.  Use snake_demo-msg:enc_angle2 instead.")
  (enc_angle2 m))

(cl:ensure-generic-function 'enc_angle3-val :lambda-list '(m))
(cl:defmethod enc_angle3-val ((m <feedback_angles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_demo-msg:enc_angle3-val is deprecated.  Use snake_demo-msg:enc_angle3 instead.")
  (enc_angle3 m))

(cl:ensure-generic-function 'enc_angle4-val :lambda-list '(m))
(cl:defmethod enc_angle4-val ((m <feedback_angles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_demo-msg:enc_angle4-val is deprecated.  Use snake_demo-msg:enc_angle4 instead.")
  (enc_angle4 m))

(cl:ensure-generic-function 'enc_angle5-val :lambda-list '(m))
(cl:defmethod enc_angle5-val ((m <feedback_angles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_demo-msg:enc_angle5-val is deprecated.  Use snake_demo-msg:enc_angle5 instead.")
  (enc_angle5 m))

(cl:ensure-generic-function 'xvel1-val :lambda-list '(m))
(cl:defmethod xvel1-val ((m <feedback_angles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_demo-msg:xvel1-val is deprecated.  Use snake_demo-msg:xvel1 instead.")
  (xvel1 m))

(cl:ensure-generic-function 'yvel1-val :lambda-list '(m))
(cl:defmethod yvel1-val ((m <feedback_angles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_demo-msg:yvel1-val is deprecated.  Use snake_demo-msg:yvel1 instead.")
  (yvel1 m))

(cl:ensure-generic-function 'xvel2-val :lambda-list '(m))
(cl:defmethod xvel2-val ((m <feedback_angles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_demo-msg:xvel2-val is deprecated.  Use snake_demo-msg:xvel2 instead.")
  (xvel2 m))

(cl:ensure-generic-function 'yvel2-val :lambda-list '(m))
(cl:defmethod yvel2-val ((m <feedback_angles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_demo-msg:yvel2-val is deprecated.  Use snake_demo-msg:yvel2 instead.")
  (yvel2 m))

(cl:ensure-generic-function 'xvel3-val :lambda-list '(m))
(cl:defmethod xvel3-val ((m <feedback_angles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_demo-msg:xvel3-val is deprecated.  Use snake_demo-msg:xvel3 instead.")
  (xvel3 m))

(cl:ensure-generic-function 'yvel3-val :lambda-list '(m))
(cl:defmethod yvel3-val ((m <feedback_angles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_demo-msg:yvel3-val is deprecated.  Use snake_demo-msg:yvel3 instead.")
  (yvel3 m))

(cl:ensure-generic-function 'xvel4-val :lambda-list '(m))
(cl:defmethod xvel4-val ((m <feedback_angles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_demo-msg:xvel4-val is deprecated.  Use snake_demo-msg:xvel4 instead.")
  (xvel4 m))

(cl:ensure-generic-function 'yvel4-val :lambda-list '(m))
(cl:defmethod yvel4-val ((m <feedback_angles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_demo-msg:yvel4-val is deprecated.  Use snake_demo-msg:yvel4 instead.")
  (yvel4 m))

(cl:ensure-generic-function 'xvel5-val :lambda-list '(m))
(cl:defmethod xvel5-val ((m <feedback_angles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_demo-msg:xvel5-val is deprecated.  Use snake_demo-msg:xvel5 instead.")
  (xvel5 m))

(cl:ensure-generic-function 'yvel5-val :lambda-list '(m))
(cl:defmethod yvel5-val ((m <feedback_angles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_demo-msg:yvel5-val is deprecated.  Use snake_demo-msg:yvel5 instead.")
  (yvel5 m))
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
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'enc_angle1))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'enc_angle2))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'enc_angle3))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'enc_angle4))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'enc_angle5))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'xvel1)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'yvel1)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'xvel2)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'yvel2)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'xvel3)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'yvel3)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'xvel4)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'yvel4)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'xvel5)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'yvel5)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
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
    (cl:setf (cl:slot-value msg 'enc_angle1) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'enc_angle2) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'enc_angle3) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'enc_angle4) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'enc_angle5) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'xvel1) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'yvel1) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'xvel2) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'yvel2) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'xvel3) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'yvel3) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'xvel4) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'yvel4) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'xvel5) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'yvel5) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
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
  "efca087178a4608ce59813f65425d68e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'feedback_angles)))
  "Returns md5sum for a message object of type 'feedback_angles"
  "efca087178a4608ce59813f65425d68e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<feedback_angles>)))
  "Returns full string definition for message of type '<feedback_angles>"
  (cl:format cl:nil "uint64 timestamp~%float32 enc_angle1~%float32 enc_angle2~%float32 enc_angle3~%float32 enc_angle4~%float32 enc_angle5~%int16 xvel1~%int16 yvel1~%int16 xvel2~%int16 yvel2~%int16 xvel3~%int16 yvel3~%int16 xvel4~%int16 yvel4~%int16 xvel5~%int16 yvel5~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'feedback_angles)))
  "Returns full string definition for message of type 'feedback_angles"
  (cl:format cl:nil "uint64 timestamp~%float32 enc_angle1~%float32 enc_angle2~%float32 enc_angle3~%float32 enc_angle4~%float32 enc_angle5~%int16 xvel1~%int16 yvel1~%int16 xvel2~%int16 yvel2~%int16 xvel3~%int16 yvel3~%int16 xvel4~%int16 yvel4~%int16 xvel5~%int16 yvel5~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <feedback_angles>))
  (cl:+ 0
     8
     4
     4
     4
     4
     4
     2
     2
     2
     2
     2
     2
     2
     2
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <feedback_angles>))
  "Converts a ROS message object to a list"
  (cl:list 'feedback_angles
    (cl:cons ':timestamp (timestamp msg))
    (cl:cons ':enc_angle1 (enc_angle1 msg))
    (cl:cons ':enc_angle2 (enc_angle2 msg))
    (cl:cons ':enc_angle3 (enc_angle3 msg))
    (cl:cons ':enc_angle4 (enc_angle4 msg))
    (cl:cons ':enc_angle5 (enc_angle5 msg))
    (cl:cons ':xvel1 (xvel1 msg))
    (cl:cons ':yvel1 (yvel1 msg))
    (cl:cons ':xvel2 (xvel2 msg))
    (cl:cons ':yvel2 (yvel2 msg))
    (cl:cons ':xvel3 (xvel3 msg))
    (cl:cons ':yvel3 (yvel3 msg))
    (cl:cons ':xvel4 (xvel4 msg))
    (cl:cons ':yvel4 (yvel4 msg))
    (cl:cons ':xvel5 (xvel5 msg))
    (cl:cons ':yvel5 (yvel5 msg))
))
