import rclpy
from rclpy.node import Node
from std_msgs.msg import Float64

rclpy.init()
node = Node("listener")

def cb(msg):
    global node
    node.get_logger().info("Listen: %f:" % msg.data)

def main():
    sub = node.create_subscription(Float64, "angle_rad", cb, 10)
    rclpy.spin(node)
