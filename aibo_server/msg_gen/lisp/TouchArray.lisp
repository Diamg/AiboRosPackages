; Auto-generated. Do not edit!


(cl:in-package aibo_server-msg)


;//! \htmlinclude TouchArray.msg.html

(cl:defclass <TouchArray> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (touch
    :reader touch
    :initarg :touch
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass TouchArray (<TouchArray>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TouchArray>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TouchArray)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name aibo_server-msg:<TouchArray> is deprecated: use aibo_server-msg:TouchArray instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <TouchArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader aibo_server-msg:header-val is deprecated.  Use aibo_server-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'touch-val :lambda-list '(m))
(cl:defmethod touch-val ((m <TouchArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader aibo_server-msg:touch-val is deprecated.  Use aibo_server-msg:touch instead.")
  (touch m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TouchArray>) ostream)
  "Serializes a message object of type '<TouchArray>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'touch))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'touch))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TouchArray>) istream)
  "Deserializes a message object of type '<TouchArray>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'touch) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'touch)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TouchArray>)))
  "Returns string type for a message object of type '<TouchArray>"
  "aibo_server/TouchArray")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TouchArray)))
  "Returns string type for a message object of type 'TouchArray"
  "aibo_server/TouchArray")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TouchArray>)))
  "Returns md5sum for a message object of type '<TouchArray>"
  "a25e66f7f3a5ee03b523486ae89ca221")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TouchArray)))
  "Returns md5sum for a message object of type 'TouchArray"
  "a25e66f7f3a5ee03b523486ae89ca221")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TouchArray>)))
  "Returns full string definition for message of type '<TouchArray>"
  (cl:format cl:nil "#ROS header~%Header header~%~%#The IR of the Aibo~%float64[] touch~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TouchArray)))
  "Returns full string definition for message of type 'TouchArray"
  (cl:format cl:nil "#ROS header~%Header header~%~%#The IR of the Aibo~%float64[] touch~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TouchArray>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'touch) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TouchArray>))
  "Converts a ROS message object to a list"
  (cl:list 'TouchArray
    (cl:cons ':header (header msg))
    (cl:cons ':touch (touch msg))
))
