import telnetlib
import time
import rospy
from std_msgs.msg import String
from aibo_server import Joints

def getAllJoints():
	te.write("legLF1.val;")
	data=te.read_some()
	joi.legLF1=float(data.split("]")[1])
	te.write("legLF2.val;")
	data=te.read_some()
	joi.legLF2=float(data.split("]")[1])
	te.write("legLF3.val;")
	data=te.read_some()
	joi.legLF3=float(data.split("]")[1])
	te.write("legLH1.val;")
	data=te.read_some()
	joi.legLH1=float(data.split("]")[1])
	te.write("legLH2.val;")
	data=te.read_some()
	joi.legLH2=float(data.split("]")[1])
	te.write("legLH3.val;")
	data=te.read_some()
	joi.legLH3=float(data.split("]")[1])
	te.write("legRF1.val;")
	data=te.read_some()
	joi.legRF1=float(data.split("]")[1])
	te.write("legRF2.val;")
	data=te.read_some()
	joi.legRF2=float(data.split("]")[1])
	te.write("legRF3.val;")
	data=te.read_some()
	joi.legRF3=float(data.split("]")[1])
	te.write("legRH1.val;")
	data=te.read_some()
	joi.legRH1=float(data.split("]")[1])
	te.write("legRH2.val;")
	data=te.read_some()
	joi.legRH2=float(data.split("]")[1])
	te.write("legRH3.val;")
	data=te.read_some()
	joi.legRH3=float(data.split("]")[1])
	te.write("mouth.val;")
	data=te.read_some()
	joi.mouth=float(data.split("]")[1])
	te.write("neck.val;")
	data=te.read_some()
	joi.headNeck=float(data.split("]")[1])
	te.write("headPan.val;")
	data=te.read_some()
	joi.headPan=float(data.split("]")[1])
	te.write("headTilt.val;")
	data=te.read_some()
	joi.headTilt=float(data.split("]")[1])
	te.write("tailTilt.val;")
	data=te.read_some()
	joi.tailTilt=float(data.split("]")[1])
	te.write("tailPan.val;")
	data=te.read_some()
	joi.tailPan=float(data.split("]")[1])
	

te=telnetlib.Telnet("192.168.0.125",54000)
time.sleep(1)
data=1
while data:
	data=te.read_eager()
	print data
te.write("motors on;\r\n")
print "........................."
pub = rospy.Publisher('chatter', Joints)
rospy.init_node('talker', anonymous=True)
    r = rospy.Rate(10) # 10hz
    while not rospy.is_shutdown():
		getAllJoints()
        #rospy.loginfo(str)
        pub.publish(joi)
        r.sleep()



te.write("motors off;\r\n")
