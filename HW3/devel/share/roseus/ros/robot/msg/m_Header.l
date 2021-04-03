;; Auto-generated. Do not edit!


(when (boundp 'robot::m_Header)
  (if (not (find-package "ROBOT"))
    (make-package "ROBOT"))
  (shadow 'm_Header (find-package "ROBOT")))
(unless (find-package "ROBOT::M_HEADER")
  (make-package "ROBOT::M_HEADER"))

(in-package "ROS")
;;//! \htmlinclude m_Header.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass robot::m_Header
  :super ros::object
  :slots (_header _encL _encR ))

(defmethod robot::m_Header
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:encL __encL) 0)
    ((:encR __encR) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _encL (round __encL))
   (setq _encR (round __encR))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:encL
   (&optional __encL)
   (if __encL (setq _encL __encL)) _encL)
  (:encR
   (&optional __encR)
   (if __encR (setq _encR __encR)) _encR)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint32 _encL
    4
    ;; uint32 _encR
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint32 _encL
       (write-long _encL s)
     ;; uint32 _encR
       (write-long _encR s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint32 _encL
     (setq _encL (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _encR
     (setq _encR (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get robot::m_Header :md5sum-) "bc65232a7e871f803f44662610342278")
(setf (get robot::m_Header :datatype-) "robot/m_Header")
(setf (get robot::m_Header :definition-)
      "std_msgs/Header header
uint32 encL
uint32 encR

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

")



(provide :robot/m_Header "bc65232a7e871f803f44662610342278")


