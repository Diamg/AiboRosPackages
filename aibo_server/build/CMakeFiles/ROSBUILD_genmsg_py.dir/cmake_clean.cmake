FILE(REMOVE_RECURSE
  "../src/aibo_server/msg"
  "../msg_gen"
  "../msg_gen"
  "CMakeFiles/ROSBUILD_genmsg_py"
  "../src/aibo_server/msg/__init__.py"
  "../src/aibo_server/msg/_Bumper.py"
  "../src/aibo_server/msg/_IRArray.py"
  "../src/aibo_server/msg/_Joints.py"
  "../src/aibo_server/msg/_Sound.py"
  "../src/aibo_server/msg/_Accel.py"
  "../src/aibo_server/msg/_TouchArray.py"
  "../src/aibo_server/msg/_BumperArray.py"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_genmsg_py.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
