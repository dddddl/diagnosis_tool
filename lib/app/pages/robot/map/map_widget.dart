
import 'package:flutter/cupertino.dart';
import 'dart:ui' as ui;

class MapWidget extends CustomPainter {
  ui.Image? image;

  MapWidget(this.image) : super();

  @override
  void paint(Canvas canvas, Size size) {

    if (image != null) {
      canvas.drawImage(image!, Offset.zero, Paint());
    }
  }

  @override
  bool shouldRepaint(MapWidget oldDelegate) {


    return true;
  }
}
