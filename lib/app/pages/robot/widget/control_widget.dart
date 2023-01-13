import 'package:diagnosis_tool/app/pages/robot/robot_provider.dart';
import 'package:diagnosis_tool/domain/entities/machine_state.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ControlWidget extends ConsumerWidget {
  const ControlWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final machineState = ref.watch(robotProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          child: RawMaterialButton(
            onPressed: () {
              ref.read(robotProvider.notifier).charge(
                  machineState.robotState.machineState ==
                      MachineState.returning);
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 0,
            fillColor: Colors.black12,
            padding: const EdgeInsets.fromLTRB(60, 15, 60, 15),
            child: Text(
              machineState.robotState.machineState == MachineState.returning
                  ? '回充中'
                  : '回充',
              style: const TextStyle(color: Colors.black45),
            ),
          ),
        ),
        Container(
          child: RawMaterialButton(
            onPressed: () {
              ref.read(robotProvider.notifier).mower(
                  machineState.robotState.machineState == MachineState.mowing);
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 0,
            fillColor: Colors.black12,
            padding: const EdgeInsets.fromLTRB(60, 15, 60, 15),
            child: Text(
              machineState.robotState.machineState == MachineState.mowing
                  ? '暂停'
                  : '割草',
              style: const TextStyle(color: Colors.black45),
            ),
          ),
        ),
      ],
    );
  }
}
