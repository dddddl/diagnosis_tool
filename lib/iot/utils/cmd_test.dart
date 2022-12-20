import 'dart:typed_data';

void main() {
  // 创建一个字节数组
  Uint8List bytes = Uint8List.fromList([0x80, 0xD2, 0x00, 0x01, 0x00]);
  // 使用ByteData从字节数组的指定位置读取两个字节
  int value = twoBytesToInt(bytes, 2);
  print(value); // 输出 770

  // 使用ByteData从字节数组的指定位置读取两个字节
  int value1 = twoBytesToInt(bytes, 0);
  print(value1); // 输出 770

  setRaw(bytes);
}

setRaw(Uint8List data) {
  int size = data.length;
  if (size < 4) {
    print("raw size must >= 4");
  }

  print(data);

  data[0] = data[0] & 0x7F;
  print(data);

  var id = twoBytesToInt(data, 0);
  print("id $id");

  int length = twoBytesToInt(data, 2);
  print("length $length");

  if (length != size - 4) {
    print("length size must == raw size - 4");
  }
}

int twoBytesToInt(Uint8List data, int index) {
  // 使用ByteData从字节数组的指定位置读取两个字节
  ByteData byteData = ByteData.view(data.buffer, index);
  int value = byteData.getUint16(0, Endian.big);
  return value;
}
