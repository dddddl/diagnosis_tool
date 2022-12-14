import 'package:diagnosis_tool/app/widgets/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

import 'prepare_provider.dart';

class PreparePage extends ConsumerStatefulWidget {
  const PreparePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return PrepareConsumerState();
  }
}

class PrepareConsumerState extends ConsumerState {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('添加准备'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.fromLTRB(16, 30, 0, 0),
                child: Text(
                  "1、请确保机器人处于开机状态",
                  style: commonStyle(),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.fromLTRB(16, 12, 0, 0),
                child: Text(
                  "2、请长按回充按键6s，等待听到“进入配网模式”",
                  style: commonStyle(),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: ref
                      .watch(prepareProvider.select((value) => value.checked)),
                  onChanged: (value) {
                    ref.read(prepareProvider.notifier).updateChecked(value!);
                  },
                  shape: const CircleBorder(),
                  activeColor: const Color(0XFF274DFD),
                ),
                Text(
                  "已听到“进入配网模式”",
                  style: commonStyle(),
                  textAlign: TextAlign.center,
                )
              ],
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: TextButton(
                  onPressed: () {
                    if (!ref.watch(
                        prepareProvider.select((value) => value.checked))) {
                      SnackBar snackBar = const SnackBar(
                        content: Text('请先勾选已听到“进入配网模式”'),
                        duration: Duration(seconds: 1),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      return;
                    }

                    ref
                        .read(prepareProvider.notifier)
                        .isPermissionGranted()
                        .then((value) {
                      if (value) {
                        context.push('/wifi');
                      } else {
                        ref
                            .read(prepareProvider.notifier)
                            .requestPermissions()
                            .then((value) {
                          if (value) {
                            context.push('/wifi');
                          } else {
                            showCupertinoDialog(
                                context: context,
                                builder: (context) {
                                  return CupertinoAlertDialog(
                                    title: const Text(
                                        'You need to grant album permissions'),
                                    content: const Text(
                                        'Please go to your mobile phone to set the permission to open the corresponding album'),
                                    actions: <Widget>[
                                      CupertinoDialogAction(
                                        child: const Text('cancle'),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                      CupertinoDialogAction(
                                        child: const Text('confirm'),
                                        onPressed: () {
                                          Navigator.pop(context);
                                          // 打开手机上该app权限的页面
                                          openAppSettings();
                                        },
                                      ),
                                    ],
                                  );
                                });
                          }
                        });
                      }
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xFF1296DB)),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                    fixedSize: MaterialStateProperty.all(const Size(343, 48)),
                  ),
                  child: const Text("开始添加"),
                )),
          ],
        ),
      ),
    );
  }
}
