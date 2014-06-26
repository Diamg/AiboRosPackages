/*
*  AiboNode.cpp
*  Copyright (c) 2013 Ricardo Tellez
*  Created on: 04-December-2013
*  Author: Ricardo Tellez
*  email: r_tellez@ouroboros.org
*
*/

#include <ros/ros.h>
#include <urbi/uclient.hh>
#include "AiboParams.h"
#include <aibo_server/Joints.h>
#include <std_msgs/String.h>
namespace aibo
{

    class AiboServer
    {
	friend void* send_proxy(void*);
	friend void* send_proxy2(void*);
	friend void* send_proxy3(void*);
	friend void* send_proxy4(void*);
      public:
      
        AiboServer(const char* IP);
        virtual ~AiboServer();
         
        urbi::UClient* _clientS;
        urbi::UClient* _clientS2;
        urbi::UClient* _clientS3;
        urbi::UClient* _clientS4;
        urbi::UClient* _clientR;
        
        urbi::UCallbackAction onCall(const urbi::UMessage &msg);
        urbi::UCallbackAction onCall1(const urbi::UMessage &msg);
        urbi::UCallbackAction onSoundSensor(const urbi::UMessage &msg);
        urbi::UCallbackAction onImageSensor(const urbi::UMessage &msg);
       	void setOnJoint(const aibo_server::Joints::ConstPtr& msg) ;

        void publishState();
		ros::NodeHandle _nh;
		ros::Subscriber sub;
		std::string _nName;
      private:
			
          // Paws
          bool _pawLF, _pawLH, _pawRF, _pawRH;
		  
		  int t;
          // Joints
          double _jointLF1,_jointLF2,_jointLF3;
          double _jointLH1,_jointLH2,_jointLH3;
          double _jointRF1,_jointRF2,_jointRF3;
          double _jointRH1,_jointRH2,_jointRH3;
          double _tailPan, _tailTilt;
          double _headTilt, _headPan, _headNeck, _mouth;
          double _subLF1,_subLF2,_subLF3;
          double _subLH1,_subLH2,_subLH3;
          double _subRF1,_subRF2,_subRF3;
          double _subRH1,_subRH2,_subRH3;
          double _subtPan, _tTilt;
          double _subhTilt, _subhPan, _subhNeck, _subMouth;
          
          // Image
          urbi::UImage _image;

          // Sound
          urbi::USound _sound;

          // Accel
          double _accelX, _accelY, _accelZ;

          // Touch
          double _touch1, _touch2, _touch3, _touch4, _touch5;

          //IRs
          double _IRChest, _IRNear, _IRFar;

		
         // ros::NodeHandle _nh;
          
          
          ros::Publisher _aiboIR;
          ros::Publisher _aiboSound;
          ros::Publisher _aiboImage;
          ros::Publisher _aiboJoint;
          ros::Publisher _aiboAccel;
          ros::Publisher _aiboPaw;
          ros::Publisher _aiboTouch;
          ros::Publisher _aiboSubJoint;
         // 
          void setBlendingmode(urbi::UClient* client);
          void startPosition();

          void publishIRsMsg();
          void publishTouchMsg();
          void publishSoundMsg();
          void publishJointMsg();
          void publishImageMsg();
          void publishPawMsg();
          void publishAccelMsg();
          
          bool compara(double jointN, double jointA);
          
          void sendComand();
          void sendComand2();
          void sendComand3();
          void sendComand4();
          char cmd[1000];
          int enviado;
          int anterior;
          int C1activo;
          int C2activo;
          int reiniciando1;
          int reiniciando2;
          const char* IP2;
          
    };
}
