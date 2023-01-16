import 'dart:ui' as ui;

import 'package:diagnosis_tool/domain/entities/robot_status_entity.dart';
import 'package:flutter/material.dart';

class MowerPainter extends CustomPainter {
  ui.Image? mowerImage;

  Position? mowerPosition;
  List<Position> mowerPath;

  double scale = 1;
  double defaultScale = 0.5;

  Rect dstRect = Rect.zero;
  Paint painter = Paint();

  MowerPainter(this.scale, this.mowerImage, this.mowerPosition, this.mowerPath)
      : super();

  @override
  void paint(Canvas canvas, Size size) {
    final dstScale = defaultScale / scale;

    final mower = mowerImage;


    final mowerPath = this.mowerPath;

    if (mowerPath.isNotEmpty) {
      final paint = Paint()
        ..color = Colors.white70
        ..strokeWidth = 2
        ..style = PaintingStyle.stroke;
      final path = Path();
      path.moveTo(mowerPath[0].x!, mowerPath[0].y!);
      for (var i = 1; i < mowerPath.length; i++) {
        path.lineTo(mowerPath[i].x!, mowerPath[i].y!);
      }
      canvas.drawPath(path, paint);
      drawMower(mowerPath, mower, dstScale, canvas);
    }
  }

  void drawMower(List<Position> mowerPath, ui.Image? mower, double dstScale, ui.Canvas canvas) {
    final mowerPosition = mowerPath.last;
    final x = mowerPosition?.x;
    final y = mowerPosition?.y;
    final z = mowerPosition?.z;
    final w = mowerPosition?.w;

    if (mower != null && x != null && y != null && z != null && w != null) {
      final width = mower.width.toDouble();
      final height = mower.height.toDouble();
      Size imgSize = Size(width, height);

      dstRect = Rect.fromCenter(
          center: Offset(x, y),
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
      canvas.drawImageRect(mower, inputRect, dstRect, painter);
    }
  }

  @override
  bool shouldRepaint(MowerPainter oldDelegate) {
    return oldDelegate.mowerPosition != mowerPosition ||
        oldDelegate.mowerPath != mowerPath ||
        oldDelegate.mowerImage != mowerImage ||
        oldDelegate.scale != scale;
  }
}
