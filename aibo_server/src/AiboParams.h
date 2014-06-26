namespace aibo
{

    static const char* const BLENDING_MODE[]={
    	"cancel",
    	"discard",
    	"queue",
    	"add",
    	"mix",
    	"normal"
    };

    static const char* const MOTORS[] = {
    	"headTilt",
    	"headPan",
    	"neck",
    	"mouth",
    	"legLF1",
    	"legLF2",
    	"legLF3",
    	"legLH1",
    	"legLH2",
    	"legLH3",
    	"legRF1",
    	"legRF2",
    	"legRF3",
    	"legRH1",
    	"legRH2",
    	"legRH3",
    	"tailPan",
    	"tailTilt"	
    };
    static const char* const JOINT_MOTORS[] = {
    	"legLF1",
    	"legRF1",
    	"legLH1",
    	"legRH1",
    	"legLF2",
    	"legRF2",
    	"legLH2",
    	"legRH2",
    	"legLF3",
    	"legRF3",
    	"legLH3",	
    	"legRH3"	
    };

    static const int BROADBASE_ANGLE[] = {
        
        43,   // TILT
        0,    // PAN
        0,    // ROLL
        -3,   // MOUTH

        117,  // LFLEG J1
        89,   // LFLEG J2
        30,   // LFLEG J3
        
        -117, // LRLEG J1
        70,   // LRLEG J2
        30,   // LRLEG J3
        
        117,  // RFLEG J1
        89,   // RFLEG J2
        30,   // RFLEG J3

        -117, // RRLEG J1
        70,   // RRLEG J2
        30,   // RRLEG J3
        
        0,    // TAIL PAN
        0     // TAIL TILT
    };

    static const int SLEEPING_ANGLE[] = {
        -10,  // TILT
        0,    // PAN
        0,    // ROLL
        -3,   // MOUTH

        60,   // LFLEG J1
        0,    // LFLEG J2
        30,   // LFLEG J3
        
        -117, // LRLEG J1
        0,    // LRLEG J2
        147,  // LRLEG J3
        
        60,   // RFLEG J1
        0,    // RFLEG J2
        30,   // RFLEG J3

        -117, // RRLEG J1
        0,    // RRLEG J2
        147,  // RRLEG J3
        
        0,    // TAIL PAN
        0     // TAIL TILT
        
    };

    static const int CROUCHING_ANGLE[] = {
        -10,   // TILT
        0,     // PAN
        0,     // ROLL
        -3,    // MOUTH

        0,     // LFLEG J1
        0,     // LFLEG J2
        90,    // LFLEG J3
        
        -45,   // LRLEG J1
        0,     // LRLEG J2
        147,   // LRLEG J3
        
        0,     // RFLEG J1
        0,     // RFLEG J2
        90,    // RFLEG J3

        -45,   // RRLEG J1
        0,     // RRLEG J2
        147,   // RRLEG J3
        
        0,     // TAIL PAN
        0      // TAIL TILT
    };
    static const int STANDUP_ANGLE[] = {
        -10,   // TILT
        0,     // PAN
        0,     // ROLL
        -3,    // MOUTH

        0,     // LFLEG J1
        0,     // LFLEG J2
        30,    // LFLEG J3
        
        0,   // LRLEG J1
        0,     // LRLEG J2
        30,   // LRLEG J3
        
        0,     // RFLEG J1
        0,     // RFLEG J2
        30,    // RFLEG J3

        0,   // RRLEG J1
        0,     // RRLEG J2
        30,   // RRLEG J3
        
        0,     // TAIL PAN
        0      // TAIL TILT
    };
}