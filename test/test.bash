#/bin/bash
"""
dir=~
[ "$1" != "" ] && dir="$1"

cd $dir/ros2_ws
colcon build
source $dir/ .bashrc
timeout 10 ros2 launch mypkg talk_listen.launch.py > /tmp/mypkg.log

cat /tmp/mypkg.log |
grep 'Listen: 1Listen: 10'
"""

set -e

source /opt/ros/humble/setup.bash
source ~/ros2_ws/install/setup.bash

echo "Start deg_to_rad node"
ros2 run mypkg degr2rad &
NODE_PID=$!

sleep 2

echo "Publish 30 deg"
ros2 topic pub --once /angle_deg std_msgs/msg/Float64 "{data: 30.0}"

echo "Subscribe result"
ros2 topic echo /angle_rad --once

kill $NODE_PID
