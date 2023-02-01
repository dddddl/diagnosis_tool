import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'log_provider.dart';

class LogPage extends HookConsumerWidget {
  const LogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logState = ref.watch(logProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Log'),
        elevation: 0,
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(logProvider.notifier).exportLogs();
        },
        child: const Icon(Icons.file_download),
      ),
    );
  }
}
