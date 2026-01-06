#!/usr/bin/python3
# SPDX-FileCopyrightText: 2026 Ibuki Haga
# SPDX-License-Identifier: BSD-3-Clause

import launch
import launch.actions
import launch.substitutions
import launch_ros.actions

def generate_launch_description():

    talker = launch_ros.actions.Node(
            package='mypkg',
            executable='talker',
            )
    degrad = launch_ros.actions.Node(
            package='mypkg',
            executable='degrad',
            )

    listener = launch_ros.actions.Node(
            package='mypkg',
            executable='listener',
            output='screen'
            )
    
    # 5秒後に launch 全体を終了する TimerAction
    stop_launch = launch.actions.TimerAction(
        period=5.0,
        actions=[launch.actions.EmitEvent(event=launch.events.Shutdown())]
    )

    return launch.LaunchDescription([
        talker, 
        degrad, 
        listener, 
        stop_launch
    ])
