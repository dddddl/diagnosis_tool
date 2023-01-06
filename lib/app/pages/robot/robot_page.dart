import 'package:diagnosis_tool/app/di/logger_provider.dart';
import 'package:diagnosis_tool/app/pages/robot/robot_provider.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'widget/map_widget.dart';
import 'widget/machine_state_widget.dart';

class RobotPage extends HookConsumerWidget {
  String mac;

  RobotPage({Key? key, required this.mac}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final image = ref.watch(robotProvider.select((value) => value.image));
    //
    // ref.read(logger).i('image is null ${image == null}');

    useEffect(() {
      ref.read(robotProvider.notifier).listenRobotState(mac);
      return null;
    }, const []);

    return Scaffold(
        appBar: AppBar(
          title: Text('Robot'),
        ),
        body: Container(
          color: const Color(0xFFF5F5F5),
          // child: ClipperImage2(image: image),
          child: Stack(
            children: const [
              MapWidget(),
              MachineStateWidget(),
            ],
            // MapWidget(),
          ),
        ));
  }
}
