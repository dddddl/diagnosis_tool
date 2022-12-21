

import 'package:diagnosis_tool/domain/entities/machine_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('MachineState', () {
    // 将数字常量映射到枚举常量
    MachineState state = MachineState.values.elementAt(0);
    print(state); // 输出: MachineState.locked

    state = MachineState.values[1];
    print(state); // 输出: MachineState.standby

    state = MachineState.values[2];
    print(state); // 输出: MachineState.mapping

    state = MachineState.values[3];
    print(state); // 输出: MachineState.mowing

    state = MachineState.values[4];
    print(state); // 输出: MachineState.returning

    state = MachineState.values[5];
    print(state); // 输出: MachineState.paused

    state = MachineState.values[6];
    print(state); // 输出: MachineState.positioning

    state = MachineState.values[7];
    print(state); // 输出: MachineState.sleep

    state = MachineState.values[8];
    print(state); // 输出: MachineState.exception

    state = MachineState.values[9];
    print(state); // 输出: MachineState.shutdown


    expect(state, isA<MachineState>());
  });
}