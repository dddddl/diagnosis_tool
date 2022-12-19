import 'dart:io';
import 'package:intl/intl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:logger/src/log_output.dart';
import 'package:logger/src/outputs/file_output.dart';
import 'package:path_provider/path_provider.dart';

final logger = Provider<Logger>((ref) {
  return Logger(
    filter: ProductionFilter(),
    printer: SimplePrinter(),
    output: ref.watch(loggerOutputProvider).value,
  );
});

final loggerOutputProvider = FutureProvider<LogOutput>((ref) async {
  File logFiles = File(
      '${(await getTemporaryDirectory()).path}/logs/${_formatTimestamp()}.txt');
  logFiles = await logFiles.create(recursive: true);

  return MultiOutput([
    FileOutput(file: logFiles),
    ConsoleOutput(),
  ]);
});

String _formatTimestamp() {
  var format = DateFormat('yyyy-MM-dd');
  return format.format(DateTime.now());
}
