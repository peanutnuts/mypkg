# テスト
![test](https://github.com/peanutnuts/mypkg/actions/workflows/test.yml/badge.svg)

# 説明
deg-rad.py ノードを提供します。 

角度deg を角度rad に変換して出力します。

# 入手方法

- $ git clone git@github.com/peanutnuts/mypkg.git  

と入力してください。

# degrad.py使用方法

- $ros2 run mypkg degrad

と入力してノードを起動してください。


入力トピックと形式

/angle_deg (std_msgs/Float64)
- Publisher: 任意のノード
- QoS: default (depth=10, reliability=RELIABLE, durability=VOLATILE)
- Unit: degrees

出力トピックと形式

/angle_rad (std_msgs/Float64)
- Publisher: mypkg/degrad
- QoS: depth=10, reliability=RELIABLE, durability=TRANSIENT_LOCAL
- Unit: radians

# talk_degrad_listen.launch.py使用方法
実際に動いているかの確認用に，launchファイル,talk_degrad_listen.launch.pyを用意しています。

- $ ros2 launch mypkg talk_degrad_listen.launch.py

と入力してlaunchファイルを起動してください。

実際に正しく動作した際のログの例

- $ ros2 launch mypkg talk_degrad_listen.launch.py
- [INFO] [launch]: All log files can be found below /home/ibuki/.ros/log/2026-01-07-03-11-28-485025-haga-ibuki-151574
- [INFO] [launch]: Default logging verbosity is set to INFO
- [INFO] [talker-1]: process started with pid [151576]
- [INFO] [degrad-2]: process started with pid [151578]
- [INFO] [listener-3]: process started with pid [151580]
- [INFO] [1767723089.260424853] [deg_to_rad_node]: 0.000 deg  ->  0.00000 rad
- [degrad-2] [INFO] [1767723089.268183271] [deg_to_rad_node]: 0.000 deg  ->  0.00000 rad
- [listener-3] [INFO] [1767723089.268641235] [listener]: Listen: 0.000000:
- [listener-3] [INFO] [1767723089.269891128] [listener]: Listen: 0.000000:
- [listener-3] [INFO] [1767723089.270832851] [listener]: Listen: 0.000000:
- [INFO] [1767723089.747852682] [deg_to_rad_node]: 1.000 deg  ->  0.01745 rad
- [degrad-2] [INFO] [1767723089.747673396] [deg_to_rad_node]: 1.000 deg  ->  0.01745 rad
- [listener-3] [INFO] [1767723089.748739303] [listener]: Listen: 0.017453:
- [listener-3] [INFO] [1767723089.749888205] [listener]: Listen: 0.017453:
- [listener-3] [INFO] [1767723089.750972353] [listener]: Listen: 0.017453:
- [INFO] [1767723090.250884701] [deg_to_rad_node]: 2.000 deg  ->  0.03491 rad
- [degrad-2] [INFO] [1767723090.251686237] [deg_to_rad_node]: 2.000 deg  ->  0.03491 rad
- [listener-3] [INFO] [1767723090.251775331] [listener]: Listen: 0.034907:
- [listener-3] [INFO] [1767723090.253045906] [listener]: Listen: 0.034907:
- [listener-3] [INFO] [1767723090.253909394] [listener]: Listen: 0.034907:
- [INFO] [1767723090.747565874] [deg_to_rad_node]: 3.000 deg  ->  0.05236 rad
- [degrad-2] [INFO] [1767723090.746971961] [deg_to_rad_node]: 3.000 deg  ->  0.05236 rad
- [listener-3] [INFO] [1767723090.747799224] [listener]: Listen: 0.052360:
- [listener-3] [INFO] [1767723090.749049135] [listener]: Listen: 0.052360:
- [listener-3] [INFO] [1767723090.749947720] [listener]: Listen: 0.052360:
- [INFO] [1767723091.247723226] [deg_to_rad_node]: 4.000 deg  ->  0.06981 rad
- [degrad-2] [INFO] [1767723091.247669075] [deg_to_rad_node]: 4.000 deg  ->  0.06981 rad
- [listener-3] [INFO] [1767723091.248050291] [listener]: Listen: 0.069813:
- [listener-3] [INFO] [1767723091.248825842] [listener]: Listen: 0.069813:
- [listener-3] [INFO] [1767723091.249591890] [listener]: Listen: 0.069813:
- [INFO] [1767723091.750967171] [deg_to_rad_node]: 5.000 deg  ->  0.08727 rad
- [degrad-2] [INFO] [1767723091.749878105] [deg_to_rad_node]: 5.000 deg  ->  0.08727 rad
- [listener-3] [INFO] [1767723091.750770500] [listener]: Listen: 0.087266:
- [listener-3] [INFO] [1767723091.752028331] [listener]: Listen: 0.087266:
- [listener-3] [INFO] [1767723091.752987564] [listener]: Listen: 0.087266:
- [INFO] [1767723094.827903492] [deg_to_rad_node]: 6.000 deg  ->  0.10472 rad
- [degrad-2] [INFO] [1767723094.827860871] [deg_to_rad_node]: 6.000 deg  ->  0.10472 rad
- [listener-3] [INFO] [1767723094.828440178] [listener]: Listen: 0.104720:
- [listener-3] [INFO] [1767723094.829372583] [listener]: Listen: 0.104720:
- [listener-3] [INFO] [1767723094.830093386] [listener]: Listen: 0.104720:
- [INFO] [1767723095.250653776] [deg_to_rad_node]: 7.000 deg  ->  0.12217 rad
- [degrad-2] [INFO] [1767723095.250235476] [deg_to_rad_node]: 7.000 deg  ->  0.12217 rad
- [listener-3] [INFO] [1767723095.251037769] [listener]: Listen: 0.122173:
- [listener-3] [INFO] [1767723095.252228044] [listener]: Listen: 0.122173:
- [listener-3] [INFO] [1767723095.253191360] [listener]: Listen: 0.122173:
- [INFO] [1767723095.747382939] [deg_to_rad_node]: 8.000 deg  ->  0.13963 rad
- [degrad-2] [INFO] [1767723095.747275547] [deg_to_rad_node]: 8.000 deg  ->  0.13963 rad
- [listener-3] [INFO] [1767723095.747918408] [listener]: Listen: 0.139626:
- [listener-3] [INFO] [1767723095.749270156] [listener]: Listen: 0.139626:
- [listener-3] [INFO] [1767723095.750173138] [listener]: Listen: 0.139626:
- [INFO] [listener-3]: sending signal 'SIGINT' to process[listener-3]
- [INFO] [degrad-2]: sending signal 'SIGINT' to process[degrad-2]
- [INFO] [talker-1]: sending signal 'SIGINT' to process[talker-1]
- [listener-3] Traceback (most recent call last):
- [listener-3]   File "/home/ibuki/ros2_ws/install/mypkg/lib/mypkg/listener", line 33, in <module>
- [listener-3]     sys.exit(load_entry_point('mypkg==0.0.0', 'console_scripts', 'listener')())
- [listener-3]   File "/home/ibuki/ros2_ws/install/mypkg/lib/python3.10/site-packages/mypkg/listener.py", line 18, in main
- [listener-3]     rclpy.spin(node)
- [listener-3]   File "/opt/ros/humble/local/lib/python3.10/dist-packages/rclpy/__init__.py", line 229, in spin
- [listener-3]     executor.spin_once()
- [listener-3]   File "/opt/ros/humble/local/lib/python3.10/dist-packages/rclpy/executors.py", line 751, in spin_once
- [listener-3]     self._spin_once_impl(timeout_sec)
- [listener-3]   File "/opt/ros/humble/local/lib/python3.10/dist-packages/rclpy/executors.py", line 740, in _spin_once_impl
- [listener-3]     handler, entity, node = self.wait_for_ready_callbacks(timeout_sec=timeout_sec)
- [listener-3]   File "/opt/ros/humble/local/lib/python3.10/dist-packages/rclpy/executors.py", line 723, in wait_for_ready_callbacks
- [listener-3]     return next(self._cb_iter)
- [listener-3]   File "/opt/ros/humble/local/lib/python3.10/dist-packages/rclpy/executors.py", line 620, in _wait_for_ready_callbacks
- [listener-3]     wait_set.wait(timeout_nsec)
- [listener-3] KeyboardInterrupt
- [degrad-2] Traceback (most recent call last):
- [degrad-2]   File "/home/ibuki/ros2_ws/install/mypkg/lib/mypkg/degrad", line 33, in <module>
- [degrad-2]     sys.exit(load_entry_point('mypkg==0.0.0', 'console_scripts', 'degrad')())
- [degrad-2]   File "/home/ibuki/ros2_ws/install/mypkg/lib/python3.10/site-packages/mypkg/degrad.py", line 38, in main
- [degrad-2]     rclpy.spin(node)
- [degrad-2]   File "/opt/ros/humble/local/lib/python3.10/dist-packages/rclpy/__init__.py", line 229, in spin
- [degrad-2]     executor.spin_once()
- [degrad-2]   File "/opt/ros/humble/local/lib/python3.10/dist-packages/rclpy/executors.py", line 751, in spin_once
- [degrad-2]     self._spin_once_impl(timeout_sec)
- [degrad-2]   File "/opt/ros/humble/local/lib/python3.10/dist-packages/rclpy/executors.py", line 740, in _spin_once_impl
- [degrad-2]     handler, entity, node = self.wait_for_ready_callbacks(timeout_sec=timeout_sec)
- [degrad-2]   File "/opt/ros/humble/local/lib/python3.10/dist-packages/rclpy/executors.py", line 723, in wait_for_ready_callbacks
- [degrad-2]     return next(self._cb_iter)
- [degrad-2]   File "/opt/ros/humble/local/lib/python3.10/dist-packages/rclpy/executors.py", line 620, in _wait_for_ready_callbacks
- [degrad-2]     wait_set.wait(timeout_nsec)
- [degrad-2] KeyboardInterrupt
- [talker-1] Traceback (most recent call last):
- [talker-1]   File "/home/ibuki/ros2_ws/install/mypkg/lib/mypkg/talker", line 33, in <module>
- [talker-1]     sys.exit(load_entry_point('mypkg==0.0.0', 'console_scripts', 'talker')())
- [talker-1]   File "/home/ibuki/ros2_ws/install/mypkg/lib/python3.10/site-packages/mypkg/talker.py", line 25, in main
- [talker-1]     rclpy.spin(node)
- [talker-1]   File "/opt/ros/humble/local/lib/python3.10/dist-packages/rclpy/__init__.py", line 229, in spin
- [talker-1]     executor.spin_once()
- [talker-1]   File "/opt/ros/humble/local/lib/python3.10/dist-packages/rclpy/executors.py", line 751, in spin_once
- [talker-1]     self._spin_once_impl(timeout_sec)
- [talker-1]   File "/opt/ros/humble/local/lib/python3.10/dist-packages/rclpy/executors.py", line 740, in _spin_once_impl
- [talker-1]     handler, entity, node = self.wait_for_ready_callbacks(timeout_sec=timeout_sec)
- [talker-1]   File "/opt/ros/humble/local/lib/python3.10/dist-packages/rclpy/executors.py", line 723, in wait_for_ready_callbacks
- [talker-1]     return next(self._cb_iter)
- [talker-1]   File "/opt/ros/humble/local/lib/python3.10/dist-packages/rclpy/executors.py", line 620, in _wait_for_ready_callbacks
- [talker-1]     wait_set.wait(timeout_nsec)
- [talker-1] KeyboardInterrupt
- [ERROR] [listener-3]: process has died [pid 151580, exit code -2, cmd '/home/ibuki/ros2_ws/install/mypkg/lib/mypkg/listener --ros-args'].
- [ERROR] [degrad-2]: process has died [pid 151578, exit code -2, cmd '/home/ibuki/ros2_ws/install/mypkg/lib/mypkg/degrad --ros-args'].
- [ERROR] [talker-1]: process has died [pid 151576, exit code -2, cmd '/home/ibuki/ros2_ws/install/mypkg/lib/mypkg/talker --ros-args'].

# 動作確認環境
- Ubuntu 22.04.5 LTS 
- Python 3.13.5  
- git version 2.34.1

# 権利関係
このソフトウェアパッケージは，3条項BSDライセンスの下，再頒布および使用が許可されます。 © 2025 Ibuki Haga
