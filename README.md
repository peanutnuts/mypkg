# degrad
![test](https://github.com/peanutnuts/mypkg/actions/workflows/test.yml/badge.svg)

## ノード説明
deg-rad ノードを提供します。 

角度(deg)を角度(rad)に変換して出力します。

---
## ノード使用方法
リポジトリの入手を行います。  
ROS2 のワークスペースの`src`ディレクトリにて以下を入力してください。

**bash**
```bash
$ git clone git@github.com:peanutnuts/mypkg.git
```

ビルドを実行した後に，  
ノードを実行します。以下を入力してください。

**bash**
```bash
$ ros2 run mypkg degrad
```

入力トピックと形式は以下の通りです。

`/angle_deg` (std_msgs/Float64)
- Publisher: 任意のノード
- Unit: degrees

出力トピックと形式は以下の通りです。

`/angle_rad` (std_msgs/Float64)
- Publisher: mypkg/degrad
- Unit: radians

## talk_degrad_listen.launch.py使用方法
実際に動いているかの確認用に，launchファイル,`talk_degrad_listen.launch.py`を用意しています。  
実行するには以下を入力してください。

**bash**
```bash
$ ros2 launch mypkg talk_degrad_listen.launch.py
```

以下は，正しく動作した際のログの一部です。

**bash**
```bash
[INFO] [1767723089.260424853] [deg_to_rad_node]: 0.000 deg -> 0.00000 rad
[degrad-2] [INFO] [1767723089.268183271] [deg_to_rad_node]: 0.000 deg -> 0.00000 rad
[listener-3] [INFO] [1767723089.268641235] [listener]: Listen: 0.000000:
[listener-3] [INFO] [1767723089.269891128] [listener]: Listen: 0.000000:
[listener-3] [INFO] [1767723089.270832851] [listener]: Listen: 0.000000:
[INFO] [1767723089.747852682] [deg_to_rad_node]: 1.000 deg -> 0.01745 rad
[degrad-2] [INFO] [1767723089.747673396] [deg_to_rad_node]: 1.000 deg -> 0.01745 rad
[listener-3] [INFO] [1767723089.748739303] [listener]: Listen: 0.017453:
[listener-3] [INFO] [1767723089.749888205] [listener]: Listen: 0.017453:
[listener-3] [INFO] [1767723089.750972353] [listener]: Listen: 0.017453:
[INFO] [1767723090.250884701] [deg_to_rad_node]: 2.000 deg -> 0.03491 rad
[degrad-2] [INFO] [1767723090.251686237] [deg_to_rad_node]: 2.000 deg -> 0.03491 rad
[listener-3] [INFO] [1767723090.251775331] [listener]: Listen: 0.034907:
[listener-3] [INFO] [1767723090.253045906] [listener]: Listen: 0.034907:
[listener-3] [INFO] [1767723090.253909394] [listener]: Listen: 0.034907:
```

このログの全文は`log_launch_success.txt`にて保存しています。

---
## 動作確認環境

- Ubuntu 22.04.5 LTS 
- Python 3.13.5  

## 権利関係
このソフトウェアパッケージは，3条項BSDライセンスの下，再頒布および使用が許可されます。  
© 2025 Ibuki Haga
