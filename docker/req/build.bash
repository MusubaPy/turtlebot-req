#!/bin/bash

cd /turtlebot3_ws \
     && . /opt/ros/foxy/setup.sh \
     && colcon build --symlink-install
   
exec bash

