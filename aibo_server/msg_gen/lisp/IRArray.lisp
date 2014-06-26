; Auto-generated. Do not edit!


(cl:in-package aibo_server-msg)


;//! \htmlinclude IRArray.msg.html

(cl:defclass <IRArray> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (IRs
    :reader IRs
    :initarg :IRs
    :type (cl:vector sensor_msgs-msg:Range)
   :initform (cl:make-array 0 :element-type 'sensor_msgs-msg:Range :initial-element (cl:make-instance 'sensor_msgs-msg:Range))))
)

(cl:defclass IRArray (<IRArray>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <IRArray>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'IRArray)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name aibo_server-msg:<IRArray> is deprecated: use aibo_server-msg:IRArray instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <IRArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader aibo_server-msg:header-val is deprecated.  Use aibo_server-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'IRs-val :lambda-list '(m))
(cl:defmethod IRs-val ((m <IRArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader aibo_server-msg:IRs-val is deprecated.  Use aibo_server-msg:IRs instead.")
  (IRs m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <IRArray>) ostream)
  "Serializes a message object of type '<IRArray>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'IRs))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'IRs))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <IRArray>) istream)
  "Deserializes a message object of type '<IRArray>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'IRs) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'IRs)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'sensor_msgs-msg:Range))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<IRArray>)))
  "Returns string type for a message object of type '<IRArray>"
  "aibo_server/IRArray")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'IRArray)))
  "Returns string type for a message object of type 'IRArray"
  "aibo_server/IRArray")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<IRArray>)))
  "Returns md5sum for a message object of type '<IRArray>"
  "08dd08b5a35cb1b60662e4a086cf11e7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'IRArray)))
  "Returns md5sum for a message object of type 'IRArray"
  "08dd08b5a35cb1b60662e4a086cf11e7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<IRArray>)))
  "Returns full string definition for message of type '<IRArray>"
  (cl:format cl:nil "#ROS header~%Header header~%~%#The IR of the Aibo~%sensor_msgs/Range[] IRs~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/Range~%# Single range reading from an active ranger that emits energy and reports~%# one range reading that is valid along an arc at the distance measured. ~%# This message is not appropriate for fixed-range obstacle detectors, ~%# such as the Sharp GP2D15. This message is also not appropriate for laser ~%# scanners. See the LaserScan message if you are working with a laser scanner.~%~%Header header    	# timestamp in the header is the time the ranger~%		 	# returned the distance reading~%~%# Radiation type enums~%# If you want a value added to this list, send an email to the ros-users list~%uint8 ULTRASOUND=0~%uint8 INFRARED=1~%~%uint8 radiation_type    # the type of radiation used by the sensor~%		 	# (sound, IR, etc) [enum]~%~%float32 field_of_view   # the size of the arc that the distance reading is~%		 	# valid for [rad]~%		 	# the object causing the range reading may have~%		 	# been anywhere within -field_of_view/2 and~%		 	# field_of_view/2 at the measured range. ~%                        # 0 angle corresponds to the x-axis of the sensor.~%~%float32 min_range       # minimum range value [m]~%float32 max_range       # maximum range value [m]~%~%float32 range           # range data [m]~%		 	# (Note: values < range_min or > range_max~%		 	# should be discarded)~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'IRArray)))
  "Returns full string definition for message of type 'IRArray"
  (cl:format cl:nil "#ROS header~%Header header~%~%#The IR of the Aibo~%sensor_msgs/Range[] IRs~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/Range~%# Single range reading from an active ranger that emits energy and reports~%# one range reading that is valid along an arc at the distance measured. ~%# This message is not appropriate for fixed-range obstacle detectors, ~%# such as the Sharp GP2D15. This message is also not appropriate for laser ~%# scanners. See the LaserScan message if you are working with a laser scanner.~%~%Header header    	# timestamp in the header is the time the ranger~%		 	# returned the distance reading~%~%# Radiation type enums~%# If you want a value added to this list, send an email to the ros-users list~%uint8 ULTRASOUND=0~%uint8 INFRARED=1~%~%uint8 radiation_type    # the type of radiation used by the sensor~%		 	# (sound, IR, etc) [enum]~%~%float32 field_of_view   # the size of the arc that the distance reading is~%		 	# valid for [rad]~%		 	# the object causing the range reading may have~%		 	# been anywhere within -field_of_view/2 and~%		 	# field_of_view/2 at the measured range. ~%                        # 0 angle corresponds to the x-axis of the sensor.~%~%float32 min_range       # minimum range value [m]~%float32 max_range       # maximum range value [m]~%~%float32 range           # range data [m]~%		 	# (Note: values < range_min or > range_max~%		 	# should be discarded)~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <IRArray>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'IRs) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <IRArray>))
  "Converts a ROS message object to a list"
  (cl:list 'IRArray
    (cl:cons ':header (header msg))
    (cl:cons ':IRs (IRs msg))
))
