import 'dart:io';

import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:logger/src/outputs/file_output.dart';
import 'package:path_provider/path_provider.dart';

abstract class LogUtils {
  static Logger? _logger;

  static Future<MultiOutput> _createOutput() async {
    File logFiles = File(
        '${(await getTemporaryDirectory()).path}/logs/${_formatTimestamp()}.txt');
    logFiles = await logFiles.create(recursive: true);

    return MultiOutput([
      FileOutput(file: logFiles),
      ConsoleOutput(),
    ]);
  }

  static String _formatTimestamp() {
    var format = DateFormat('yyyy-MM-dd');
    return format.format(DateTime.now());
  }

  static Future<Logger> _getLogger() async {
    _logger ??= Logger(
      filter: ProductionFilter(),
      printer: SimplePrinter(),
      output: await _createOutput(),
    );
    return _logger!;
  }

  static void log(String message) {
    _getLogger().then((logger) => logger.i(message));
  }
}
