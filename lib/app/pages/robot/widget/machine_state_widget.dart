import 'package:diagnosis_tool/domain/entities/robot_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../robot_provider.dart';

class MachineStateWidget extends ConsumerWidget {
  const MachineStateWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    RobotState robotState = ref.watch(robotProvider.select((value) => value.robotState));

    return Positioned(
      bottom: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              '名称: ${robotState.name}'),
          Text(
              '当前状态: ${robotState.machineState}'),
          Text(
              '电量:  ${robotState.power}%'),
          Text(
              '最近上线时间:  ${robotState.timestamp}'),
          Text(
              '今日累计割草面积:  ${robotState.acreage} m²'),
          Text(
              '今日累计割草时长:  ${robotState.duration} min'),
          Text(
              '行驶速度:  ${robotState.moveSpeed} m/s'),
          Text(
              '电机转速:  ${robotState.motorRotateSpeed} r/s'),
          Text(
              '当前位置信息:  ${robotState.position}'),
        ],
      ),
    );
  }
}
