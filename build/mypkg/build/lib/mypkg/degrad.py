import rclpy
from rclpy.node import Node
from std_msgs.msg import Float64
import math
from rclpy.qos import QoSProfile, DurabilityPolicy

class DegToRadNode(Node):
    def __init__(self):
        super().__init__('deg_to_rad_node')

        # 入力: 角度[deg]
        self.sub_deg = self.create_subscription(Float64, 'angle_deg', self.callback_deg, 10)

        # QoS設定（過去データを保存する）
        qos = QoSProfile(depth=10)
        qos.durability = DurabilityPolicy.TRANSIENT_LOCAL

        # 出力: 角度[rad]
        self.pub_rad = self.create_publisher(Float64, 'angle_rad', qos)

    def callback_deg(self, msg):
        rad = math.radians(msg.data)   # = msg.data * pi / 180
        out = Float64()
        out.data = rad
        self.pub_rad.publish(out)

        self.get_logger().info(f"{msg.data:.3f} deg  ->  {rad:.5f} rad")

def main(args=None):
    rclpy.init(args=args)
    node = DegToRadNode()
    rclpy.spin(node)
    node.destroy_node()
    rclpy.shutdown()


if __name__ == '__main__':
    main()
