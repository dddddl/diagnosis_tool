import 'package:diagnosis_tool/app/pages/home/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerWidget {
  static const List<Map<String, String>> source = [
    {"icon": "assets/images/ic_upload", "title": "添加设备", "route": "/prepare"},
    {"icon": "assets/images/ic_upload", "title": "机器人列表", "route": "/prepare"},
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('调试工具'),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: source
                .map((e) => HomeItemWidget(
                      icon: e["icon"]!,
                      title: e['title']!,
                      onPressed: () {
                        context.push(e['route']!);
                      },
                    ))
                .toList(),
          ),
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
