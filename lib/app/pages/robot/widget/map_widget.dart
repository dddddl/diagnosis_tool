import 'dart:async';
import 'dart:ui' as ui;

import 'package:diagnosis_tool/domain/entities/robot_status_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'map_painter.dart';
import 'map_provider.dart';
import 'mower_painter.dart';
import 'wall_painter.dart';

class MapWidget extends ConsumerWidget {
  const MapWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapState = ref.watch(mapProvider);
    final map = mapState.map;
    final chargeImage = mapState.chargeImage;
    final chargePosition = mapState.chargePosition;
    final mowerImage = mapState.mowerImage;
    final mowerPosition = mapState.mowerPosition;
    final mowerPath = mapState.mowerPath;
    final left = mapState.dragViewOffset.dx;
    final top = mapState.dragViewOffset.dy;
    final size = Size(
        (map?.width ?? 0).roundToDouble(), (map?.height ?? 0).roundToDouble());
    final scale = mapState.currentScale;
    final walls = mapState.walls;
    final currentWall = mapState.currentWall;
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
              child: RepaintBoundary(
                child: CustomPaint(
                  size: size,
                  painter: MapPainter(map, chargeImage, chargePosition, scale),
                ),
              ),
            ),
          ),
          Positioned(
            left: left,
            top: top,
            child: Transform.scale(
                scale: scale,
                child: RepaintBoundary(
                  child: CustomPaint(
                    size: size,
                    painter: MowerPainter(scale, mowerImage, mowerPosition, mowerPath),
                  ),
                )),
          ),
          Positioned(
            left: left,
            top: top,
            child: Transform.scale(
                scale: scale,
                child: RepaintBoundary(
                  child: CustomPaint(
                    size: size,
                    painter: WallPainter(walls, currentWall: currentWall),
                  ),
                )),
          ),
          // Positioned(
          //   bottom: 0,
          //   right: 0,
          //   child: Row(
          //     children: [
          //       TextButton(
          //         onPressed: () {
          //           ref.read(mapProvider.notifier).wallMode();
          //         },
          //         child: const Text('虚拟墙'),
          //       ),
          //       TextButton(
          //         onPressed: () {},
          //         child: const Text('禁区'),
          //       ),
          //       TextButton(
          //         onPressed: () {
          //           ref.read(mapProvider.notifier).normalMode();
          //         },
          //         child: const Text('普通'),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
