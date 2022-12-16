import 'package:diagnosis_tool/app/pages/robot/map/map_widget.dart';
import 'package:diagnosis_tool/app/pages/robot/robot_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RobotPage extends ConsumerStatefulWidget {
  RobotPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return RobotConsumerState();
  }
}

class RobotConsumerState extends ConsumerState<RobotPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final image = ref.watch(robotProvider.select((value) => value.image));

    print('image is null ${image == null}');
    return Scaffold(
      appBar: AppBar(
        title: Text('Robot'),
      ),
      body: Container(
        color: const Color(0xFFF5F5F5),
        child: CustomPaint(
          size: const Size(double.infinity, double.infinity),
          painter: MapWidget(image),
        ),
      ),
    );
  }
}
