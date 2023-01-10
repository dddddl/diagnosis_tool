import 'dart:async';
import 'dart:ui' as ui;

import 'package:diagnosis_tool/domain/entities/robot_status_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'map_provider.dart';
import 'wall_painter.dart';

class MapWidget extends ConsumerWidget {
  const MapWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final map = ref.watch(mapProvider.select((value) => value.map));
    final chargeImage =
        ref.watch(mapProvider.select((value) => value.chargeImage));
    final chargePosition =
        ref.watch(mapProvider.select((value) => value.chargePosition));
    final mowerImage =
        ref.watch(mapProvider.select((value) => value.mowerImage));
    final mowerPosition =
        ref.watch(mapProvider.select((value) => value.mowerPosition));
    final left =
        ref.watch(mapProvider.select((value) => value.dragViewOffset)).dx;
    final top =
        ref.watch(mapProvider.select((value) => value.dragViewOffset)).dy;
    final size = Size(
        (map?.width ?? 0).roundToDouble(), (map?.height ?? 0).roundToDouble());

    final scale = ref.watch(mapProvider.select((value) => value.currentScale));

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onScaleStart: (d) => ref.read(mapProvider.notifier).handleScaleStart(d),
      onScaleUpdate: (d) => ref.read(mapProvider.notifier).handleScaleUpdate(d),
      onScaleEnd: (d) => ref.read(mapProvider.notifier).handleScaleEnd(d),
      child: Stack(
        children: [
          Positioned(
            left: left,
            top: top,
            child: Transform.scale(
              scale: scale,
              child: CustomPaint(
                size: size,
                painter: MapPainter(
                  map,
                  chargeImage,
                  chargePosition,
                  scale,
                  mowerImage,
                  mowerPosition,
                ),
              ),
            ),
          ),
          Positioned(
            left: left,
            top: top,
            child: Transform.scale(
              scale: scale,
              child: CustomPaint(
                size: size,
                painter: WallPainter(
                    ref.watch(mapProvider.select((value) => value.walls)),
                    currentWall: ref.watch(
                        mapProvider.select((value) => value.currentWall))),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Row(
              children: [
                TextButton(
                  onPressed: () {
                    ref.read(mapProvider.notifier).wallMode();
                  },
                  child: const Text('虚拟墙'),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('禁区'),
                ),
                TextButton(
                  onPressed: () {
                    ref.read(mapProvider.notifier).normalMode();
                  },
                  child: const Text('普通'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MapPainter extends CustomPainter {
  ui.Image? mapImage;
  ui.Image? chargeImage;
  ui.Image? mowerImage;

  List<int>? chargePosition;
  Position? mowerPosition;

  double scale = 1;
  double defaultScale = 0.5;

  Rect dstRect = Rect.zero;
  Paint painter = Paint();


  MapPainter(this.mapImage, this.chargeImage,this.chargePosition, this.scale, this.mowerImage, this.mowerPosition)
      : super();

  @override
  void paint(Canvas canvas, Size size) {
    if (mapImage != null) {
      canvas.drawImage(mapImage!, Offset.zero, Paint());
    }
    final dstScale = defaultScale / scale;
    print(chargePosition);
    print(chargeImage);

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

    final mower = mowerImage;
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
  bool shouldRepaint(MapPainter oldDelegate) {
    return false;
  }
}
