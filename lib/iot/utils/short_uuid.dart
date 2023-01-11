import 'package:uuid/uuid.dart';

class ShortUuid {
  static const List<String> chars = [
    "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o",
    "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3",
    "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "I",
    "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X",
    "Y", "Z"
  ];

  static String generateShortUuid() {
    final shortBuffer = StringBuffer();
    final uuid = const Uuid().v4().replaceAll("-", "");

    for (var i = 0; i < 8; i++) {
      final str = uuid.substring(i * 4, i * 4 + 4);
      final x = int.parse(str, radix: 16);
      shortBuffer.write(chars[x % 0x3E]);
    }

    return shortBuffer.toString();
  }
}