import 'dart:ui' as ui;

import 'package:diagnosis_tool/domain/entities/robot_status_entity.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'map_provider.dart';
import 'wall_painter.dart';

class MapWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ui.Image? map = ref.watch(mapProvider.select((value) => value.map));
    ui.Image? chargeImage =
        ref.watch(mapProvider.select((value) => value.chargeImage));
    List<int> chargePosition =
        ref.watch(mapProvider.select((value) => value.chargePosition));
    ui.Image? mowerImage =
        ref.watch(mapProvider.select((value) => value.mowerImage));
    final mowerPosition =
        ref.watch(mapProvider.select((value) => value.mowerPosition));

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onScaleStart: (d) => ref.read(mapProvider.notifier).handleScaleStart(d),
      onScaleUpdate: (d) => ref.read(mapProvider.notifier).handleScaleUpdate(d),
      onScaleEnd: (d) => ref.read(mapProvider.notifier).handleScaleEnd(d),
      child: Stack(
        children: [
          Positioned(
            left: ref
                .watch(mapProvider.select((value) => value.dragViewOffset))
                .dx,
            top: ref
                .watch(mapProvider.select((value) => value.dragViewOffset))
                .dy,
            child: Transform.scale(
              scale:
                  ref.watch(mapProvider.select((value) => value.currentScale)),
              child: CustomPaint(
                size: Size((map?.width ?? 0).roundToDouble(),
                    (map?.height ?? 0).roundToDouble()),
                painter: MapPainter(map),
              ),
            ),
          ),
          Positioned(
            left: ref
                .watch(mapProvider.select((value) => value.dragViewOffset))
                .dx,
            top: ref
                .watch(mapProvider.select((value) => value.dragViewOffset))
                .dy,
            child: Transform.scale(
              scale:
                  ref.watch(mapProvider.select((value) => value.currentScale)),
              child: CustomPaint(
                size: Size((map?.width ?? 0).roundToDouble(),
                    (map?.height ?? 0).roundToDouble()),
                painter: ChargePainter(
                    chargeImage,
                    chargePosition,
                    ref.watch(
                        mapProvider.select((value) => value.currentScale))),
              ),
            ),
          ),
          Positioned(
            left: ref
                .watch(mapProvider.select((value) => value.dragViewOffset))
                .dx,
            top: ref
                .watch(mapProvider.select((value) => value.dragViewOffset))
                .dy,
            child: Transform.scale(
              scale:
                  ref.watch(mapProvider.select((value) => value.currentScale)),
              child: CustomPaint(
                size: Size((map?.width ?? 0).roundToDouble(),
                    (map?.height ?? 0).roundToDouble()),
                painter: MowerPainter(
                    mowerImage,
                    mowerPosition,
                    ref.watch(
                        mapProvider.select((value) => value.currentScale))),
              ),
            ),
          ),
          Positioned(
            left: ref
                .watch(mapProvider.select((value) => value.dragViewOffset))
                .dx,
            top: ref
                .watch(mapProvider.select((value) => value.dragViewOffset))
                .dy,
            child: Transform.scale(
              scale:
                  ref.watch(mapProvider.select((value) => value.currentScale)),
              child: CustomPaint(
                size: Size((map?.width ?? 0).roundToDouble(),
                    (map?.height ?? 0).roundToDouble()),
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
  ui.Image? image;

  MapPainter(this.image) : super();

  @override
  void paint(Canvas canvas, Size size) {
    if (image != null) {
      canvas.drawImage(image!, Offset.zero, Paint());
    }
  }

  @override
  bool shouldRepaint(MapPainter oldDelegate) {
    return false;
  }
}

class ChargePainter extends CustomPainter {
  ui.Image? image;
  List<int> chargePosition = [0, 0];
  double scale = 1;
  Paint painter = Paint();
  double defaultScale = 0.5;

  ChargePainter(this.image, this.chargePosition, this.scale) : super();

  @override
  void paint(Canvas canvas, Size size) {
    if (image != null) {
      final width = image!.width.toDouble();
      final height = image!.height.toDouble();
      Size imgSize = Size(width, height);

      final dstScale = defaultScale / scale;
      Rect dstRect = Rect.fromCenter(
          center: Offset(chargePosition[0].roundToDouble(),
              chargePosition[1].roundToDouble()),
          width: width * dstScale,
          height: height * dstScale);

      // 根据适配模式，计算适合的缩放尺寸
      FittedSizes fittedSizes =
          applyBoxFit(BoxFit.scaleDown, imgSize, dstRect.size);
      // 获得一个图片区域中，指定大小的，居中位置处的 Rect
      Rect inputRect =
          Alignment.center.inscribe(fittedSizes.source, Offset.zero & imgSize);
      // 获得一个绘制区域内，指定大小的，居中位置处的 Rect
      Rect outputRect =
          Alignment.center.inscribe(fittedSizes.destination, dstRect);
      canvas.drawImageRect(image!, inputRect, outputRect, painter);
    }
  }

  @override
  bool shouldRepaint(ChargePainter oldDelegate) {
    return false;
  }
}

class MowerPainter extends CustomPainter {
  ui.Image? image;
  Position? chargePosition;

  double scale = 1;
  Paint painter = Paint();
  double defaultScale = 0.5;

  MowerPainter(this.image, this.chargePosition, this.scale) : super();

  @override
  void paint(Canvas canvas, Size size) {
    print('MowerPainter paint');
    final momer = image;
    final x = chargePosition?.x;
    final y = chargePosition?.y;
    final z = chargePosition?.z;
    final w = chargePosition?.w;

    if (momer != null && x != null && y != null && z != null && w != null) {
      final width = image!.width.toDouble();
      final height = image!.height.toDouble();
      Size imgSize = Size(width, height);

      final dstScale = defaultScale / scale;
      Rect dstRect = Rect.fromCenter(
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
      Rect outputRect =
          Alignment.center.inscribe(fittedSizes.destination, dstRect);
      canvas.drawImageRect(momer, inputRect, outputRect, painter);
    }
  }

  @override
  bool shouldRepaint(MowerPainter oldDelegate) {
    return false;
  }
}
