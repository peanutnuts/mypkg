import rclpy
from rclpy.node import Node

from std_msgs.msg import Float64

rclpy.init()
node = Node("talker")
pub = node.create_publisher(Float64, "angle_deg", 10)

n = 0.0

def cb():
    global n
    msg = Float64()
    msg.data = n
    pub.publish(msg)
    n += 1.0

def main():
    node.create_timer(0.5, cb)
    rclpy.spin(node)
"""
from person_msgs.srv import Query

rclpy.int()
node = Node("talker")

def cb(request, response):
    if request.name == "上田隆一":
        response.age = 46
    else:
        response.age = 255
    return response

def main():
    srv = node.create_service(Query, "Query", cb) #サービスの作成
    rclpy.spin(node)
"""
