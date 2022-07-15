# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "snake_demo: 3 messages, 0 services")

set(MSG_I_FLAGS "-Isnake_demo:/home/user2021/LandSnake/snake_ws_git/src/snake_demo/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(snake_demo_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/user2021/LandSnake/snake_ws_git/src/snake_demo/msg/cmd_angles.msg" NAME_WE)
add_custom_target(_snake_demo_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "snake_demo" "/home/user2021/LandSnake/snake_ws_git/src/snake_demo/msg/cmd_angles.msg" ""
)

get_filename_component(_filename "/home/user2021/LandSnake/snake_ws_git/src/snake_demo/msg/feedback_angles.msg" NAME_WE)
add_custom_target(_snake_demo_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "snake_demo" "/home/user2021/LandSnake/snake_ws_git/src/snake_demo/msg/feedback_angles.msg" ""
)

get_filename_component(_filename "/home/user2021/LandSnake/snake_ws_git/src/snake_demo/msg/calculations.msg" NAME_WE)
add_custom_target(_snake_demo_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "snake_demo" "/home/user2021/LandSnake/snake_ws_git/src/snake_demo/msg/calculations.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(snake_demo
  "/home/user2021/LandSnake/snake_ws_git/src/snake_demo/msg/cmd_angles.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/snake_demo
)
_generate_msg_cpp(snake_demo
  "/home/user2021/LandSnake/snake_ws_git/src/snake_demo/msg/feedback_angles.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/snake_demo
)
_generate_msg_cpp(snake_demo
  "/home/user2021/LandSnake/snake_ws_git/src/snake_demo/msg/calculations.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/snake_demo
)

### Generating Services

### Generating Module File
_generate_module_cpp(snake_demo
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/snake_demo
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(snake_demo_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(snake_demo_generate_messages snake_demo_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/user2021/LandSnake/snake_ws_git/src/snake_demo/msg/cmd_angles.msg" NAME_WE)
add_dependencies(snake_demo_generate_messages_cpp _snake_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user2021/LandSnake/snake_ws_git/src/snake_demo/msg/feedback_angles.msg" NAME_WE)
add_dependencies(snake_demo_generate_messages_cpp _snake_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user2021/LandSnake/snake_ws_git/src/snake_demo/msg/calculations.msg" NAME_WE)
add_dependencies(snake_demo_generate_messages_cpp _snake_demo_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(snake_demo_gencpp)
add_dependencies(snake_demo_gencpp snake_demo_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS snake_demo_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(snake_demo
  "/home/user2021/LandSnake/snake_ws_git/src/snake_demo/msg/cmd_angles.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/snake_demo
)
_generate_msg_eus(snake_demo
  "/home/user2021/LandSnake/snake_ws_git/src/snake_demo/msg/feedback_angles.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/snake_demo
)
_generate_msg_eus(snake_demo
  "/home/user2021/LandSnake/snake_ws_git/src/snake_demo/msg/calculations.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/snake_demo
)

### Generating Services

### Generating Module File
_generate_module_eus(snake_demo
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/snake_demo
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(snake_demo_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(snake_demo_generate_messages snake_demo_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/user2021/LandSnake/snake_ws_git/src/snake_demo/msg/cmd_angles.msg" NAME_WE)
add_dependencies(snake_demo_generate_messages_eus _snake_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user2021/LandSnake/snake_ws_git/src/snake_demo/msg/feedback_angles.msg" NAME_WE)
add_dependencies(snake_demo_generate_messages_eus _snake_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user2021/LandSnake/snake_ws_git/src/snake_demo/msg/calculations.msg" NAME_WE)
add_dependencies(snake_demo_generate_messages_eus _snake_demo_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(snake_demo_geneus)
add_dependencies(snake_demo_geneus snake_demo_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS snake_demo_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(snake_demo
  "/home/user2021/LandSnake/snake_ws_git/src/snake_demo/msg/cmd_angles.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/snake_demo
)
_generate_msg_lisp(snake_demo
  "/home/user2021/LandSnake/snake_ws_git/src/snake_demo/msg/feedback_angles.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/snake_demo
)
_generate_msg_lisp(snake_demo
  "/home/user2021/LandSnake/snake_ws_git/src/snake_demo/msg/calculations.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/snake_demo
)

### Generating Services

### Generating Module File
_generate_module_lisp(snake_demo
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/snake_demo
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(snake_demo_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(snake_demo_generate_messages snake_demo_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/user2021/LandSnake/snake_ws_git/src/snake_demo/msg/cmd_angles.msg" NAME_WE)
add_dependencies(snake_demo_generate_messages_lisp _snake_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user2021/LandSnake/snake_ws_git/src/snake_demo/msg/feedback_angles.msg" NAME_WE)
add_dependencies(snake_demo_generate_messages_lisp _snake_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user2021/LandSnake/snake_ws_git/src/snake_demo/msg/calculations.msg" NAME_WE)
add_dependencies(snake_demo_generate_messages_lisp _snake_demo_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(snake_demo_genlisp)
add_dependencies(snake_demo_genlisp snake_demo_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS snake_demo_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(snake_demo
  "/home/user2021/LandSnake/snake_ws_git/src/snake_demo/msg/cmd_angles.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/snake_demo
)
_generate_msg_nodejs(snake_demo
  "/home/user2021/LandSnake/snake_ws_git/src/snake_demo/msg/feedback_angles.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/snake_demo
)
_generate_msg_nodejs(snake_demo
  "/home/user2021/LandSnake/snake_ws_git/src/snake_demo/msg/calculations.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/snake_demo
)

### Generating Services

### Generating Module File
_generate_module_nodejs(snake_demo
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/snake_demo
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(snake_demo_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(snake_demo_generate_messages snake_demo_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/user2021/LandSnake/snake_ws_git/src/snake_demo/msg/cmd_angles.msg" NAME_WE)
add_dependencies(snake_demo_generate_messages_nodejs _snake_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user2021/LandSnake/snake_ws_git/src/snake_demo/msg/feedback_angles.msg" NAME_WE)
add_dependencies(snake_demo_generate_messages_nodejs _snake_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user2021/LandSnake/snake_ws_git/src/snake_demo/msg/calculations.msg" NAME_WE)
add_dependencies(snake_demo_generate_messages_nodejs _snake_demo_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(snake_demo_gennodejs)
add_dependencies(snake_demo_gennodejs snake_demo_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS snake_demo_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(snake_demo
  "/home/user2021/LandSnake/snake_ws_git/src/snake_demo/msg/cmd_angles.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/snake_demo
)
_generate_msg_py(snake_demo
  "/home/user2021/LandSnake/snake_ws_git/src/snake_demo/msg/feedback_angles.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/snake_demo
)
_generate_msg_py(snake_demo
  "/home/user2021/LandSnake/snake_ws_git/src/snake_demo/msg/calculations.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/snake_demo
)

### Generating Services

### Generating Module File
_generate_module_py(snake_demo
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/snake_demo
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(snake_demo_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(snake_demo_generate_messages snake_demo_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/user2021/LandSnake/snake_ws_git/src/snake_demo/msg/cmd_angles.msg" NAME_WE)
add_dependencies(snake_demo_generate_messages_py _snake_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user2021/LandSnake/snake_ws_git/src/snake_demo/msg/feedback_angles.msg" NAME_WE)
add_dependencies(snake_demo_generate_messages_py _snake_demo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user2021/LandSnake/snake_ws_git/src/snake_demo/msg/calculations.msg" NAME_WE)
add_dependencies(snake_demo_generate_messages_py _snake_demo_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(snake_demo_genpy)
add_dependencies(snake_demo_genpy snake_demo_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS snake_demo_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/snake_demo)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/snake_demo
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(snake_demo_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/snake_demo)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/snake_demo
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(snake_demo_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/snake_demo)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/snake_demo
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(snake_demo_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/snake_demo)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/snake_demo
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(snake_demo_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/snake_demo)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/snake_demo\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/snake_demo
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(snake_demo_generate_messages_py std_msgs_generate_messages_py)
endif()
