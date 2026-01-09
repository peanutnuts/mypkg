# degrad
![test](https://github.com/peanutnuts/mypkg/actions/workflows/test.yml/badge.svg)

## ノード説明
deg-rad ノードを提供します。 

角度(deg)を角度(rad)に変換して出力します。

---
## ノード使用方法
リポジトリを入手します。

**bash**
```bash
$ git clone git@github.com:peanutnuts/mypkg.git
```

ノードを起動します。

**bash**
```bash
$ ros2 run mypkg degrad
```

入力トピックと形式は以下の通りです。

`/angle_deg` (std_msgs/Float64)
- Publisher: 任意のノード
- QoS: depth=10, reliability=RELIABLE, durability=VOLATILE
- Unit: degrees

出力トピックと形式は以下の通りです。

`/angle_rad` (std_msgs/Float64)
- Publisher: mypkg/degrad
- QoS: depth=10, reliability=RELIABLE, durability=TRANSIENT_LOCAL
- Unit: radians

## talk_degrad_listen.launch.py使用方法

実際に動いているかの確認用に，launchファイル,`talk_degrad_listen.launch.py`を用意しています。

**bash**
```bash
$ ros2 launch mypkg talk_degrad_listen.launch.py
```

と入力してlaunchファイルを起動してください。

実際に正しく動作した際のログの例は`log_launch_success.txt`にて保存しています。

---
## 動作確認環境

- Ubuntu 22.04.5 LTS 
- Python 3.13.5  

## 権利関係
このソフトウェアパッケージは，3条項BSDライセンスの下，再頒布および使用が許可されます。  
© 2025 Ibuki Haga
