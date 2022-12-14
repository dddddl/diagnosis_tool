import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SuccessPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('添加成功'),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                  padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                  child: Text('连接设备', style: TextStyle(fontSize: 28))),
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 64),
                  child: SpinKitRipple(
                    color: Theme.of(context).backgroundColor,
                    size: 200,
                  ),
                ),
              ),
              const Expanded(child: SizedBox()),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: TextButton(
                    onPressed: () {
                      context.go('/home');
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xFF1296DB)),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                      fixedSize: MaterialStateProperty.all(const Size(343, 48)),
                    ),
                    child: const Text("返回首页"),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
