#!/bin/bash
set -e  # 途中でエラーが出たら停止

dir=~
[ "$1" != "" ] && dir="$1"   # 引数があればホームに変更

cd $dir/ros2_ws

# ROS2 のセットアップ（GitHub Actions では絶対必要）
source /opt/ros/humble/setup.bash

# パッケージのビルド
colcon build

# ビルド結果のセットアップ
source install/setup.bash

# launch をバックグラウンドで起動してログを取る
ros2 launch mypkg talk_listen.launch.py > /tmp/mypkg.log 2>&1 &
LAUNCH_PID=$!

# 10秒だけ動かす
sleep 10

# launch を終了
kill $LAUNCH_PID 2>/dev/null || true

# ログ表示（デバッグ用）
echo "=== /tmp/mypkg.log ==="
cat /tmp/mypkg.log || true
echo "======================"

# Listen: 10 が含まれるかチェック
if grep -q "Listen: 10" /tmp/mypkg.log; then
    echo "OK: Listen: 10 が見つかりました"
else
    echo "ERROR: Listen: 10 がログに見つかりません"
    exit 1
fi
