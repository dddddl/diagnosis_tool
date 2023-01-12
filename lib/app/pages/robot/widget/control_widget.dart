import 'package:diagnosis_tool/app/pages/robot/robot_provider.dart';
import 'package:diagnosis_tool/domain/entities/machine_state.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ControlWidget extends ConsumerWidget {
  const ControlWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final machineState = ref.watch(robotProvider);
    print("control widget build");
    return Positioned(
        bottom: 30,
        right: 0,
        child: Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: RawMaterialButton(
                onPressed: () {
                  ref
                      .read(robotProvider.notifier)
                      .charge(machineState.robotState.machineState == MachineState.returning);
                },
                shape: const CircleBorder(),
                elevation: 2.0,
                fillColor: Colors.green,
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  machineState.robotState.machineState == MachineState.returning ? '回充中' : '回充',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: RawMaterialButton(
                onPressed: () {
                  ref
                      .read(robotProvider.notifier)
                      .mower(machineState.robotState.machineState == MachineState.mowing);
                },
                shape: const CircleBorder(),
                elevation: 2.0,
                fillColor: Colors.green,
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  machineState.robotState.machineState == MachineState.mowing ? '暂停' : '割草',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: RawMaterialButton(
                onPressed: () {
                  ref
                      .read(robotProvider.notifier)
                      .map(machineState.robotState.machineState == MachineState.mapping);
                },
                shape: const CircleBorder(),
                elevation: 2.0,
                fillColor: Colors.green,
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  machineState.robotState.machineState == MachineState.mapping ? '建图中' : '建图',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ));
  }
}
