

import 'dart:async';

import 'package:flutter_test/flutter_test.dart';

void main() {

  // 定义一个需要测试的函数
  int add(int a, int b) => a + b;



  test('description', () {

    // 创建一个 StreamController
    final controller = StreamController<int>();

    // 创建一个 Stream
    final stream = controller.stream;

    // 注册侦听器，以便接收 StreamController 发送的数据
    // stream.listen((data) {
    //   print('Data: $data');
    // });

    // 向 StreamController 发送数据
    controller.add(1);
    controller.add(2);
    controller.add(3);

    // 关闭 StreamController
    controller.close();

    // 创建一个新的 Stream
    // final newStream = Stream.fromIterable([4, 5, 6]);
    //
    // controller.addStream(newStream);
    // 创建新的侦听器，以便接收 StreamController 发送的数据
    stream.listen((data) {
      print('New listener: $data');
    });

    expect(add(1,1), 2);

  });
}