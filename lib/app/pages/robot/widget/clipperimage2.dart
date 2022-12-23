import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'map_widget.dart';

class ClipperImage2 extends StatefulWidget {
  ui.Image? image;

  ClipperImage2({Key? key, required this.image}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ClipperState();
  }
}

class _ClipperState extends State<ClipperImage2> {
  GlobalKey _contentGlobalKey = GlobalKey();

  ///图片的唯一KEY
  GlobalKey _pictureGlobalKey = GlobalKey();

  double viewWidth = 125;
  double viewHeight = 196;

  double imageOriginWidth = 750;
  double imageOriginHeight = 1181;

  double _currentScale = 1.0;
  Offset _pictureDefOffset = Offset(100, 100);
  Offset _dragViewOffset = Offset(100, 100);

  double _lastViewScale = 1.0;
  late Offset _lastViewPoint;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: _contentGlobalKey,
      onScaleStart: _handleScaleStart,
      onScaleUpdate: (d) => _handleScaleUpdate(context.size, d),
      onScaleEnd: _handleScaleEnd,
      child: Stack(
        children: [
          Positioned(
            left: _dragViewOffset.dx,
            top: _dragViewOffset.dy,
            child: Transform.scale(
              scale: _currentScale,
              child: CustomPaint(
                size: const Size(300, 300),
                painter: MapPainter(widget.image),
              ),
            ),
          ),
          //
          // CustomPaint(
          //   painter:
          //       DrawRectLight(Size(viewWidth, viewHeight), _pictureDefOffset),
          //   size: Size(double.infinity, double.infinity),
          // ),
        ],
      ),
    );
  }

  /* Offset _getRelativePosition() {
    RenderBox imageRenderBox = _pictureGlobalKey.currentContext.findRenderObject();
    RenderBox contentRenderBox = _contentGlobalKey.currentContext.findRenderObject();
    Offset _relativePosition = imageRenderBox.globalToLocal(
      _pictureDefOffset,
      ancestor: contentRenderBox,
    );
    return _relativePosition;
  }*/

  void _handleScaleStart(ScaleStartDetails details) {
    print('_handleScaleStart');
    _lastViewScale = _currentScale;
    _lastViewPoint = details.focalPoint;
  }

  void _handleScaleUpdate(Size? size, ScaleUpdateDetails details) {
    if (details.scale != 1) {
      ///缩放
      double tempScale = _lastViewScale * details.scale;

      //缩放可以保证不小于1, 放大到多大并不管
      if (tempScale < 1) return;
      //缩放生效
      _currentScale = tempScale;
    } else {
      Offset tempPositionPoint =
          _dragViewOffset + (details.focalPoint - _lastViewPoint);
      _dragViewOffset = tempPositionPoint;
      _lastViewPoint = details.focalPoint;
    }

    // ///检测是否临界边界
    // double _correctDx = _dragViewOffset.dx;
    // double _correctDy = _dragViewOffset.dy;
    //
    // double leftVerticalLine =
    //     (viewWidth * _currentScale - viewWidth) / 2 + _pictureDefOffset.dx;
    // double topVerticalLine =
    //     (viewHeight * _currentScale - viewHeight) / 2 + _pictureDefOffset.dy;
    // double rightVerticalLine =
    //     _pictureDefOffset.dx - (leftVerticalLine - _pictureDefOffset.dx);
    // double bottomHorizontalLine =
    //     _pictureDefOffset.dy - (topVerticalLine - _pictureDefOffset.dy);
    //
    // if (_correctDx > leftVerticalLine) {
    //   _correctDx = leftVerticalLine;
    // }
    // if (_correctDy > topVerticalLine) {
    //   _correctDy = topVerticalLine;
    // }
    // if (_correctDx < rightVerticalLine) {
    //   _correctDx = rightVerticalLine;
    // }
    // if (_correctDy < bottomHorizontalLine) {
    //   _correctDy = bottomHorizontalLine;
    // }
    //
    // _dragViewOffset = Offset(_correctDx, _correctDy);

    setState(() {});
  }

  void _handleScaleEnd(ScaleEndDetails details) {
    setState(() {});
  }

  void saveClipperInfo() {
    int clipWidth = (imageOriginWidth / _currentScale).round();
    int clipHeight = (imageOriginHeight / _currentScale).round();

    int offsetX =
        ((((viewWidth * _currentScale - viewWidth) / 2 + _pictureDefOffset.dx) -
                    _dragViewOffset.dx) *
                (imageOriginWidth / (viewWidth * _currentScale)))
            .abs()
            .round();
    int offsetY = ((((viewHeight * _currentScale - viewHeight) / 2 +
                    _pictureDefOffset.dy) -
                _dragViewOffset.dy) *
            (imageOriginHeight / (viewHeight * _currentScale)))
        .abs()
        .round();

    print(
        "?x-oss-process=image/crop,"
            "x_$offsetX,"
            "y_$offsetY,"
            "w_$clipWidth,"
            "h_$clipHeight");
  }
}

class DrawRectLight extends CustomPainter {
  Size _pictureSize;
  Offset _pictureOffset;

  DrawRectLight(this._pictureSize, this._pictureOffset);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();

    paint
      ..style = PaintingStyle.fill
      ..color = Color(0xaa000000);

    ///假设是中心点
    canvas.clipRect(
      Rect.fromLTRB(
        _pictureOffset.dx,
        _pictureOffset.dy,
        _pictureOffset.dx + _pictureSize.width,
        _pictureOffset.dy + _pictureSize.height,
      ),
      clipOp: ClipOp.difference,
    );

    canvas.drawRect(Rect.fromLTRB(0, 0, size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
