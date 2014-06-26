#include <string>
#include <ros/ros.h>
#include <sensor_msgs/JointState.h>
#include <tf/transform_broadcaster.h>
#include <aibo_server/Joints.h>

const double degree = M_PI/180;
double legRF1=0, legRF2=0,legRF3=0,legLF1=0, legLF2=0,legLF3=0,legRB1=0,legRB2=0,legRB3=0,legLB1=0,legLB2=0,legLB3=0, neck=0, hPan=0, hTilt=0,tTilt=0,tPan=0;;

void callback(const aibo_server::Joints::ConstPtr& msg) {
legRF1=(msg->jointRF1)*degree;
legRF2=(msg->jointRF2)*degree;
legRF3=(msg->jointRF3)*degree;
legLF1=(msg->jointLF1)*degree;
legLF2=(msg->jointLF2)*degree;
legLF3=(msg->jointLF3)*degree;
legRB1=(msg->jointRH1)*degree;
legRB2=(msg->jointRH2)*degree;
legRB3=(msg->jointRH3)*degree;
legLB1=(msg->jointLH1)*degree;
legLB2=(msg->jointLH2)*degree;
legLB3=(msg->jointLH3)*degree;
neck=(msg->headNeck)*degree;
hPan=(msg->headPan)*degree;
hTilt=(msg->headTilt)*degree;
tTilt=(msg->tailTilt)*degree;
tPan=(msg->tailPan)*degree;
}

int main(int argc, char** argv) {
    ros::init(argc, argv, "state_publisher");
    ros::NodeHandle n;
    ros::Subscriber joint_sub = n.subscribe<aibo_server::Joints>("/aibo_server/aibo/joints", 1, callback);
    ros::Publisher joint_pub = n.advertise<sensor_msgs::JointState>("joint_states", 1);
    tf::TransformBroadcaster broadcaster;
    ros::Rate loop_rate(30);

    

   
    // message declarations
    geometry_msgs::TransformStamped odom_trans;
    sensor_msgs::JointState joint_state;
    odom_trans.header.frame_id = "odom";
    odom_trans.child_frame_id = "base_link";

    while (ros::ok()) {
        //update joint_state
        joint_state.header.stamp = ros::Time::now();
        joint_state.name.resize(17);
        joint_state.position.resize(17);
		joint_state.name[0] ="legRF1";
		joint_state.position[0] = legRF1;
		joint_state.name[1] ="legRF2";
		joint_state.position[1] = legRF2;
		joint_state.name[2] ="legRF3";
		joint_state.position[2] = legRF3;
		joint_state.name[3] ="legLF1";
		joint_state.position[3] = legLF1;
		joint_state.name[4] ="legLF2";
		joint_state.position[4] = legLF2;
		joint_state.name[5] ="legLF3";
		joint_state.position[5] = legLF3;
		joint_state.name[6] ="legRB1";
		joint_state.position[6] = legRB1;
		joint_state.name[7] ="legRB2";
		joint_state.position[7] = legRB2;
		joint_state.name[8] ="legRB3";
		joint_state.position[8] = legRB3;
		joint_state.name[9] ="legLB1";
		joint_state.position[9] = legLB1;
		joint_state.name[10] ="legLB2";
		joint_state.position[10] = legLB2;
		joint_state.name[11] ="legLB3";
		joint_state.position[11] = legLB3;
		joint_state.name[12] ="neck";
		joint_state.position[12] = neck;
		joint_state.name[13] ="headPan";
		joint_state.position[13] = hPan;
		joint_state.name[14] ="headTilt";
		joint_state.position[14] = hTilt;
		joint_state.name[15] ="tailTilt";
		joint_state.position[15] = tTilt;
		joint_state.name[16] ="tailPan";
		joint_state.position[16] = tPan;
       
        // update transform
        
        odom_trans.header.stamp = ros::Time::now();
        
        odom_trans.transform.rotation = tf::createQuaternionMsgFromYaw(0.0);

        //send the joint state and transform
        joint_pub.publish(joint_state);
        broadcaster.sendTransform(odom_trans);

        // This will adjust as needed per iteration
		ros::spinOnce();
        loop_rate.sleep();
    }


    return 0;
}
