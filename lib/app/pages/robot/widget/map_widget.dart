import 'dart:async';

import 'package:diagnosis_tool/domain/entities/robot_status_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'map_provider.dart';
import '../robot_provider.dart';
import 'wall_painter.dart';

class MapWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ui.Image? image = ref.watch(mapProvider.select((value) => value.image));
    ui.Image? chargeImage =
        ref.watch(mapProvider.select((value) => value.chargeImage));
    List<int> chargePosition =
        ref.watch(mapProvider.select((value) => value.chargePosition));

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
                size: Size((image?.width ?? 0).roundToDouble(),
                    (image?.height ?? 0).roundToDouble()),
                painter: MapPainter(image),
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
                size: Size((image?.width ?? 0).roundToDouble(),
                    (image?.height ?? 0).roundToDouble()),
                painter: ChargePainter(chargeImage, chargePosition),
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
                size: Size((image?.width ?? 0).roundToDouble(),
                    (image?.height ?? 0).roundToDouble()),
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

  ChargePainter(this.image, this.chargePosition) : super();

  @override
  void paint(Canvas canvas, Size size) {
    if (image != null) {
      canvas.drawImage(
          image!,
          Offset(chargePosition[0].roundToDouble() - image!.width / 2,
              chargePosition[1].roundToDouble() - image!.height / 2),
          Paint());
    }
  }

  @override
  bool shouldRepaint(ChargePainter oldDelegate) {
    return false;
  }
}
