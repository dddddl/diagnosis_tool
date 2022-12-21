import 'package:diagnosis_tool/app/pages/home/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  final List<Map<String, String>> source = [
    {"icon": "assets/images/ic_upload", "title": "添加设备", "route": "/prepare"},
    {"icon": "assets/images/ic_upload", "title": "机器人列表", "route": "/robots"},
    {"icon": "assets/images/ic_upload", "title": "日志", "route": "/log"},
  ];

  @override
  ConsumerState createState() {
    return HomePageState();
  }
}

class HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('调试工具'),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: widget.source
                .map((e) => HomeItemWidget(
                      icon: e["icon"]!,
                      title: e['title']!,
                      onPressed: () {
                        context.push(e['route']!);
                      },
                    ))
                .toList(),
          ),
        ));
  }
}
