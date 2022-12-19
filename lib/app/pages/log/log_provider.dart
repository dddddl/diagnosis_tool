
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LogState {

}

final logProvider =
    StateNotifierProvider.autoDispose<LogStateNotifier, LogState>(
        (ref) => LogStateNotifier());

class LogStateNotifier extends StateNotifier<LogState> {
  LogStateNotifier() : super(LogState()) {
    getAllLogs();
  }

  void getAllLogs() {

  }

  void clearLogs() {}

  void exportLogs() {

  }
}
