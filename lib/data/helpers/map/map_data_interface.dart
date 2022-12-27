import 'dart:typed_data';
import 'dart:ui';

abstract class MapDataInterface {

  Future<Image> parseMapData(ByteData mapData);

}
