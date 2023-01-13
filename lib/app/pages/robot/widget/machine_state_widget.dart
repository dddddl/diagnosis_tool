import 'package:diagnosis_tool/domain/entities/robot_status_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../robot_provider.dart';
import 'control_widget.dart';

class MachineStateWidget extends ConsumerWidget {
  const MachineStateWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    RobotState robotState =
        ref.watch(robotProvider.select((value) => value.robotState));

    return Positioned(
      bottom: 0,
      child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.blueAccent],
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 70,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 24),
                        Text('状态：${robotState.machineState ?? '无'}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        const Spacer(),
                        Text('电量：${robotState.power ?? 0}%',
                            style: const TextStyle(color: Colors.white)),
                        const SizedBox(width: 24),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 24),
                        Text('${robotState.duration ?? 0}min',
                            style: const TextStyle(color: Colors.white70)),
                        const SizedBox(width: 24),
                        Text('${robotState.acreage ?? 0}m²',
                            style: const TextStyle(color: Colors.white70)),
                        const SizedBox(width: 24),
                        Text('${robotState.motorRotateSpeed ?? 0}r/s',
                            style: const TextStyle(color: Colors.white70)),
                        const SizedBox(width: 24),
                        Text('${robotState.moveSpeed ?? 0}m/s',
                            style: const TextStyle(color: Colors.white70)),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Colors.white),
                child: const ControlWidget(),
              ),
            ],
          )),
    );
  }
}
