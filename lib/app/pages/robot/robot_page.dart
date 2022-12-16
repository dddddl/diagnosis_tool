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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Robot'),
      ),
      body: Center(
        child: Text('Robot'),
      ),
    );
  }
}
