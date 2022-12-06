import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
    );
  }
}
