ARG from

FROM ${from}

ENV DEBIAN_FRONTEND = noninteractive

# Timezone Configuration

ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && apt-get install -y tzdata

RUN apt-get update && apt-get install -y apt-utils \
                                         lsb-release \
                                         mesa-utils \
                                         gnupg2 \
                                         net-tools \
                                         build-essential \
                                         wget \
                                         unzip \
                                         curl \
                                         git \
                                         mc \
                                         vim \
                                         gedit 


# Install ROS desktop and Gazebo

RUN apt update && apt install locales
RUN locale-gen en_US en_US.UTF-8
RUN update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
RUN export LANG=en_US.UTF-8


RUN apt install software-properties-common -y
RUN add-apt-repository universe -y



RUN apt update && apt install curl gnupg2 lsb-release
RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key  -o /usr/share/keyrings/ros-archive-keyring.gpg

RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null

RUN apt update
RUN apt upgrade -y

RUN apt install -y ros-foxy-desktop \
                    ros-foxy-gazebo-* \
                    ros-foxy-cartographer \
                    ros-foxy-cartographer-ros \
                    ros-foxy-navigation2 \
                    ros-foxy-nav2-bringup \ 
                    ros-foxy-dynamixel-sdk \
                    ros-foxy-turtlebot3-msgs \
                    ros-foxy-turtlebot3 \
                    python3-colcon-common-extensions \
                    python3-vcstool

RUN echo 'export ROS_DOMAIN_ID=30 #TURTLEBOT3' >> ~/.bashrc                    
RUN echo "source /opt/ros/foxy/setup.bash"  >> ~/.bashrc
ENV source /opt/ros/foxy/setup.bash
#RUN mkdir -p "/turtlebot3_ws/src"


#RUN cd /turtlebot3_ws && wget https://raw.githubusercontent.com/ROBOTIS-GIT/turtlebot3/foxy-devel/turtlebot3.repos && vcs import src < turtlebot3.repos

#RUN cd /turtlebot3_ws \
#        && . /opt/ros/foxy/setup.sh \
#        && colcon build --symlink-install 

RUN echo 'source ~/../turtlebot3_ws/install/setup.bash' >> ~/.bashrc \
    && echo 'source ~/../turtlebot3_ws/install/setup.bash' >> ~/.bashrc \
    && echo 'export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:~/../turtlebot3_ws/src/turtlebot3/turtlebot3_simulations/turtlebot3_gazebo/models' >> ~/.bashrc \
    && echo 'export TURTLEBOT3_MODEL=burger' >> ~/.bashrc


#RUN cd /turtlebot3_ws && colcon build --symlink-install
#RUN git clone -b foxy-devel https://github.com/ROBOTIS-GIT/turtlebot3.git /workspace/src/turtlebot3/
#RUN git clone -b foxy-devel https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git /workspace/src/turtlebot3_simulations
