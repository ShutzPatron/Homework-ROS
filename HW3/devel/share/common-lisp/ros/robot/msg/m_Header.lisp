; Auto-generated. Do not edit!


(cl:in-package robot-msg)


;//! \htmlinclude m_Header.msg.html

(cl:defclass <m_Header> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (encL
    :reader encL
    :initarg :encL
    :type cl:integer
    :initform 0)
   (encR
    :reader encR
    :initarg :encR
    :type cl:integer
    :initform 0))
)

(cl:defclass m_Header (<m_Header>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <m_Header>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'm_Header)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot-msg:<m_Header> is deprecated: use robot-msg:m_Header instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <m_Header>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot-msg:header-val is deprecated.  Use robot-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'encL-val :lambda-list '(m))
(cl:defmethod encL-val ((m <m_Header>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot-msg:encL-val is deprecated.  Use robot-msg:encL instead.")
  (encL m))

(cl:ensure-generic-function 'encR-val :lambda-list '(m))
(cl:defmethod encR-val ((m <m_Header>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot-msg:encR-val is deprecated.  Use robot-msg:encR instead.")
  (encR m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <m_Header>) ostream)
  "Serializes a message object of type '<m_Header>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'encL)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'encL)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'encL)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'encL)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'encR)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'encR)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'encR)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'encR)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <m_Header>) istream)
  "Deserializes a message object of type '<m_Header>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'encL)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'encL)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'encL)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'encL)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'encR)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'encR)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'encR)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'encR)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<m_Header>)))
  "Returns string type for a message object of type '<m_Header>"
  "robot/m_Header")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'm_Header)))
  "Returns string type for a message object of type 'm_Header"
  "robot/m_Header")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<m_Header>)))
  "Returns md5sum for a message object of type '<m_Header>"
  "bc65232a7e871f803f44662610342278")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'm_Header)))
  "Returns md5sum for a message object of type 'm_Header"
  "bc65232a7e871f803f44662610342278")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<m_Header>)))
  "Returns full string definition for message of type '<m_Header>"
  (cl:format cl:nil "std_msgs/Header header~%uint32 encL~%uint32 encR~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'm_Header)))
  "Returns full string definition for message of type 'm_Header"
  (cl:format cl:nil "std_msgs/Header header~%uint32 encL~%uint32 encR~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <m_Header>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <m_Header>))
  "Converts a ROS message object to a list"
  (cl:list 'm_Header
    (cl:cons ':header (header msg))
    (cl:cons ':encL (encL msg))
    (cl:cons ':encR (encR msg))
))
