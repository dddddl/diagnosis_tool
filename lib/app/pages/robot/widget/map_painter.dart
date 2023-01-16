import 'dart:ui' as ui;

import 'package:diagnosis_tool/domain/entities/robot_status_entity.dart';
import 'package:flutter/material.dart';

class MapPainter extends CustomPainter {
  ui.Image? mapImage;
  ui.Image? chargeImage;

  List<int>? chargePosition;

  double scale = 1;
  double defaultScale = 0.5;

  Rect dstRect = Rect.zero;
  Paint painter = Paint();

  MapPainter(this.mapImage, this.chargeImage, this.chargePosition, this.scale)
      : super();

  @override
  void paint(Canvas canvas, Size size) {
    if (mapImage != null) {
      canvas.drawImage(mapImage!, Offset.zero, Paint());
    }
    final dstScale = defaultScale / scale;

    if (chargeImage != null && chargePosition != null) {
      final width = chargeImage!.width.toDouble();
      final height = chargeImage!.height.toDouble();
      Size imgSize = Size(width, height);

      dstRect = Rect.fromCenter(
          center: Offset(chargePosition![0].roundToDouble(),
              chargePosition![1].roundToDouble()),
          width: width * dstScale,
          height: height * dstScale);

      // 根据适配模式，计算适合的缩放尺寸
      FittedSizes fittedSizes =
      applyBoxFit(BoxFit.scaleDown, imgSize, dstRect.size);
      // 获得一个图片区域中，指定大小的，居中位置处的 Rect
      Rect inputRect =
      Alignment.center.inscribe(fittedSizes.source, Offset.zero & imgSize);
      // 获得一个绘制区域内，指定大小的，居中位置处的 Rect
      // Rect outputRect =
      //     Alignment.center.inscribe(fittedSizes.destination, dstRect);
      canvas.drawImageRect(chargeImage!, inputRect, dstRect, painter);
    }
  }

  @override
  bool shouldRepaint(MapPainter oldDelegate) {
    return oldDelegate.mapImage != mapImage ||
        oldDelegate.chargeImage != chargeImage ||
        oldDelegate.chargePosition != chargePosition ||
        oldDelegate.scale != scale;
  }
}