class TimeZoneUtil {
  static String createGmtOffsetString(
      bool includeGmt, bool includeMinuteSeparator, int offsetMillis) {
    int offsetMinutes = offsetMillis ~/ 60000;
    String sign = '+';
    if (offsetMinutes < 0) {
      sign = '-';
      offsetMinutes = -offsetMinutes;
    }
    StringBuffer builder = StringBuffer();
    if (includeGmt) {
      builder.write('GMT');
    }
    builder.write(sign);
    _appendNumber(builder, 2, offsetMinutes ~/ 60);
    if (includeMinuteSeparator) {
      builder.write(':');
    }
    _appendNumber(builder, 2, offsetMinutes % 60);
    return builder.toString();
  }

  static void _appendNumber(StringBuffer builder, int count, int value) {
    String string = value.toString();
    for (int i = 0; i < count - string.length; i++) {
      builder.write('0');
    }
    builder.write(string);
  }
}
