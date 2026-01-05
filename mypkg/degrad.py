import rclpy
from rclpy.node import Node
from std_msgs.msg import Float64
import math


class DegToRadNode(Node):
    def __init__(self):
        super().__init__('deg_to_rad_node')

        # 入力: 角度[deg]
        self.sub_deg = self.create_subscription(Float64,'angle_deg',self.callback_deg,10)

        # 出力: 角度[rad]
        self.pub_rad = self.create_publisher(Float64,'angle_rad',10)

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
