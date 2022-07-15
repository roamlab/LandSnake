; Auto-generated. Do not edit!


(cl:in-package snake_demo-msg)


;//! \htmlinclude calculations.msg.html

(cl:defclass <calculations> (roslisp-msg-protocol:ros-message)
  ((timestamp
    :reader timestamp
    :initarg :timestamp
    :type cl:integer
    :initform 0)
   (torque1
    :reader torque1
    :initarg :torque1
    :type cl:float
    :initform 0.0)
   (torque2
    :reader torque2
    :initarg :torque2
    :type cl:float
    :initform 0.0)
   (torque3
    :reader torque3
    :initarg :torque3
    :type cl:float
    :initform 0.0)
   (torque4
    :reader torque4
    :initarg :torque4
    :type cl:float
    :initform 0.0)
   (torque5
    :reader torque5
    :initarg :torque5
    :type cl:float
    :initform 0.0)
   (angvel1
    :reader angvel1
    :initarg :angvel1
    :type cl:float
    :initform 0.0)
   (angvel2
    :reader angvel2
    :initarg :angvel2
    :type cl:float
    :initform 0.0)
   (angvel3
    :reader angvel3
    :initarg :angvel3
    :type cl:float
    :initform 0.0)
   (angvel4
    :reader angvel4
    :initarg :angvel4
    :type cl:float
    :initform 0.0)
   (angvel5
    :reader angvel5
    :initarg :angvel5
    :type cl:float
    :initform 0.0)
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
    :initform 0.0))
)

(cl:defclass calculations (<calculations>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <calculations>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'calculations)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name snake_demo-msg:<calculations> is deprecated: use snake_demo-msg:calculations instead.")))

(cl:ensure-generic-function 'timestamp-val :lambda-list '(m))
(cl:defmethod timestamp-val ((m <calculations>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_demo-msg:timestamp-val is deprecated.  Use snake_demo-msg:timestamp instead.")
  (timestamp m))

(cl:ensure-generic-function 'torque1-val :lambda-list '(m))
(cl:defmethod torque1-val ((m <calculations>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_demo-msg:torque1-val is deprecated.  Use snake_demo-msg:torque1 instead.")
  (torque1 m))

(cl:ensure-generic-function 'torque2-val :lambda-list '(m))
(cl:defmethod torque2-val ((m <calculations>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_demo-msg:torque2-val is deprecated.  Use snake_demo-msg:torque2 instead.")
  (torque2 m))

(cl:ensure-generic-function 'torque3-val :lambda-list '(m))
(cl:defmethod torque3-val ((m <calculations>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_demo-msg:torque3-val is deprecated.  Use snake_demo-msg:torque3 instead.")
  (torque3 m))

(cl:ensure-generic-function 'torque4-val :lambda-list '(m))
(cl:defmethod torque4-val ((m <calculations>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_demo-msg:torque4-val is deprecated.  Use snake_demo-msg:torque4 instead.")
  (torque4 m))

(cl:ensure-generic-function 'torque5-val :lambda-list '(m))
(cl:defmethod torque5-val ((m <calculations>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_demo-msg:torque5-val is deprecated.  Use snake_demo-msg:torque5 instead.")
  (torque5 m))

(cl:ensure-generic-function 'angvel1-val :lambda-list '(m))
(cl:defmethod angvel1-val ((m <calculations>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_demo-msg:angvel1-val is deprecated.  Use snake_demo-msg:angvel1 instead.")
  (angvel1 m))

(cl:ensure-generic-function 'angvel2-val :lambda-list '(m))
(cl:defmethod angvel2-val ((m <calculations>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_demo-msg:angvel2-val is deprecated.  Use snake_demo-msg:angvel2 instead.")
  (angvel2 m))

(cl:ensure-generic-function 'angvel3-val :lambda-list '(m))
(cl:defmethod angvel3-val ((m <calculations>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_demo-msg:angvel3-val is deprecated.  Use snake_demo-msg:angvel3 instead.")
  (angvel3 m))

(cl:ensure-generic-function 'angvel4-val :lambda-list '(m))
(cl:defmethod angvel4-val ((m <calculations>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_demo-msg:angvel4-val is deprecated.  Use snake_demo-msg:angvel4 instead.")
  (angvel4 m))

(cl:ensure-generic-function 'angvel5-val :lambda-list '(m))
(cl:defmethod angvel5-val ((m <calculations>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_demo-msg:angvel5-val is deprecated.  Use snake_demo-msg:angvel5 instead.")
  (angvel5 m))

(cl:ensure-generic-function 'enc_angle1-val :lambda-list '(m))
(cl:defmethod enc_angle1-val ((m <calculations>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_demo-msg:enc_angle1-val is deprecated.  Use snake_demo-msg:enc_angle1 instead.")
  (enc_angle1 m))

(cl:ensure-generic-function 'enc_angle2-val :lambda-list '(m))
(cl:defmethod enc_angle2-val ((m <calculations>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_demo-msg:enc_angle2-val is deprecated.  Use snake_demo-msg:enc_angle2 instead.")
  (enc_angle2 m))

(cl:ensure-generic-function 'enc_angle3-val :lambda-list '(m))
(cl:defmethod enc_angle3-val ((m <calculations>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_demo-msg:enc_angle3-val is deprecated.  Use snake_demo-msg:enc_angle3 instead.")
  (enc_angle3 m))

(cl:ensure-generic-function 'enc_angle4-val :lambda-list '(m))
(cl:defmethod enc_angle4-val ((m <calculations>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_demo-msg:enc_angle4-val is deprecated.  Use snake_demo-msg:enc_angle4 instead.")
  (enc_angle4 m))

(cl:ensure-generic-function 'enc_angle5-val :lambda-list '(m))
(cl:defmethod enc_angle5-val ((m <calculations>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_demo-msg:enc_angle5-val is deprecated.  Use snake_demo-msg:enc_angle5 instead.")
  (enc_angle5 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <calculations>) ostream)
  "Serializes a message object of type '<calculations>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'timestamp)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'timestamp)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'timestamp)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'timestamp)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'timestamp)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'timestamp)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'timestamp)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'timestamp)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'torque1))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'torque2))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'torque3))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'torque4))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'torque5))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'angvel1))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'angvel2))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'angvel3))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'angvel4))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'angvel5))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
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
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <calculations>) istream)
  "Deserializes a message object of type '<calculations>"
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
    (cl:setf (cl:slot-value msg 'torque1) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'torque2) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'torque3) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'torque4) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'torque5) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angvel1) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angvel2) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angvel3) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angvel4) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angvel5) (roslisp-utils:decode-single-float-bits bits)))
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
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<calculations>)))
  "Returns string type for a message object of type '<calculations>"
  "snake_demo/calculations")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'calculations)))
  "Returns string type for a message object of type 'calculations"
  "snake_demo/calculations")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<calculations>)))
  "Returns md5sum for a message object of type '<calculations>"
  "0391199eca786947ffc0b714f855b349")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'calculations)))
  "Returns md5sum for a message object of type 'calculations"
  "0391199eca786947ffc0b714f855b349")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<calculations>)))
  "Returns full string definition for message of type '<calculations>"
  (cl:format cl:nil "uint64 timestamp~%float32 torque1~%float32 torque2~%float32 torque3~%float32 torque4~%float32 torque5~%float32 angvel1~%float32 angvel2~%float32 angvel3~%float32 angvel4~%float32 angvel5~%float32 enc_angle1~%float32 enc_angle2~%float32 enc_angle3~%float32 enc_angle4~%float32 enc_angle5~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'calculations)))
  "Returns full string definition for message of type 'calculations"
  (cl:format cl:nil "uint64 timestamp~%float32 torque1~%float32 torque2~%float32 torque3~%float32 torque4~%float32 torque5~%float32 angvel1~%float32 angvel2~%float32 angvel3~%float32 angvel4~%float32 angvel5~%float32 enc_angle1~%float32 enc_angle2~%float32 enc_angle3~%float32 enc_angle4~%float32 enc_angle5~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <calculations>))
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
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <calculations>))
  "Converts a ROS message object to a list"
  (cl:list 'calculations
    (cl:cons ':timestamp (timestamp msg))
    (cl:cons ':torque1 (torque1 msg))
    (cl:cons ':torque2 (torque2 msg))
    (cl:cons ':torque3 (torque3 msg))
    (cl:cons ':torque4 (torque4 msg))
    (cl:cons ':torque5 (torque5 msg))
    (cl:cons ':angvel1 (angvel1 msg))
    (cl:cons ':angvel2 (angvel2 msg))
    (cl:cons ':angvel3 (angvel3 msg))
    (cl:cons ':angvel4 (angvel4 msg))
    (cl:cons ':angvel5 (angvel5 msg))
    (cl:cons ':enc_angle1 (enc_angle1 msg))
    (cl:cons ':enc_angle2 (enc_angle2 msg))
    (cl:cons ':enc_angle3 (enc_angle3 msg))
    (cl:cons ':enc_angle4 (enc_angle4 msg))
    (cl:cons ':enc_angle5 (enc_angle5 msg))
))
