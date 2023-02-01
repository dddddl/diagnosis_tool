import 'package:diagnosis_tool/app/pages/robots/robot_list_provider.dart';
import 'package:diagnosis_tool/domain/entities/robot.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../robot/robot_provider.dart';

class RobotListPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Robot> robots =
        ref.watch(robotListProvider.select((value) => value.robots)) ?? [];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Robot List'),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: robots.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("Robot mac ${robots[index].mac ?? 'Robot $index'}"),
            onTap: () {
              ref.read(robotIdProvider.notifier).state = robots[index].mac ?? '';
              context.pushNamed('robot', queryParams: {
                'mac': robots[index].mac,
              });
            },
          );
        },
      ),
    );
  }
}
