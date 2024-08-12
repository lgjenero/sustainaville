import 'dart:ui' as ui;

import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<ui.Image?> createSpriteSheet(List<String> spriteSheets) async {
  if (spriteSheets.isEmpty) return null;

  final List<ui.Image> images;
  try {
    // final futures = spriteSheets.map((e) => _fetchToMemory(e)).toList();
    // images = await Future.wait(futures);
    images = await Flame.images.loadAll(spriteSheets);
  } catch (_) {
    return null;
  }
  if (images.isEmpty) return null;

  final recorder = ui.PictureRecorder();
  final canvas = Canvas(recorder);
  final paint = Paint();

  for (final image in images) {
    canvas.drawImage(image, Offset.zero, paint);
  }

  final picture = recorder.endRecording();

  final width = images.first.width;
  final height = images.first.height;
  // for (final e in images) {
  //   e.dispose();
  // }

  return await picture.toImage(width, height);
}

Future<ui.Image> _fetchToMemory(String name) async {
  final data = await rootBundle.load('assets/images/$name');
  final bytes = Uint8List.view(data.buffer);
  return decodeImageFromList(bytes);
}
