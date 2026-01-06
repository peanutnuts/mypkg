#!/bin/bash
set -e

echo "===== Source ROS2 ====="
source /opt/ros/humble/setup.bash

echo "===== Build Workspace ====="
cd /root/ros2_ws
colcon build --packages-select mypkg

echo "===== Source workspace ====="
source install/setup.bash

echo "===== Run deg→rad node ====="
ros2 run mypkg degrad &
NODE_PID=$!

sleep 2

echo "===== Publish test value ====="
ros2 topic pub --once /angle_deg std_msgs/msg/Float64 "{data: 30.0}"

sleep 2

echo "===== Check output ====="
OUTPUT=$(timeout 5 ros2 topic echo /angle_rad --once)

echo "OUTPUT:"
echo "$OUTPUT"

kill $NODE_PID || true

if echo "$OUTPUT" | grep -q "0.523"; then
  echo "TEST PASSED"
  exit 0
else
  echo "TEST FAILED"
  exit 1
fi
