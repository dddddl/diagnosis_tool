import 'package:diagnosis_tool/app/pages/robot/robot_provider.dart';
import 'package:diagnosis_tool/domain/entities/machine_state.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ControlWidget extends ConsumerWidget {
  const ControlWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final machineState = ref.watch(robotProvider);
    final mqttConnected =
        ref.watch(robotProvider.select((value) => value.mqttConnected));
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          child: RawMaterialButton(
            onPressed: () {
              ref.read(robotProvider.notifier).charge(
                  machineState.robotState.machineState ==
                      MachineState.returning);

              if (!ref.watch(
                  robotProvider.select((value) => value.mqttConnected))) {
                SnackBar snackBar = const SnackBar(
                  content: Text('发送失败'),
                  duration: Duration(seconds: 1),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
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
              style: TextStyle(
                  color: mqttConnected ? Colors.black : Colors.black45),
            ),
          ),
        ),
        Container(
          child: RawMaterialButton(
            onPressed: () {
              ref.read(robotProvider.notifier).mower(
                  machineState.robotState.machineState == MachineState.mowing);

              if (!ref.watch(
                  robotProvider.select((value) => value.mqttConnected))) {
                SnackBar snackBar = const SnackBar(
                  content: Text('发送失败'),
                  duration: Duration(seconds: 1),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
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
              style: TextStyle(
                  color: mqttConnected ? Colors.black : Colors.black45),
            ),
          ),
        ),
      ],
    );
  }
}
