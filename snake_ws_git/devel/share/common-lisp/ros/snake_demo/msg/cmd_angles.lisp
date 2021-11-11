; Auto-generated. Do not edit!


(cl:in-package snake_demo-msg)


;//! \htmlinclude cmd_angles.msg.html

(cl:defclass <cmd_angles> (roslisp-msg-protocol:ros-message)
  ((angle1
    :reader angle1
    :initarg :angle1
    :type cl:float
    :initform 0.0)
   (angle2
    :reader angle2
    :initarg :angle2
    :type cl:float
    :initform 0.0)
   (angle3
    :reader angle3
    :initarg :angle3
    :type cl:float
    :initform 0.0)
   (angle4
    :reader angle4
    :initarg :angle4
    :type cl:float
    :initform 0.0)
   (angle5
    :reader angle5
    :initarg :angle5
    :type cl:float
    :initform 0.0))
)

(cl:defclass cmd_angles (<cmd_angles>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <cmd_angles>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'cmd_angles)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name snake_demo-msg:<cmd_angles> is deprecated: use snake_demo-msg:cmd_angles instead.")))

(cl:ensure-generic-function 'angle1-val :lambda-list '(m))
(cl:defmethod angle1-val ((m <cmd_angles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_demo-msg:angle1-val is deprecated.  Use snake_demo-msg:angle1 instead.")
  (angle1 m))

(cl:ensure-generic-function 'angle2-val :lambda-list '(m))
(cl:defmethod angle2-val ((m <cmd_angles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_demo-msg:angle2-val is deprecated.  Use snake_demo-msg:angle2 instead.")
  (angle2 m))

(cl:ensure-generic-function 'angle3-val :lambda-list '(m))
(cl:defmethod angle3-val ((m <cmd_angles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_demo-msg:angle3-val is deprecated.  Use snake_demo-msg:angle3 instead.")
  (angle3 m))

(cl:ensure-generic-function 'angle4-val :lambda-list '(m))
(cl:defmethod angle4-val ((m <cmd_angles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_demo-msg:angle4-val is deprecated.  Use snake_demo-msg:angle4 instead.")
  (angle4 m))

(cl:ensure-generic-function 'angle5-val :lambda-list '(m))
(cl:defmethod angle5-val ((m <cmd_angles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snake_demo-msg:angle5-val is deprecated.  Use snake_demo-msg:angle5 instead.")
  (angle5 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <cmd_angles>) ostream)
  "Serializes a message object of type '<cmd_angles>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'angle1))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'angle2))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'angle3))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'angle4))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'angle5))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <cmd_angles>) istream)
  "Deserializes a message object of type '<cmd_angles>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angle1) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angle2) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angle3) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angle4) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angle5) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<cmd_angles>)))
  "Returns string type for a message object of type '<cmd_angles>"
  "snake_demo/cmd_angles")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'cmd_angles)))
  "Returns string type for a message object of type 'cmd_angles"
  "snake_demo/cmd_angles")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<cmd_angles>)))
  "Returns md5sum for a message object of type '<cmd_angles>"
  "b55ed2e9fa1052eea0ca3ebe1016bcf9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'cmd_angles)))
  "Returns md5sum for a message object of type 'cmd_angles"
  "b55ed2e9fa1052eea0ca3ebe1016bcf9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<cmd_angles>)))
  "Returns full string definition for message of type '<cmd_angles>"
  (cl:format cl:nil "float32 angle1~%float32 angle2~%float32 angle3~%float32 angle4~%float32 angle5~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'cmd_angles)))
  "Returns full string definition for message of type 'cmd_angles"
  (cl:format cl:nil "float32 angle1~%float32 angle2~%float32 angle3~%float32 angle4~%float32 angle5~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <cmd_angles>))
  (cl:+ 0
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <cmd_angles>))
  "Converts a ROS message object to a list"
  (cl:list 'cmd_angles
    (cl:cons ':angle1 (angle1 msg))
    (cl:cons ':angle2 (angle2 msg))
    (cl:cons ':angle3 (angle3 msg))
    (cl:cons ':angle4 (angle4 msg))
    (cl:cons ':angle5 (angle5 msg))
))
