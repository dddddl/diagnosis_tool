class IotException implements Exception {

  IotException([this.message]);

  final String? message;

  @override
  String toString() => 'IotException($message)';
}
