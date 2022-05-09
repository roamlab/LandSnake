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
    :initform 0.0)
   (cmd_angle1
    :reader cmd_angle1
    :initarg :cmd_angle1
    :type cl:float
    :initform 0.0)
   (cmd_angle2
    :reader cmd_angle2
    :initarg :cmd_angle2
    :type cl:float
    :initform 0.0)
   (cmd_angle3
    :reader cmd_angle3
    :initarg :cmd_angle3
    :type cl:float
    :initform 0.0)
   (cmd_angle4
    :reader cmd_angle4
    :initarg :cmd_angle4
    :type cl:float
    :initform 0.0)
   (cmd_angle5
    :reader cmd_angle5
    :initarg :cmd_angle5
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

(cl:ensure-generic-function 'cmd_angle1-val :lambda-list '(m))
(cl:defmethod cmd_angle1-val ((m <feedback_angles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_demo-msg:cmd_angle1-val is deprecated.  Use snake_demo-msg:cmd_angle1 instead.")
  (cmd_angle1 m))

(cl:ensure-generic-function 'cmd_angle2-val :lambda-list '(m))
(cl:defmethod cmd_angle2-val ((m <feedback_angles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_demo-msg:cmd_angle2-val is deprecated.  Use snake_demo-msg:cmd_angle2 instead.")
  (cmd_angle2 m))

(cl:ensure-generic-function 'cmd_angle3-val :lambda-list '(m))
(cl:defmethod cmd_angle3-val ((m <feedback_angles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_demo-msg:cmd_angle3-val is deprecated.  Use snake_demo-msg:cmd_angle3 instead.")
  (cmd_angle3 m))

(cl:ensure-generic-function 'cmd_angle4-val :lambda-list '(m))
(cl:defmethod cmd_angle4-val ((m <feedback_angles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_demo-msg:cmd_angle4-val is deprecated.  Use snake_demo-msg:cmd_angle4 instead.")
  (cmd_angle4 m))

(cl:ensure-generic-function 'cmd_angle5-val :lambda-list '(m))
(cl:defmethod cmd_angle5-val ((m <feedback_angles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_demo-msg:cmd_angle5-val is deprecated.  Use snake_demo-msg:cmd_angle5 instead.")
  (cmd_angle5 m))
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
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'cmd_angle1))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'cmd_angle2))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'cmd_angle3))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'cmd_angle4))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'cmd_angle5))))
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
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'cmd_angle1) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'cmd_angle2) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'cmd_angle3) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'cmd_angle4) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'cmd_angle5) (roslisp-utils:decode-single-float-bits bits)))
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
  "de147108c73c5ee162b8e21c32f2c9e6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'feedback_angles)))
  "Returns md5sum for a message object of type 'feedback_angles"
  "de147108c73c5ee162b8e21c32f2c9e6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<feedback_angles>)))
  "Returns full string definition for message of type '<feedback_angles>"
  (cl:format cl:nil "uint64 timestamp~%float32 enc_angle1~%float32 enc_angle2~%float32 enc_angle3~%float32 enc_angle4~%float32 enc_angle5~%float32 dxl_angle1~%float32 dxl_angle2~%float32 dxl_angle3~%float32 dxl_angle4~%float32 dxl_angle5~%float32 cmd_angle1~%float32 cmd_angle2~%float32 cmd_angle3~%float32 cmd_angle4~%float32 cmd_angle5~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'feedback_angles)))
  "Returns full string definition for message of type 'feedback_angles"
  (cl:format cl:nil "uint64 timestamp~%float32 enc_angle1~%float32 enc_angle2~%float32 enc_angle3~%float32 enc_angle4~%float32 enc_angle5~%float32 dxl_angle1~%float32 dxl_angle2~%float32 dxl_angle3~%float32 dxl_angle4~%float32 dxl_angle5~%float32 cmd_angle1~%float32 cmd_angle2~%float32 cmd_angle3~%float32 cmd_angle4~%float32 cmd_angle5~%~%~%"))
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
    (cl:cons ':enc_angle1 (enc_angle1 msg))
    (cl:cons ':enc_angle2 (enc_angle2 msg))
    (cl:cons ':enc_angle3 (enc_angle3 msg))
    (cl:cons ':enc_angle4 (enc_angle4 msg))
    (cl:cons ':enc_angle5 (enc_angle5 msg))
    (cl:cons ':dxl_angle1 (dxl_angle1 msg))
    (cl:cons ':dxl_angle2 (dxl_angle2 msg))
    (cl:cons ':dxl_angle3 (dxl_angle3 msg))
    (cl:cons ':dxl_angle4 (dxl_angle4 msg))
    (cl:cons ':dxl_angle5 (dxl_angle5 msg))
    (cl:cons ':cmd_angle1 (cmd_angle1 msg))
    (cl:cons ':cmd_angle2 (cmd_angle2 msg))
    (cl:cons ':cmd_angle3 (cmd_angle3 msg))
    (cl:cons ':cmd_angle4 (cmd_angle4 msg))
    (cl:cons ':cmd_angle5 (cmd_angle5 msg))
))
