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

sleep 3

########################################
# 正常テスト
########################################
echo "===== Publish valid value ====="
ros2 topic pub --once /angle_deg std_msgs/msg/Float64 "{data: 30.0}"

sleep 3

echo "===== Check output ====="
OUTPUT=$(ros2 topic echo /angle_rad --once)

echo "$OUTPUT"

if echo "$OUTPUT" | grep -q "0.523"; then
  echo "TEST PASSED: normal input"
else
  echo "TEST FAILED: normal input"
  kill $NODE_PID || true
  exit 1
fi


########################################
# 異常入力テスト 1: 日本語「あ」
########################################
echo "===== Invalid input test 1 (Japanese あ) ====="
set +e   # ここだけコマンド失敗してもスクリプト停止しない
ros2 topic pub --once /angle_deg std_msgs/msg/Float64 "{data: あ}"
RESULT1=$?
set -e

if [ $RESULT1 -ne 0 ]; then
  echo "OK: ros2 topic pub failed as expected (あ)"
else
  echo "NG: unexpected success (あ)"
fi


########################################
# 異常入力テスト 2: 英字 a
########################################
echo "===== Invalid input test 2 (a) ====="
set +e
ros2 topic pub --once /angle_deg std_msgs/msg/Float64 "{data: a}"
RESULT2=$?
set -e

if [ $RESULT2 -ne 0 ]; then
  echo "OK: ros2 topic pub failed as expected (a)"
else
  echo "NG: unexpected success (a)"
fi


########################################
# 異常入力テスト 3: 空データ
########################################
echo "===== Invalid input test 3 (empty) ====="
set +e
ros2 topic pub --once /angle_deg std_msgs/msg/Float64 "{}"
RESULT3=$?
set -e

if [ $RESULT3 -ne 0 ]; then
  echo "OK: ros2 topic pub failed as expected (empty)"
else
  echo "NG: unexpected success (empty)"
fi


########################################
# 最後にノードがまだ動いているか確認
########################################
echo "===== Check node is still alive ====="
if ps -p $NODE_PID > /dev/null; then
  echo "NODE OK: still running"
  kill $NODE_PID || true
  echo "ALL TESTS COMPLETED SUCCESSFULLY"
  exit 0
else
  echo "NODE ERROR: node crashed"
  exit 1
fi
