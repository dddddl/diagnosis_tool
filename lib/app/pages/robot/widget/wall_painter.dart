import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wall_painter.freezed.dart';

@freezed
class WallData with _$WallData {
  // Offset start;
  // Offset end;
  // bool selected;

  const factory WallData({
    required Offset start,
    required Offset end,
    required bool selected,
  }) = _WallData;
}

class WallPainter extends CustomPainter {
  List<WallData>? walls = [];
  WallData? currentWall;
  Paint? linePainter;

  WallPainter(this.walls, {this.currentWall}) : super() {
    linePainter = Paint()
      ..color = const Color(0x7F000000)
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true;
  }

  @override
  void paint(Canvas canvas, Size size) {

    if (walls != null) {
      for (var wall in walls!) {
        canvas.drawLine(wall.start, wall.end, linePainter!);
      }
    }

    if (currentWall != null) {
      print('currentWall ${currentWall!.start} ${currentWall!.end}');
      canvas.drawLine(currentWall!.start, currentWall!.end, linePainter!);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return (oldDelegate as WallPainter).walls != walls ||
        (oldDelegate).currentWall != currentWall;
  }
}
