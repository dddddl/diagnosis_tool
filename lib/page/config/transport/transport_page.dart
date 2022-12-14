import 'package:diagnosis_tool/router/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'transport_provider.dart';

class TransportPage extends ConsumerStatefulWidget {
  String? ssid;
  String? password;

  TransportPage({Key? key, required this.ssid, required this.password})
      : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return TransportConsumerState();
  }
}

class TransportConsumerState extends ConsumerState<TransportPage> {
  @override
  void initState() {
    super.initState();
    ref
        .read(transportProvider.notifier)
        .listenTransportState(widget.ssid, widget.password);
  }

  @override
  Widget build(BuildContext context) {
    int progress =
        ref.watch(transportProvider.select((value) => value.progress)) ?? 0;

    ref.listen<bool>(
        transportProvider.select((value) => value.isFailed ?? false),
        (previous, next) {
      if (next) {}
    });

    ref.listen<bool>(
        transportProvider.select((value) => value.isSuccess ?? false),
        (previous, next) {
      if (next) {
        context.pushNamed(AppRoute.success.name);
      }
    });

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('连接设备'),
      ),
      body: Container(
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
            Padding(
                padding: const EdgeInsets.only(top: 48),
                child: Center(
                  child: Text("设备连接网络       $progress%",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
                )),
            const Padding(
                padding: EdgeInsets.only(top: 2),
                child: Center(
                  child: Text('请将设备尽量靠近路由器',
                      style: TextStyle(
                        fontSize: 12,
                      )),
                )),
          ],
        ),
      ),
    );
  }
}
