FILE(REMOVE_RECURSE
  "../src/aibo_server/msg"
  "../msg_gen"
  "../msg_gen"
  "CMakeFiles/ROSBUILD_genmsg_cpp"
  "../msg_gen/cpp/include/aibo_server/Bumper.h"
  "../msg_gen/cpp/include/aibo_server/IRArray.h"
  "../msg_gen/cpp/include/aibo_server/Joints.h"
  "../msg_gen/cpp/include/aibo_server/Sound.h"
  "../msg_gen/cpp/include/aibo_server/Accel.h"
  "../msg_gen/cpp/include/aibo_server/TouchArray.h"
  "../msg_gen/cpp/include/aibo_server/BumperArray.h"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_genmsg_cpp.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
