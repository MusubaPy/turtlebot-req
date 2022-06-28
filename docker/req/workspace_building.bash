#!/bin/bash

EXEC_PATH=$PWD

mkdir -p ../turtlebot3_ws/src && cd ../turtlebot3_ws/src

git clone -b foxy-devel https://github.com/ROBOTIS-GIT/turtlebot3.git
git clone -b foxy-devel https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git
git clone -b foxy-devel https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git
git clone -b foxy-devel https://github.com/ROBOTIS-GIT/DynamixelSDK.git
git clone -b foxy-devel https://github.com/ROBOTIS-GIT/hls_lfcd_lds_driver.git

cd $EXEC_PATH

cp req/build.bash ../turtlebot3_ws/
echo "!!!DONE!!!"